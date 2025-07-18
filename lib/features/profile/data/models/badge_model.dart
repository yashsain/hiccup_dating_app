import '../../domain/entities/badge_entity.dart';

/// 🏆 Badge Model - Entity ↔ Database Mapping (2025)
///
/// This model handles conversion between BadgeEntity and database maps.
/// Badges represent user achievements, verifications, and special status
/// that add credibility and personality to profiles.
/// Based on design document: max 5 badges per profile.
///
/// Key Features:
/// - Multi-type badge support (verification, achievement, etc.)
/// - Expiration handling for time-limited badges
/// - Visibility controls for badge display
/// - Rarity system for special badges
/// - Icon and color customization
/// - Type-safe conversions with validation
/// - Easy backend swap capability
///
/// Usage:
/// ```dart
/// // Entity → Database
/// final map = BadgeModel.toMap(badgeEntity);
/// await database.insert('badges', map);
///
/// // Database → Entity
/// final badge = BadgeModel.fromMap(databaseMap);
/// ```
class BadgeModel {
  // 🚫 Private constructor - This is a utility class
  BadgeModel._();

  /// 📤 Convert BadgeEntity to Database Map
  ///
  /// Serializes badge data for SQLite storage with proper type
  /// handling and optional field management.
  static Map<String, dynamic> toMap(BadgeEntity entity) {
    try {
      return {
        // 🔑 Primary identifiers
        'id': entity.id,
        'profile_id': entity.profileId,

        // 🏆 Badge content
        'badge': entity.badge,
        'type': entity.type.name, // enum to string
        'description': entity.description,

        // 🎨 Visual properties
        'icon_url': entity.iconUrl,
        'color': entity.color,

        // ⚡ State properties
        'is_visible': entity.isVisible ? 1 : 0, // SQLite boolean
        'is_rare': entity.isRare ? 1 : 0, // SQLite boolean
        // ⏰ Time management
        'earned_at': entity.earnedAt?.toIso8601String(),
        'expires_at': entity.expiresAt?.toIso8601String(),
        'created_at': entity.createdAt.toIso8601String(),
      };
    } catch (e) {
      throw BadgeModelException(
        'Failed to convert BadgeEntity to Map: ${e.toString()}',
        entity.id,
      );
    }
  }

  /// 📥 Convert Database Map to BadgeEntity
  ///
  /// Deserializes database data back into clean domain entity
  /// with proper enum conversion and null handling.
  static BadgeEntity fromMap(Map<String, dynamic> map) {
    try {
      // 🔍 Validate required fields
      _validateRequiredFields(map);

      return BadgeEntity(
        // 🔑 Primary identifiers
        id: map['id'] as String,
        profileId: map['profile_id'] as String,

        // 🏆 Badge content
        badge: map['badge'] as String,
        type: BadgeType.values.firstWhere(
          (type) => type.name == map['type'],
          orElse: () => BadgeType.achievement, // Default fallback
        ),
        description: map['description'] as String?,

        // 🎨 Visual properties
        iconUrl: map['icon_url'] as String?,
        color: map['color'] as String?,

        // ⚡ State properties
        isVisible: (map['is_visible'] as int? ?? 1) == 1, // Default visible
        isRare: (map['is_rare'] as int? ?? 0) == 1,

        // ⏰ Time management
        earnedAt: map['earned_at'] != null
            ? DateTime.parse(map['earned_at'] as String)
            : null,
        expiresAt: map['expires_at'] != null
            ? DateTime.parse(map['expires_at'] as String)
            : null,
        createdAt: DateTime.parse(map['created_at'] as String),
      );
    } catch (e) {
      throw BadgeModelException(
        'Failed to convert Map to BadgeEntity: ${e.toString()}',
        map['id']?.toString(),
      );
    }
  }

  /// 🔄 Convert multiple badges for bulk operations
  ///
  /// Efficiently converts a list of entities to database maps
  /// for batch insert/update operations.
  static List<Map<String, dynamic>> toMapList(List<BadgeEntity> entities) {
    return entities.map((entity) => toMap(entity)).toList();
  }

  /// 📥 Convert multiple database maps to entities
  ///
  /// Efficiently converts database results to entity list
  /// with proper error handling and expiration filtering.
  static List<BadgeEntity> fromMapList(List<Map<String, dynamic>> maps) {
    final entities = <BadgeEntity>[];
    final errors = <String>[];
    final now = DateTime.now();

    for (final map in maps) {
      try {
        final entity = fromMap(map);

        // Filter out expired badges (unless they're permanent)
        if (entity.expiresAt == null || entity.expiresAt!.isAfter(now)) {
          entities.add(entity);
        }
      } catch (e) {
        errors.add('Map ${map['id']}: ${e.toString()}');
      }
    }

    // Log errors but don't fail the entire operation
    if (errors.isNotEmpty) {
      print(
        '⚠️ BadgeModel: Some badges failed to convert: ${errors.join(', ')}',
      );
    }

    return entities;
  }

  /// 🏆 Create award map for new badge
  ///
  /// Creates a new badge map with award timestamp and proper defaults.
  static Map<String, dynamic> createAwardMap(
    String profileId,
    String badgeName,
    BadgeType type, {
    String? description,
    Duration? expiresIn,
    bool isRare = false,
    String? iconUrl,
    String? color,
  }) {
    final now = DateTime.now();
    final badgeId =
        '${profileId}_${badgeName.toLowerCase().replaceAll(' ', '_')}_${now.millisecondsSinceEpoch}';

    return {
      'id': badgeId,
      'profile_id': profileId,
      'badge': badgeName,
      'type': type.name,
      'description': description ?? _getDefaultDescription(badgeName, type),
      'icon_url': iconUrl,
      'color': color ?? _getDefaultColor(type),
      'is_visible': 1, // New badges are visible by default
      'is_rare': isRare ? 1 : 0,
      'earned_at': now.toIso8601String(),
      'expires_at': expiresIn != null
          ? now.add(expiresIn).toIso8601String()
          : null,
      'created_at': now.toIso8601String(),
    };
  }

  /// 👁️ Create visibility toggle map
  ///
  /// Creates update map to toggle badge visibility.
  static Map<String, dynamic> createVisibilityToggleMap(
    String badgeId,
    bool isVisible,
  ) {
    return {'id': badgeId, 'is_visible': isVisible ? 1 : 0};
  }

  /// ⏰ Create expiration update map
  ///
  /// Creates update map to extend or set badge expiration.
  static Map<String, dynamic> createExpirationUpdateMap(
    String badgeId,
    DateTime? expiresAt,
  ) {
    return {'id': badgeId, 'expires_at': expiresAt?.toIso8601String()};
  }

  /// 🔄 Get expired badges for cleanup
  ///
  /// Filters badges to find expired ones for removal.
  static List<BadgeEntity> getExpiredBadges(List<BadgeEntity> badges) {
    final now = DateTime.now();
    return badges
        .where(
          (badge) => badge.expiresAt != null && badge.expiresAt!.isBefore(now),
        )
        .toList();
  }

  /// 📊 Get badge statistics for profile
  ///
  /// Creates summary statistics for badge collection.
  static Map<String, dynamic> getBadgeStats(List<BadgeEntity> badges) {
    final typeCount = <BadgeType, int>{};
    int visibleCount = 0;
    int rareCount = 0;
    int expiredCount = 0;

    final now = DateTime.now();

    for (final badge in badges) {
      // Count by type
      typeCount[badge.type] = (typeCount[badge.type] ?? 0) + 1;

      // Count visibility
      if (badge.isVisible) visibleCount++;

      // Count rarity
      if (badge.isRare) rareCount++;

      // Count expired
      if (badge.expiresAt != null && badge.expiresAt!.isBefore(now)) {
        expiredCount++;
      }
    }

    return {
      'total': badges.length,
      'visible': visibleCount,
      'rare': rareCount,
      'expired': expiredCount,
      'by_type': typeCount.map((key, value) => MapEntry(key.name, value)),
    };
  }

  // 🛠️ PRIVATE HELPER METHODS

  /// Validate that all required fields are present and valid
  static void _validateRequiredFields(Map<String, dynamic> map) {
    final requiredFields = ['id', 'profile_id', 'badge', 'type', 'created_at'];
    final missingFields = <String>[];

    for (final field in requiredFields) {
      if (!map.containsKey(field) || map[field] == null) {
        missingFields.add(field);
      }
    }

    if (missingFields.isNotEmpty) {
      throw BadgeModelException(
        'Missing required fields: ${missingFields.join(', ')}',
        map['id']?.toString(),
      );
    }

    // Validate business rules
    _validateBusinessRules(map);
  }

  /// Validate business rules for badge data
  static void _validateBusinessRules(Map<String, dynamic> map) {
    // Validate badge name
    final badge = map['badge'] as String;
    if (badge.isEmpty || badge.length > 50) {
      throw BadgeModelException(
        'Badge name must be 1-50 characters',
        map['id']?.toString(),
      );
    }

    // Validate description length if present
    final description = map['description'] as String?;
    if (description != null && description.length > 200) {
      throw BadgeModelException(
        'Badge description cannot exceed 200 characters',
        map['id']?.toString(),
      );
    }

    // Validate expiration logic
    final earnedAt = map['earned_at'] as String?;
    final expiresAt = map['expires_at'] as String?;

    if (earnedAt != null && expiresAt != null) {
      final earned = DateTime.parse(earnedAt);
      final expires = DateTime.parse(expiresAt);

      if (expires.isBefore(earned)) {
        throw BadgeModelException(
          'Badge expiration cannot be before earned date',
          map['id']?.toString(),
        );
      }
    }

    // Validate color format if present
    final color = map['color'] as String?;
    if (color != null && !_isValidColorFormat(color)) {
      throw BadgeModelException(
        'Invalid color format (use hex: #RRGGBB)',
        map['id']?.toString(),
      );
    }
  }

  /// Check if color is valid hex format
  static bool _isValidColorFormat(String color) {
    return RegExp(r'^#[0-9A-Fa-f]{6}$').hasMatch(color);
  }

  /// Get default description for badge type
  static String _getDefaultDescription(String badgeName, BadgeType type) {
    switch (type) {
      case BadgeType.verification:
        return 'Verified $badgeName status';
      case BadgeType.achievement:
        return 'Achievement: $badgeName';
      case BadgeType.personality:
        return 'Personality trait: $badgeName';
      case BadgeType.interest:
        return 'Interest: $badgeName';
      case BadgeType.premium:
        return 'Premium feature: $badgeName';
      case BadgeType.special:
        return 'Special badge: $badgeName';
    }
  }

  /// Get default color for badge type
  static String _getDefaultColor(BadgeType type) {
    switch (type) {
      case BadgeType.verification:
        return '#22C55E'; // Green
      case BadgeType.achievement:
        return '#F59E0B'; // Amber
      case BadgeType.personality:
        return '#8B5CF6'; // Purple
      case BadgeType.interest:
        return '#3B82F6'; // Blue
      case BadgeType.premium:
        return '#F59E0B'; // Gold
      case BadgeType.special:
        return '#EF4444'; // Red
    }
  }
}

/// 🚨 Badge Model Exception - Custom error handling
///
/// Provides detailed error information for badge data conversion issues.
class BadgeModelException implements Exception {
  final String message;
  final String? badgeId;
  final DateTime timestamp;

  BadgeModelException(this.message, [this.badgeId])
    : timestamp = DateTime.now();

  @override
  String toString() {
    final id = badgeId != null ? ' (Badge ID: $badgeId)' : '';
    return 'BadgeModelException$id: $message [${timestamp.toIso8601String()}]';
  }
}

/// 🧪 Badge Model Utilities - Helper methods for testing and validation
///
/// Utilities for testing the badge data layer and ensuring data integrity.
class BadgeModelUtils {
  // 🚫 Private constructor - This is a utility class
  BadgeModelUtils._();

  /// Common badges by type for suggestions and awards
  static const Map<BadgeType, List<Map<String, dynamic>>> commonBadgesByType = {
    BadgeType.verification: [
      {
        'name': 'Photo Verified',
        'description': 'Profile photo verified',
        'permanent': true,
      },
      {
        'name': 'ID Verified',
        'description': 'Identity verified',
        'permanent': true,
      },
      {
        'name': 'Phone Verified',
        'description': 'Phone number verified',
        'permanent': true,
      },
      {
        'name': 'Email Verified',
        'description': 'Email address verified',
        'permanent': true,
      },
    ],
    BadgeType.achievement: [
      {
        'name': 'Early Bird',
        'description': 'One of the first users',
        'rare': true,
      },
      {'name': 'Popular', 'description': 'Highly liked profile', 'rare': false},
      {
        'name': 'Conversation Starter',
        'description': 'Great at starting conversations',
        'rare': false,
      },
      {
        'name': 'Match Maker',
        'description': 'Made many successful matches',
        'rare': true,
      },
      {
        'name': 'Active User',
        'description': 'Regular app usage',
        'rare': false,
      },
    ],
    BadgeType.personality: [
      {
        'name': 'Adventurous',
        'description': 'Loves adventure and trying new things',
        'rare': false,
      },
      {
        'name': 'Creative',
        'description': 'Artistic and creative personality',
        'rare': false,
      },
      {
        'name': 'Intellectual',
        'description': 'Enjoys deep conversations',
        'rare': false,
      },
      {
        'name': 'Humor Master',
        'description': 'Great sense of humor',
        'rare': false,
      },
      {
        'name': 'Empathetic',
        'description': 'Very understanding and caring',
        'rare': false,
      },
    ],
    BadgeType.interest: [
      {
        'name': 'Travel Enthusiast',
        'description': 'Loves to travel',
        'rare': false,
      },
      {
        'name': 'Fitness Fanatic',
        'description': 'Passionate about fitness',
        'rare': false,
      },
      {
        'name': 'Foodie',
        'description': 'Food lover and explorer',
        'rare': false,
      },
      {
        'name': 'Music Lover',
        'description': 'Passionate about music',
        'rare': false,
      },
      {
        'name': 'Pet Parent',
        'description': 'Loves animals and pets',
        'rare': false,
      },
    ],
    BadgeType.premium: [
      {
        'name': 'Premium Member',
        'description': 'Hiccup Premium subscriber',
        'rare': false,
      },
      {
        'name': 'VIP',
        'description': 'VIP member with exclusive features',
        'rare': true,
      },
      {
        'name': 'Supporter',
        'description': 'Supports app development',
        'rare': false,
      },
    ],
    BadgeType.special: [
      {
        'name': 'Beta Tester',
        'description': 'Helped test new features',
        'rare': true,
      },
      {
        'name': 'Community Leader',
        'description': 'Active in community',
        'rare': true,
      },
      {
        'name': 'Event Attendee',
        'description': 'Attended special events',
        'rare': true,
      },
      {
        'name': 'Anniversary',
        'description': 'App anniversary celebration',
        'rare': true,
      },
    ],
  };

  /// Create sample badge map for testing
  static Map<String, dynamic> createSampleMap({
    String? id,
    String? profileId,
    BadgeType type = BadgeType.achievement,
    String? badgeName,
    bool isVisible = true,
    bool isRare = false,
    Duration? expiresIn,
  }) {
    final badges = commonBadgesByType[type]!;
    final badgeData = badges.first;
    final selectedName = badgeName ?? badgeData['name'] as String;

    return BadgeModel.createAwardMap(
      profileId ?? 'test_profile_1',
      selectedName,
      type,
      description: badgeData['description'] as String?,
      expiresIn: expiresIn,
      isRare: isRare || (badgeData['rare'] as bool? ?? false),
    );
  }

  /// Create sample badge set for a profile
  static List<Map<String, dynamic>> createSampleBadgeSet(String profileId) {
    return [
      createSampleMap(
        id: 'badge_${profileId}_1',
        profileId: profileId,
        type: BadgeType.verification,
        badgeName: 'Photo Verified',
      ),
      createSampleMap(
        id: 'badge_${profileId}_2',
        profileId: profileId,
        type: BadgeType.achievement,
        badgeName: 'Popular',
      ),
      createSampleMap(
        id: 'badge_${profileId}_3',
        profileId: profileId,
        type: BadgeType.personality,
        badgeName: 'Adventurous',
      ),
      createSampleMap(
        id: 'badge_${profileId}_4',
        profileId: profileId,
        type: BadgeType.interest,
        badgeName: 'Travel Enthusiast',
      ),
      createSampleMap(
        id: 'badge_${profileId}_5',
        profileId: profileId,
        type: BadgeType.premium,
        badgeName: 'Premium Member',
      ),
    ];
  }

  /// Validate badge entity can be converted to map and back
  static bool validateRoundTrip(BadgeEntity entity) {
    try {
      final map = BadgeModel.toMap(entity);
      final restored = BadgeModel.fromMap(map);

      return entity.id == restored.id &&
          entity.profileId == restored.profileId &&
          entity.badge == restored.badge &&
          entity.type == restored.type &&
          entity.isVisible == restored.isVisible;
    } catch (e) {
      return false;
    }
  }

  /// Check if badges exceed maximum limit (5)
  static bool exceedsMaximumLimit(List<BadgeEntity> badges) {
    return badges.length > 5;
  }

  /// Get suggested badges based on user activity
  static List<Map<String, dynamic>> getSuggestedBadges(
    List<BadgeEntity> existingBadges,
    Map<String, dynamic> userActivity,
  ) {
    final existingNames = existingBadges
        .map((b) => b.badge.toLowerCase())
        .toSet();

    final suggestions = <Map<String, dynamic>>[];

    // Suggest verification badges if not present
    if (!existingNames.contains('photo verified')) {
      suggestions.add({
        'name': 'Photo Verified',
        'type': BadgeType.verification,
        'priority': 10,
        'reason': 'Verify your photos to build trust',
      });
    }

    // Suggest achievement badges based on activity
    final messageCount = userActivity['messages_sent'] as int? ?? 0;
    if (messageCount > 100 && !existingNames.contains('conversation starter')) {
      suggestions.add({
        'name': 'Conversation Starter',
        'type': BadgeType.achievement,
        'priority': 8,
        'reason': 'You\'re great at starting conversations!',
      });
    }

    // Suggest personality badges based on profile completion
    final profileCompleteness =
        userActivity['profile_completeness'] as double? ?? 0.0;
    if (profileCompleteness > 0.8 && !existingNames.contains('detailed')) {
      suggestions.add({
        'name': 'Detailed',
        'type': BadgeType.personality,
        'priority': 6,
        'reason': 'Your profile is very detailed',
      });
    }

    return suggestions
      ..sort((a, b) => (b['priority'] as int).compareTo(a['priority'] as int));
  }

  /// Check badge expiration status
  static Map<String, List<BadgeEntity>> categorizeByExpiration(
    List<BadgeEntity> badges,
  ) {
    final now = DateTime.now();
    final categories = <String, List<BadgeEntity>>{
      'active': <BadgeEntity>[],
      'expiring_soon': <BadgeEntity>[],
      'expired': <BadgeEntity>[],
    };

    for (final badge in badges) {
      if (badge.expiresAt == null) {
        categories['active']!.add(badge); // Permanent badge
      } else if (badge.expiresAt!.isBefore(now)) {
        categories['expired']!.add(badge);
      } else if (badge.expiresAt!.isBefore(now.add(const Duration(days: 7)))) {
        categories['expiring_soon']!.add(badge);
      } else {
        categories['active']!.add(badge);
      }
    }

    return categories;
  }

  /// Get badges sorted by priority for display
  static List<BadgeEntity> sortByDisplayPriority(List<BadgeEntity> badges) {
    return [...badges]..sort((a, b) {
      // Sort by type priority first
      final typePriority = a.type.priority.compareTo(b.type.priority);
      if (typePriority != 0) return typePriority;

      // Then by rarity (rare badges first)
      if (a.isRare && !b.isRare) return -1;
      if (!a.isRare && b.isRare) return 1;

      // Finally by earned date (newer first)
      if (a.earnedAt != null && b.earnedAt != null) {
        return b.earnedAt!.compareTo(a.earnedAt!);
      }

      return 0;
    });
  }

  /// Check if profile has verification badges
  static bool hasVerificationBadges(List<BadgeEntity> badges) {
    return badges.any((badge) => badge.type == BadgeType.verification);
  }

  /// Get rarity score for badge collection
  static double getRarityScore(List<BadgeEntity> badges) {
    if (badges.isEmpty) return 0.0;

    final rareCount = badges.where((badge) => badge.isRare).length;
    return rareCount / badges.length;
  }
}
