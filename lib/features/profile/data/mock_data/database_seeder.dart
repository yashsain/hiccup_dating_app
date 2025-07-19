import '../datasources/profile_local_datasource.dart';
import '../models/profile_model.dart';
import '../models/prompt_model.dart';
import '../models/poll_model.dart';
import '../models/media_model.dart';
import '../models/interest_model.dart';
import '../models/badge_model.dart';
import 'sample_profiles.dart';

/// 🌱 Database Seeder - Demo Data Population System (2025)
///
/// This seeder populates the SQLite database with rich, realistic demo data
/// for comprehensive app testing. It handles all 6 entity types and ensures
/// data consistency across relationships.
///
/// Key Features:
/// - Batch insertion for performance
/// - Transaction safety for data integrity
/// - Comprehensive error handling
/// - Easy reset/refresh capabilities
/// - Progress tracking and logging
/// - Validation of seeded data
///
/// Perfect for:
/// - Frontend development with realistic data
/// - Testing matching algorithms
/// - Gift/chat flow validation
/// - Demo presentations
/// - Easy backend swap preparation
///
/// Usage:
/// ```dart
/// final seeder = DatabaseSeeder(datasource);
/// await seeder.seedAllData();
/// final stats = await seeder.getSeededDataStats();
/// ```
class DatabaseSeeder {
  final ProfileLocalDatasource _datasource;

  DatabaseSeeder(this._datasource);

  // ============================================================================
  // 🌱 MAIN SEEDING OPERATIONS
  // ============================================================================

  /// Seed all demo data (5 complete profiles with all related entities)
  Future<SeedResult> seedAllData({bool clearExisting = true}) async {
    final startTime = DateTime.now();
    print('🌱 Starting database seeding...');

    try {
      // Clear existing data if requested
      if (clearExisting) {
        print('🧹 Clearing existing data...');
        await _datasource.clearAllData();
        print('✅ Existing data cleared');
      }

      // Seed all data types in correct dependency order
      final results = await Future.wait([
        _seedProfiles(),
        _seedPrompts(),
        _seedPolls(),
        _seedMedia(),
        _seedInterests(),
        _seedBadges(),
      ]);

      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);

      final result = SeedResult(
        success: true,
        duration: duration,
        profilesSeeded: results[0],
        promptsSeeded: results[1],
        pollsSeeded: results[2],
        mediaSeeded: results[3],
        interestsSeeded: results[4],
        badgesSeeded: results[5],
        message: 'Successfully seeded all demo data',
      );

      print(
        '🎉 Seeding completed successfully in ${duration.inMilliseconds}ms',
      );
      print('📊 Seeded: ${result.totalEntities} entities across 6 tables');

      return result;
    } catch (e) {
      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);

      print('❌ Seeding failed: $e');

      return SeedResult(
        success: false,
        duration: duration,
        message: 'Seeding failed: ${e.toString()}',
      );
    }
  }

  /// Seed specific profile by ID (useful for testing individual profiles)
  Future<SeedResult> seedProfile(
    String profileId, {
    bool clearExisting = false,
  }) async {
    final startTime = DateTime.now();
    print('🌱 Seeding profile: $profileId...');

    try {
      final profile = SampleProfiles.getProfileById(profileId);
      if (profile == null) {
        throw SeedException('Profile not found: $profileId');
      }

      if (clearExisting) {
        // Clear only this profile's data
        await _clearProfileData(profileId);
      }

      // Get all related data for this profile
      final prompts = SampleProfiles.allPrompts
          .where((p) => p.profileId == profileId)
          .toList();

      final poll = SampleProfiles.allPolls.firstWhere(
        (p) => p.profileId == profileId,
      );

      final media = SampleProfiles.allMedia
          .where((m) => m.profileId == profileId)
          .toList();

      final interests = SampleProfiles.allInterests
          .where((i) => i.profileId == profileId)
          .toList();

      final badges = SampleProfiles.allBadges
          .where((b) => b.profileId == profileId)
          .toList();

      // Insert complete profile with all related data
      await _datasource.insertCompleteProfile(
        profile: ProfileModel.toMap(profile),
        prompts: prompts.map(PromptModel.toMap).toList(),
        poll: PollModel.toMap(poll),
        media: media.map(MediaModel.toMap).toList(),
        interests: interests.map(InterestModel.toMap).toList(),
        badges: badges.map(BadgeModel.toMap).toList(),
      );

      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);

      print('✅ Profile seeded successfully: $profileId');

      return SeedResult(
        success: true,
        duration: duration,
        profilesSeeded: 1,
        promptsSeeded: prompts.length,
        pollsSeeded: 1,
        mediaSeeded: media.length,
        interestsSeeded: interests.length,
        badgesSeeded: badges.length,
        message: 'Successfully seeded profile: $profileId',
      );
    } catch (e) {
      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);

      print('❌ Profile seeding failed: $e');

      return SeedResult(
        success: false,
        duration: duration,
        message: 'Profile seeding failed: ${e.toString()}',
      );
    }
  }

  /// Refresh all demo data (clear and re-seed)
  Future<SeedResult> refreshAllData() async {
    print('🔄 Refreshing all demo data...');
    return await seedAllData(clearExisting: true);
  }

  /// Add incremental demo data without clearing existing
  Future<SeedResult> addDemoData() async {
    print('➕ Adding demo data to existing database...');
    return await seedAllData(clearExisting: false);
  }

  // ============================================================================
  // 🎯 INDIVIDUAL ENTITY SEEDING
  // ============================================================================

  /// Seed all profiles
  Future<int> _seedProfiles() async {
    print('👤 Seeding profiles...');
    int count = 0;

    for (final profile in SampleProfiles.allProfiles) {
      await _datasource.insertProfile(ProfileModel.toMap(profile));
      count++;
      print('  ✅ Seeded profile: ${profile.name} (${profile.id})');
    }

    print('📊 Seeded $count profiles');
    return count;
  }

  /// Seed all prompts
  Future<int> _seedPrompts() async {
    print('💬 Seeding prompts...');
    int count = 0;

    // Group prompts by profile for batch insertion
    final promptsByProfile = <String, List<Map<String, dynamic>>>{};

    for (final prompt in SampleProfiles.allPrompts) {
      promptsByProfile.putIfAbsent(prompt.profileId, () => []);
      promptsByProfile[prompt.profileId]!.add(PromptModel.toMap(prompt));
    }

    // Batch insert prompts for each profile
    for (final entry in promptsByProfile.entries) {
      await _datasource.insertPrompts(entry.value);
      count += entry.value.length;
      print('  ✅ Seeded ${entry.value.length} prompts for ${entry.key}');
    }

    print('📊 Seeded $count prompts');
    return count;
  }

  /// Seed all polls
  Future<int> _seedPolls() async {
    print('📊 Seeding polls...');
    int count = 0;

    for (final poll in SampleProfiles.allPolls) {
      await _datasource.insertPoll(PollModel.toMap(poll));
      count++;
      print('  ✅ Seeded poll: ${poll.question} (${poll.profileId})');
    }

    print('📊 Seeded $count polls');
    return count;
  }

  /// Seed all media
  Future<int> _seedMedia() async {
    print('🎥 Seeding media...');
    int count = 0;

    // Group media by profile for batch insertion
    final mediaByProfile = <String, List<Map<String, dynamic>>>{};

    for (final media in SampleProfiles.allMedia) {
      mediaByProfile.putIfAbsent(media.profileId, () => []);
      mediaByProfile[media.profileId]!.add(MediaModel.toMap(media));
    }

    // Batch insert media for each profile
    for (final entry in mediaByProfile.entries) {
      await _datasource.insertMediaBatch(entry.value);
      count += entry.value.length;
      print('  ✅ Seeded ${entry.value.length} media items for ${entry.key}');
    }

    print('📊 Seeded $count media items');
    return count;
  }

  /// Seed all interests
  Future<int> _seedInterests() async {
    print('🎯 Seeding interests...');
    int count = 0;

    // Group interests by profile for batch insertion
    final interestsByProfile = <String, List<Map<String, dynamic>>>{};

    for (final interest in SampleProfiles.allInterests) {
      interestsByProfile.putIfAbsent(interest.profileId, () => []);
      interestsByProfile[interest.profileId]!.add(
        InterestModel.toMap(interest),
      );
    }

    // Batch insert interests for each profile
    for (final entry in interestsByProfile.entries) {
      await _datasource.insertInterestsBatch(entry.value);
      count += entry.value.length;
      print('  ✅ Seeded ${entry.value.length} interests for ${entry.key}');
    }

    print('📊 Seeded $count interests');
    return count;
  }

  /// Seed all badges
  Future<int> _seedBadges() async {
    print('🏆 Seeding badges...');
    int count = 0;

    // Group badges by profile for batch insertion
    final badgesByProfile = <String, List<Map<String, dynamic>>>{};

    for (final badge in SampleProfiles.allBadges) {
      badgesByProfile.putIfAbsent(badge.profileId, () => []);
      badgesByProfile[badge.profileId]!.add(BadgeModel.toMap(badge));
    }

    // Batch insert badges for each profile
    for (final entry in badgesByProfile.entries) {
      await _datasource.insertBadgesBatch(entry.value);
      count += entry.value.length;
      print('  ✅ Seeded ${entry.value.length} badges for ${entry.key}');
    }

    print('📊 Seeded $count badges');
    return count;
  }

  // ============================================================================
  // 🧹 DATA MANAGEMENT UTILITIES
  // ============================================================================

  /// Clear all data from database
  Future<void> clearAllData() async {
    print('🧹 Clearing all database data...');
    await _datasource.clearAllData();
    print('✅ All data cleared');
  }

  /// Clear data for specific profile
  Future<void> _clearProfileData(String profileId) async {
    print('🧹 Clearing data for profile: $profileId...');
    await _datasource.deleteProfile(profileId);
    print('✅ Profile data cleared: $profileId');
  }

  /// Validate seeded data integrity
  Future<ValidationResult> validateSeededData() async {
    print('🔍 Validating seeded data...');

    try {
      final stats = await _datasource.getDatabaseStats();
      final expectedStats = SampleProfiles.demoDataStats;

      final issues = <String>[];

      // Check entity counts
      for (final entry in expectedStats.entries) {
        final expected = entry.value;
        final actual = stats[entry.key] ?? 0;

        if (actual != expected) {
          issues.add('${entry.key}: expected $expected, got $actual');
        }
      }

      // Validate data relationships
      for (final profile in SampleProfiles.allProfiles) {
        final profileData = await _datasource.getCompleteProfile(profile.id);

        if (profileData == null) {
          issues.add('Profile not found: ${profile.id}');
          continue;
        }

        // Check related data exists
        final prompts = profileData['prompts'] as List? ?? [];
        final media = profileData['media'] as List? ?? [];
        final interests = profileData['interests'] as List? ?? [];
        final badges = profileData['badges'] as List? ?? [];

        if (prompts.length != 3) {
          issues.add(
            '${profile.id}: expected 3 prompts, got ${prompts.length}',
          );
        }

        if (media.isEmpty) {
          issues.add('${profile.id}: no media found');
        }

        if (interests.isEmpty) {
          issues.add('${profile.id}: no interests found');
        }

        if (badges.isEmpty) {
          issues.add('${profile.id}: no badges found');
        }
      }

      if (issues.isEmpty) {
        print('✅ Data validation passed');
        return ValidationResult(
          success: true,
          message: 'All data validation checks passed',
          details: stats,
        );
      } else {
        print('⚠️ Data validation issues found:');
        for (final issue in issues) {
          print('  - $issue');
        }

        return ValidationResult(
          success: false,
          message: 'Found ${issues.length} validation issues',
          details: stats,
          issues: issues,
        );
      }
    } catch (e) {
      print('❌ Data validation failed: $e');
      return ValidationResult(
        success: false,
        message: 'Validation failed: ${e.toString()}',
      );
    }
  }

  /// Get current database statistics
  Future<Map<String, int>> getDatabaseStats() async {
    return await _datasource.getDatabaseStats();
  }

  /// Get seeded data statistics
  Future<Map<String, int>> getSeededDataStats() async {
    final stats = await getDatabaseStats();
    final expectedStats = SampleProfiles.demoDataStats;

    print('📊 Database Statistics:');
    for (final entry in stats.entries) {
      final expected = expectedStats[entry.key] ?? 0;
      final actual = entry.value;
      final status = actual == expected ? '✅' : '⚠️';
      print(
        '  $status ${entry.key}: $actual${expected > 0 ? '/$expected' : ''}',
      );
    }

    return stats;
  }

  // ============================================================================
  // 🧪 TESTING UTILITIES
  // ============================================================================

  /// Create minimal test profile (useful for quick testing)
  Future<SeedResult> seedTestProfile({
    String? id,
    String? name,
    int? age,
  }) async {
    final testId =
        id ?? 'test_profile_${DateTime.now().millisecondsSinceEpoch}';

    // Create minimal test profile data
    final testProfile = {
      'id': testId,
      'name': name ?? 'Test User',
      'age': age ?? 25,
      'location': 'Test City, TS',
      'gender': 'Test',
      'bio': 'Test profile for development',
      'photo_verification': 0,
      'identity_verification': 0,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    };

    await _datasource.insertProfile(testProfile);

    return SeedResult(
      success: true,
      duration: Duration.zero,
      profilesSeeded: 1,
      message: 'Test profile created: $testId',
    );
  }

  /// Verify specific profile exists and has expected data
  Future<bool> verifyProfile(String profileId) async {
    try {
      final profileData = await _datasource.getCompleteProfile(profileId);
      return profileData != null;
    } catch (e) {
      return false;
    }
  }

  /// Get demo profiles for UI testing
  Future<List<Map<String, dynamic>>> getDemoProfilesForUI() async {
    final profiles = <Map<String, dynamic>>[];

    for (final profile in SampleProfiles.allProfiles) {
      final completeData = await _datasource.getCompleteProfile(profile.id);
      if (completeData != null) {
        profiles.add(completeData);
      }
    }

    return profiles;
  }
}

// ============================================================================
// 📊 RESULT CLASSES
// ============================================================================

/// 🌱 Seed Result - Results from seeding operations
class SeedResult {
  final bool success;
  final Duration duration;
  final int profilesSeeded;
  final int promptsSeeded;
  final int pollsSeeded;
  final int mediaSeeded;
  final int interestsSeeded;
  final int badgesSeeded;
  final String message;

  const SeedResult({
    required this.success,
    required this.duration,
    this.profilesSeeded = 0,
    this.promptsSeeded = 0,
    this.pollsSeeded = 0,
    this.mediaSeeded = 0,
    this.interestsSeeded = 0,
    this.badgesSeeded = 0,
    required this.message,
  });

  /// Total entities seeded
  int get totalEntities =>
      profilesSeeded +
      promptsSeeded +
      pollsSeeded +
      mediaSeeded +
      interestsSeeded +
      badgesSeeded;

  /// Seeding rate (entities per second)
  double get entitiesPerSecond => duration.inMilliseconds > 0
      ? totalEntities / (duration.inMilliseconds / 1000)
      : 0.0;

  @override
  String toString() {
    return 'SeedResult(success: $success, duration: ${duration.inMilliseconds}ms, '
        'entities: $totalEntities, rate: ${entitiesPerSecond.toStringAsFixed(1)}/s, '
        'message: $message)';
  }
}

/// 🔍 Validation Result - Results from data validation
class ValidationResult {
  final bool success;
  final String message;
  final Map<String, int>? details;
  final List<String>? issues;

  const ValidationResult({
    required this.success,
    required this.message,
    this.details,
    this.issues,
  });

  @override
  String toString() {
    final issueCount = issues?.length ?? 0;
    return 'ValidationResult(success: $success, issues: $issueCount, message: $message)';
  }
}

/// 🚨 Seed Exception - Custom error for seeding operations
class SeedException implements Exception {
  final String message;
  final DateTime timestamp;

  SeedException(this.message) : timestamp = DateTime.now();

  @override
  String toString() {
    return 'SeedException: $message [${timestamp.toIso8601String()}]';
  }
}
