import 'package:sqflite/sqflite.dart';

import '../../../../shared/database/database_config.dart';
import '../../../../shared/database/database_helper.dart';

/// 🗄️ Profile Local Datasource - Raw SQLite Operations (2025)
///
/// This datasource handles direct SQLite database operations for all profile-related data.
/// It provides the foundation for local development and testing, with clean separation
/// that makes backend API swapping effortless.
///
/// Key Features:
/// - Complete CRUD operations for all 6 entities
/// - Batch operations for performance
/// - Transaction support for data consistency
/// - Query optimization with proper indexing
/// - Comprehensive error handling
/// - Easy backend swap capability
///
/// Architecture Strategy:
/// - Repository calls this datasource
/// - For production: Repository calls ApiDatasource instead
/// - Same interface, different implementation
/// - Zero changes needed in business logic
///
/// Usage:
/// ```dart
/// final datasource = ProfileLocalDatasource(databaseHelper);
/// final profileData = await datasource.getProfileById('user_123');
/// ```
class ProfileLocalDatasource {
  final DatabaseHelper _databaseHelper;

  ProfileLocalDatasource(this._databaseHelper);

  /// Get database instance
  Future<Database> get _database => _databaseHelper.database;

  // ============================================================================
  // 👤 PROFILE OPERATIONS
  // ============================================================================

  /// Get profile by ID with basic information
  Future<Map<String, dynamic>?> getProfileById(String id) async {
    try {
      final db = await _database;
      final results = await db.query(
        DatabaseConfig.profilesTable,
        where: '${DatabaseConfig.profileIdColumn} = ?',
        whereArgs: [id],
      );
      return results.isNotEmpty ? results.first : null;
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get profile by ID: $id',
        e.toString(),
      );
    }
  }

  /// Get complete profile with all related data
  Future<Map<String, dynamic>?> getCompleteProfile(String profileId) async {
    try {
      final db = await _database;

      // Use transaction for consistency
      return await db.transaction((txn) async {
        // Get main profile
        final profileResults = await txn.query(
          DatabaseConfig.profilesTable,
          where: '${DatabaseConfig.profileIdColumn} = ?',
          whereArgs: [profileId],
        );

        if (profileResults.isEmpty) return null;

        final profile = Map<String, dynamic>.from(profileResults.first);

        // Get all related data in parallel for performance
        final futures = await Future.wait([
          _getPromptsByProfileId(txn, profileId),
          _getActivePollByProfileId(txn, profileId),
          _getMediaByProfileId(txn, profileId),
          _getInterestsByProfileId(txn, profileId),
          _getBadgesByProfileId(txn, profileId),
        ]);

        // Combine all data
        profile['prompts'] = futures[0];
        profile['active_poll'] = futures[1];
        profile['media'] = futures[2];
        profile['interests'] = futures[3];
        profile['badges'] = futures[4];

        return profile;
      });
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get complete profile: $profileId',
        e.toString(),
      );
    }
  }

  /// Insert new profile
  Future<void> insertProfile(Map<String, dynamic> profileData) async {
    try {
      final db = await _database;
      await db.insert(
        DatabaseConfig.profilesTable,
        profileData,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to insert profile: ${profileData['id']}',
        e.toString(),
      );
    }
  }

  /// Update existing profile
  Future<void> updateProfile(
    String id,
    Map<String, dynamic> profileData,
  ) async {
    try {
      final db = await _database;
      final rowsAffected = await db.update(
        DatabaseConfig.profilesTable,
        profileData,
        where: '${DatabaseConfig.profileIdColumn} = ?',
        whereArgs: [id],
      );

      if (rowsAffected == 0) {
        throw ProfileDatasourceException(
          'Profile not found for update: $id',
          'No rows affected',
        );
      }
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to update profile: $id',
        e.toString(),
      );
    }
  }

  /// Delete profile and all related data
  Future<void> deleteProfile(String id) async {
    try {
      final db = await _database;

      // Use transaction to ensure all related data is deleted
      await db.transaction((txn) async {
        // Delete related data first (foreign key constraints)
        await txn.delete(
          DatabaseConfig.promptsTable,
          where: '${DatabaseConfig.promptProfileIdColumn} = ?',
          whereArgs: [id],
        );

        await txn.delete(
          DatabaseConfig.pollsTable,
          where: '${DatabaseConfig.pollProfileIdColumn} = ?',
          whereArgs: [id],
        );

        await txn.delete(
          DatabaseConfig.mediaTable,
          where: '${DatabaseConfig.mediaProfileIdColumn} = ?',
          whereArgs: [id],
        );

        await txn.delete(
          DatabaseConfig.interestsTable,
          where: '${DatabaseConfig.interestProfileIdColumn} = ?',
          whereArgs: [id],
        );

        await txn.delete(
          DatabaseConfig.badgesTable,
          where: '${DatabaseConfig.badgeProfileIdColumn} = ?',
          whereArgs: [id],
        );

        // Finally delete profile
        await txn.delete(
          DatabaseConfig.profilesTable,
          where: '${DatabaseConfig.profileIdColumn} = ?',
          whereArgs: [id],
        );
      });
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to delete profile: $id',
        e.toString(),
      );
    }
  }

  /// Check if profile exists
  Future<bool> profileExists(String id) async {
    try {
      final db = await _database;
      final results = await db.query(
        DatabaseConfig.profilesTable,
        columns: [DatabaseConfig.profileIdColumn],
        where: '${DatabaseConfig.profileIdColumn} = ?',
        whereArgs: [id],
        limit: 1,
      );
      return results.isNotEmpty;
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to check profile existence: $id',
        e.toString(),
      );
    }
  }

  /// Get all profiles (for discovery, testing)
  Future<List<Map<String, dynamic>>> getAllProfiles() async {
    try {
      final db = await _database;
      return await db.query(
        DatabaseConfig.profilesTable,
        orderBy: '${DatabaseConfig.profileUpdatedAtColumn} DESC',
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get all profiles',
        e.toString(),
      );
    }
  }

  // ============================================================================
  // 💬 PROMPT OPERATIONS
  // ============================================================================

  /// Get prompts by profile ID
  Future<List<Map<String, dynamic>>> getPromptsByProfileId(
    String profileId,
  ) async {
    final db = await _database;
    return await _getPromptsByProfileId(db, profileId);
  }

  Future<List<Map<String, dynamic>>> _getPromptsByProfileId(
    DatabaseExecutor db,
    String profileId,
  ) async {
    try {
      return await db.query(
        DatabaseConfig.promptsTable,
        where: '${DatabaseConfig.promptProfileIdColumn} = ?',
        whereArgs: [profileId],
        orderBy: '${DatabaseConfig.promptDisplayOrderColumn} ASC',
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get prompts for profile: $profileId',
        e.toString(),
      );
    }
  }

  /// Get specific prompt by ID
  Future<Map<String, dynamic>?> getPromptById(String id) async {
    try {
      final db = await _database;
      final results = await db.query(
        DatabaseConfig.promptsTable,
        where: '${DatabaseConfig.promptIdColumn} = ?',
        whereArgs: [id],
      );
      return results.isNotEmpty ? results.first : null;
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get prompt by ID: $id',
        e.toString(),
      );
    }
  }

  /// Insert new prompt
  Future<void> insertPrompt(Map<String, dynamic> promptData) async {
    try {
      final db = await _database;
      await db.insert(
        DatabaseConfig.promptsTable,
        promptData,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to insert prompt: ${promptData['id']}',
        e.toString(),
      );
    }
  }

  /// Update existing prompt
  Future<void> updatePrompt(String id, Map<String, dynamic> promptData) async {
    try {
      final db = await _database;
      await db.update(
        DatabaseConfig.promptsTable,
        promptData,
        where: '${DatabaseConfig.promptIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to update prompt: $id',
        e.toString(),
      );
    }
  }

  /// Delete prompt
  Future<void> deletePrompt(String id) async {
    try {
      final db = await _database;
      await db.delete(
        DatabaseConfig.promptsTable,
        where: '${DatabaseConfig.promptIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to delete prompt: $id',
        e.toString(),
      );
    }
  }

  /// Batch insert prompts for a profile
  Future<void> insertPrompts(List<Map<String, dynamic>> prompts) async {
    try {
      final db = await _database;
      await db.transaction((txn) async {
        for (final prompt in prompts) {
          await txn.insert(
            DatabaseConfig.promptsTable,
            prompt,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to batch insert prompts',
        e.toString(),
      );
    }
  }

  // ============================================================================
  // 📊 POLL OPERATIONS
  // ============================================================================

  /// Get active poll by profile ID
  Future<Map<String, dynamic>?> getActivePollByProfileId(
    String profileId,
  ) async {
    final db = await _database;
    return await _getActivePollByProfileId(db, profileId);
  }

  Future<Map<String, dynamic>?> _getActivePollByProfileId(
    DatabaseExecutor db,
    String profileId,
  ) async {
    try {
      final results = await db.query(
        DatabaseConfig.pollsTable,
        where:
            '${DatabaseConfig.pollProfileIdColumn} = ? AND ${DatabaseConfig.pollIsActiveColumn} = ?',
        whereArgs: [profileId, 1],
        limit: 1,
      );
      return results.isNotEmpty ? results.first : null;
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get active poll for profile: $profileId',
        e.toString(),
      );
    }
  }

  /// Get all polls for a profile
  Future<List<Map<String, dynamic>>> getAllPollsByProfileId(
    String profileId,
  ) async {
    try {
      final db = await _database;
      return await db.query(
        DatabaseConfig.pollsTable,
        where: '${DatabaseConfig.pollProfileIdColumn} = ?',
        whereArgs: [profileId],
        orderBy: '${DatabaseConfig.pollCreatedAtColumn} DESC',
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get polls for profile: $profileId',
        e.toString(),
      );
    }
  }

  /// Insert new poll
  Future<void> insertPoll(Map<String, dynamic> pollData) async {
    try {
      final db = await _database;
      await db.insert(
        DatabaseConfig.pollsTable,
        pollData,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to insert poll: ${pollData['id']}',
        e.toString(),
      );
    }
  }

  /// Update existing poll
  Future<void> updatePoll(String id, Map<String, dynamic> pollData) async {
    try {
      final db = await _database;
      await db.update(
        DatabaseConfig.pollsTable,
        pollData,
        where: '${DatabaseConfig.pollIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to update poll: $id',
        e.toString(),
      );
    }
  }

  /// Delete poll
  Future<void> deletePoll(String id) async {
    try {
      final db = await _database;
      await db.delete(
        DatabaseConfig.pollsTable,
        where: '${DatabaseConfig.pollIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to delete poll: $id',
        e.toString(),
      );
    }
  }

  // ============================================================================
  // 🎥 MEDIA OPERATIONS
  // ============================================================================

  /// Get media by profile ID
  Future<List<Map<String, dynamic>>> getMediaByProfileId(
    String profileId,
  ) async {
    final db = await _database;
    return await _getMediaByProfileId(db, profileId);
  }

  Future<List<Map<String, dynamic>>> _getMediaByProfileId(
    DatabaseExecutor db,
    String profileId,
  ) async {
    try {
      return await db.query(
        DatabaseConfig.mediaTable,
        where: '${DatabaseConfig.mediaProfileIdColumn} = ?',
        whereArgs: [profileId],
        orderBy: '${DatabaseConfig.mediaDisplayOrderColumn} ASC',
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get media for profile: $profileId',
        e.toString(),
      );
    }
  }

  /// Get media by type for a profile
  Future<List<Map<String, dynamic>>> getMediaByType(
    String profileId,
    String mediaType,
  ) async {
    try {
      final db = await _database;
      return await db.query(
        DatabaseConfig.mediaTable,
        where:
            '${DatabaseConfig.mediaProfileIdColumn} = ? AND ${DatabaseConfig.mediaTypeColumn} = ?',
        whereArgs: [profileId, mediaType],
        orderBy: '${DatabaseConfig.mediaDisplayOrderColumn} ASC',
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get media by type for profile: $profileId',
        e.toString(),
      );
    }
  }

  /// Insert new media
  Future<void> insertMedia(Map<String, dynamic> mediaData) async {
    try {
      final db = await _database;
      await db.insert(
        DatabaseConfig.mediaTable,
        mediaData,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to insert media: ${mediaData['id']}',
        e.toString(),
      );
    }
  }

  /// Batch insert media for a profile
  Future<void> insertMediaBatch(List<Map<String, dynamic>> mediaList) async {
    try {
      final db = await _database;
      await db.transaction((txn) async {
        for (final media in mediaList) {
          await txn.insert(
            DatabaseConfig.mediaTable,
            media,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to batch insert media',
        e.toString(),
      );
    }
  }

  /// Update existing media
  Future<void> updateMedia(String id, Map<String, dynamic> mediaData) async {
    try {
      final db = await _database;
      await db.update(
        DatabaseConfig.mediaTable,
        mediaData,
        where: '${DatabaseConfig.mediaIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to update media: $id',
        e.toString(),
      );
    }
  }

  /// Delete media
  Future<void> deleteMedia(String id) async {
    try {
      final db = await _database;
      await db.delete(
        DatabaseConfig.mediaTable,
        where: '${DatabaseConfig.mediaIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to delete media: $id',
        e.toString(),
      );
    }
  }

  // ============================================================================
  // 🎯 INTEREST OPERATIONS
  // ============================================================================

  /// Get interests by profile ID
  Future<List<Map<String, dynamic>>> getInterestsByProfileId(
    String profileId,
  ) async {
    final db = await _database;
    return await _getInterestsByProfileId(db, profileId);
  }

  Future<List<Map<String, dynamic>>> _getInterestsByProfileId(
    DatabaseExecutor db,
    String profileId,
  ) async {
    try {
      return await db.query(
        DatabaseConfig.interestsTable,
        where: '${DatabaseConfig.interestProfileIdColumn} = ?',
        whereArgs: [profileId],
        orderBy: '${DatabaseConfig.interestPopularityColumn} DESC',
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get interests for profile: $profileId',
        e.toString(),
      );
    }
  }

  /// Get interests by category for a profile
  Future<List<Map<String, dynamic>>> getInterestsByCategory(
    String profileId,
    String category,
  ) async {
    try {
      final db = await _database;
      return await db.query(
        DatabaseConfig.interestsTable,
        where:
            '${DatabaseConfig.interestProfileIdColumn} = ? AND ${DatabaseConfig.interestCategoryColumn} = ?',
        whereArgs: [profileId, category],
        orderBy: '${DatabaseConfig.interestPopularityColumn} DESC',
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get interests by category for profile: $profileId',
        e.toString(),
      );
    }
  }

  /// Insert new interest
  Future<void> insertInterest(Map<String, dynamic> interestData) async {
    try {
      final db = await _database;
      await db.insert(
        DatabaseConfig.interestsTable,
        interestData,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to insert interest: ${interestData['id']}',
        e.toString(),
      );
    }
  }

  /// Batch insert interests for a profile
  Future<void> insertInterestsBatch(
    List<Map<String, dynamic>> interests,
  ) async {
    try {
      final db = await _database;
      await db.transaction((txn) async {
        for (final interest in interests) {
          await txn.insert(
            DatabaseConfig.interestsTable,
            interest,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to batch insert interests',
        e.toString(),
      );
    }
  }

  /// Update existing interest
  Future<void> updateInterest(
    String id,
    Map<String, dynamic> interestData,
  ) async {
    try {
      final db = await _database;
      await db.update(
        DatabaseConfig.interestsTable,
        interestData,
        where: '${DatabaseConfig.interestIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to update interest: $id',
        e.toString(),
      );
    }
  }

  /// Delete interest
  Future<void> deleteInterest(String id) async {
    try {
      final db = await _database;
      await db.delete(
        DatabaseConfig.interestsTable,
        where: '${DatabaseConfig.interestIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to delete interest: $id',
        e.toString(),
      );
    }
  }

  // ============================================================================
  // 🏆 BADGE OPERATIONS
  // ============================================================================

  /// Get badges by profile ID
  Future<List<Map<String, dynamic>>> getBadgesByProfileId(
    String profileId,
  ) async {
    final db = await _database;
    return await _getBadgesByProfileId(db, profileId);
  }

  Future<List<Map<String, dynamic>>> _getBadgesByProfileId(
    DatabaseExecutor db,
    String profileId,
  ) async {
    try {
      return await db.query(
        DatabaseConfig.badgesTable,
        where: '${DatabaseConfig.badgeProfileIdColumn} = ?',
        whereArgs: [profileId],
        orderBy: '${DatabaseConfig.badgeEarnedAtColumn} DESC',
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get badges for profile: $profileId',
        e.toString(),
      );
    }
  }

  /// Get visible badges for a profile
  Future<List<Map<String, dynamic>>> getVisibleBadgesByProfileId(
    String profileId,
  ) async {
    try {
      final db = await _database;
      return await db.query(
        DatabaseConfig.badgesTable,
        where:
            '${DatabaseConfig.badgeProfileIdColumn} = ? AND ${DatabaseConfig.badgeIsVisibleColumn} = ?',
        whereArgs: [profileId, 1],
        orderBy: '${DatabaseConfig.badgeEarnedAtColumn} DESC',
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get visible badges for profile: $profileId',
        e.toString(),
      );
    }
  }

  /// Insert new badge
  Future<void> insertBadge(Map<String, dynamic> badgeData) async {
    try {
      final db = await _database;
      await db.insert(
        DatabaseConfig.badgesTable,
        badgeData,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to insert badge: ${badgeData['id']}',
        e.toString(),
      );
    }
  }

  /// Batch insert badges for a profile
  Future<void> insertBadgesBatch(List<Map<String, dynamic>> badges) async {
    try {
      final db = await _database;
      await db.transaction((txn) async {
        for (final badge in badges) {
          await txn.insert(
            DatabaseConfig.badgesTable,
            badge,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to batch insert badges',
        e.toString(),
      );
    }
  }

  /// Update existing badge
  Future<void> updateBadge(String id, Map<String, dynamic> badgeData) async {
    try {
      final db = await _database;
      await db.update(
        DatabaseConfig.badgesTable,
        badgeData,
        where: '${DatabaseConfig.badgeIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to update badge: $id',
        e.toString(),
      );
    }
  }

  /// Delete badge
  Future<void> deleteBadge(String id) async {
    try {
      final db = await _database;
      await db.delete(
        DatabaseConfig.badgesTable,
        where: '${DatabaseConfig.badgeIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to delete badge: $id',
        e.toString(),
      );
    }
  }

  // ============================================================================
  // 🚀 BATCH OPERATIONS FOR PERFORMANCE
  // ============================================================================

  /// Insert complete profile with all related data in a single transaction
  Future<void> insertCompleteProfile({
    required Map<String, dynamic> profile,
    required List<Map<String, dynamic>> prompts,
    Map<String, dynamic>? poll,
    required List<Map<String, dynamic>> media,
    required List<Map<String, dynamic>> interests,
    required List<Map<String, dynamic>> badges,
  }) async {
    try {
      final db = await _database;

      await db.transaction((txn) async {
        // Insert profile first
        await txn.insert(
          DatabaseConfig.profilesTable,
          profile,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        // Insert all related data
        for (final prompt in prompts) {
          await txn.insert(
            DatabaseConfig.promptsTable,
            prompt,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }

        if (poll != null) {
          await txn.insert(
            DatabaseConfig.pollsTable,
            poll,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }

        for (final mediaItem in media) {
          await txn.insert(
            DatabaseConfig.mediaTable,
            mediaItem,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }

        for (final interest in interests) {
          await txn.insert(
            DatabaseConfig.interestsTable,
            interest,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }

        for (final badge in badges) {
          await txn.insert(
            DatabaseConfig.badgesTable,
            badge,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to insert complete profile: ${profile['id']}',
        e.toString(),
      );
    }
  }

  /// Clear all data (useful for testing and demo data refresh)
  Future<void> clearAllData() async {
    try {
      final db = await _database;

      await db.transaction((txn) async {
        // Delete in reverse order of dependencies
        await txn.delete(DatabaseConfig.badgesTable);
        await txn.delete(DatabaseConfig.interestsTable);
        await txn.delete(DatabaseConfig.mediaTable);
        await txn.delete(DatabaseConfig.pollsTable);
        await txn.delete(DatabaseConfig.promptsTable);
        await txn.delete(DatabaseConfig.profilesTable);
      });
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to clear all data',
        e.toString(),
      );
    }
  }

  // ============================================================================
  // 📊 ANALYTICS & UTILITIES
  // ============================================================================

  /// Get database statistics for debugging
  Future<Map<String, int>> getDatabaseStats() async {
    try {
      final db = await _database;

      final futures = await Future.wait([
        db.rawQuery(
          'SELECT COUNT(*) as count FROM ${DatabaseConfig.profilesTable}',
        ),
        db.rawQuery(
          'SELECT COUNT(*) as count FROM ${DatabaseConfig.promptsTable}',
        ),
        db.rawQuery(
          'SELECT COUNT(*) as count FROM ${DatabaseConfig.pollsTable}',
        ),
        db.rawQuery(
          'SELECT COUNT(*) as count FROM ${DatabaseConfig.mediaTable}',
        ),
        db.rawQuery(
          'SELECT COUNT(*) as count FROM ${DatabaseConfig.interestsTable}',
        ),
        db.rawQuery(
          'SELECT COUNT(*) as count FROM ${DatabaseConfig.badgesTable}',
        ),
      ]);

      return {
        'profiles': futures[0].first['count'] as int,
        'prompts': futures[1].first['count'] as int,
        'polls': futures[2].first['count'] as int,
        'media': futures[3].first['count'] as int,
        'interests': futures[4].first['count'] as int,
        'badges': futures[5].first['count'] as int,
      };
    } catch (e) {
      throw ProfileDatasourceException(
        'Failed to get database statistics',
        e.toString(),
      );
    }
  }
}

/// 🚨 Profile Datasource Exception - Custom error handling
///
/// Provides detailed error information for datasource operations
class ProfileDatasourceException implements Exception {
  final String message;
  final String details;
  final DateTime timestamp;

  ProfileDatasourceException(this.message, this.details)
    : timestamp = DateTime.now();

  @override
  String toString() {
    return 'ProfileDatasourceException: $message\nDetails: $details\nTimestamp: ${timestamp.toIso8601String()}';
  }
}
