import 'package:freezed_annotation/freezed_annotation.dart';

part 'badge_entity.freezed.dart';

/// 🏆 Badge Entity - Clean Domain Model for User Achievements (2025)
///
/// This entity represents a user's badge or achievement.
/// Based on the design document, users can have up to 5 badges.
///
/// Features:
/// - Immutable data structure
/// - Built-in validation (50 char limit)
/// - Type-safe properties
/// - Badge type classification
/// - Freezed for equality and copyWith
///
/// Usage:
/// ```dart
/// final badge = BadgeEntity(
///   id: 'badge_123',
///   profileId: 'user_123',
///   badge: 'Verified',
///   type: BadgeType.verification,
///   isVisible: true,
/// );
/// ```

enum BadgeType {
  verification,
  achievement,
  personality,
  interest,
  premium,
  special;

  String get displayName {
    switch (this) {
      case BadgeType.verification:
        return 'Verification';
      case BadgeType.achievement:
        return 'Achievement';
      case BadgeType.personality:
        return 'Personality';
      case BadgeType.interest:
        return 'Interest';
      case BadgeType.premium:
        return 'Premium';
      case BadgeType.special:
        return 'Special';
    }
  }

  String get emoji {
    switch (this) {
      case BadgeType.verification:
        return '✅';
      case BadgeType.achievement:
        return '🏆';
      case BadgeType.personality:
        return '💫';
      case BadgeType.interest:
        return '🎯';
      case BadgeType.premium:
        return '💎';
      case BadgeType.special:
        return '⭐';
    }
  }

  int get priority {
    switch (this) {
      case BadgeType.verification:
        return 1; // Highest priority
      case BadgeType.premium:
        return 2;
      case BadgeType.special:
        return 3;
      case BadgeType.achievement:
        return 4;
      case BadgeType.personality:
        return 5;
      case BadgeType.interest:
        return 6; // Lowest priority
    }
  }

  String get description {
    switch (this) {
      case BadgeType.verification:
        return 'Identity and photo verification badges';
      case BadgeType.achievement:
        return 'Milestones and accomplishments';
      case BadgeType.personality:
        return 'Personality traits and characteristics';
      case BadgeType.interest:
        return 'Hobbies and interest-based badges';
      case BadgeType.premium:
        return 'Premium membership benefits';
      case BadgeType.special:
        return 'Limited edition and special event badges';
    }
  }

  List<String> get commonBadges {
    switch (this) {
      case BadgeType.verification:
        return [
          'Photo Verified',
          'ID Verified',
          'Phone Verified',
          'Email Verified',
        ];
      case BadgeType.achievement:
        return [
          'Early Adopter',
          'Conversation Starter',
          'Great Reviewer',
          'Popular Profile',
          'Match Maker',
        ];
      case BadgeType.personality:
        return [
          'Adventurous',
          'Creative Soul',
          'Bookworm',
          'Fitness Enthusiast',
          'Foodie',
          'Music Lover',
          'Pet Parent',
          'Travel Bug',
        ];
      case BadgeType.interest:
        return [
          'Photographer',
          'Hiker',
          'Chef',
          'Gamer',
          'Artist',
          'Athlete',
          'Reader',
          'Musician',
        ];
      case BadgeType.premium:
        return [
          'Premium Member',
          'VIP Access',
          'Priority Support',
          'Advanced Features',
        ];
      case BadgeType.special:
        return [
          'Beta Tester',
          'Community Champion',
          'Feature Contributor',
          'Anniversary Member',
          'Holiday Special',
        ];
    }
  }
}

@freezed
class BadgeEntity with _$BadgeEntity {
  const factory BadgeEntity({
    required String id,
    required String profileId,
    required String badge,
    required BadgeType type,
    String? description,
    @Default(true) bool isVisible,
    @Default(false) bool isRare,
    DateTime? earnedAt,
    DateTime? expiresAt,
    String? iconUrl,
    String? color, // Hex color for badge display
    required DateTime createdAt,
  }) = _BadgeEntity;

  const BadgeEntity._();

  // ✅ Validation Methods
  bool get isValid {
    return _validateBadge() && _validateDescription() && _validateDates();
  }

  bool _validateBadge() {
    return badge.trim().isNotEmpty && badge.length <= 50;
  }

  bool _validateDescription() {
    return description == null || description!.length <= 200;
  }

  bool _validateDates() {
    if (earnedAt != null && expiresAt != null) {
      return earnedAt!.isBefore(expiresAt!);
    }
    return true;
  }

  // 📊 Computed Properties
  String get displayBadge => badge.trim();

  String get displayWithEmoji => '${type.emoji} $displayBadge';

  bool get isActive {
    if (expiresAt == null) return true;
    return DateTime.now().isBefore(expiresAt!);
  }

  bool get isExpired => !isActive;

  bool get isNew {
    if (earnedAt == null) return false;
    return DateTime.now().difference(earnedAt!).inDays <= 7;
  }

  bool get isExpiringSoon {
    if (expiresAt == null) return false;
    return DateTime.now().add(const Duration(days: 30)).isAfter(expiresAt!);
  }

  String? get expirationStatus {
    if (expiresAt == null) return null;

    final now = DateTime.now();
    final difference = expiresAt!.difference(now);

    if (difference.isNegative) {
      return 'Expired';
    } else if (difference.inDays <= 7) {
      return 'Expires in ${difference.inDays} days';
    } else if (difference.inDays <= 30) {
      return 'Expires this month';
    } else {
      return 'Active';
    }
  }

  // 🎯 Business Logic Helpers
  bool get canBeDisplayed => isVisible && isActive;

  bool get isPermanent => expiresAt == null;

  bool get isTemporary => expiresAt != null;

  bool get isPredefined {
    return type.commonBadges
        .map((e) => e.toLowerCase())
        .contains(badge.toLowerCase());
  }

  bool get isCustom => !isPredefined;

  // 🎨 Display Helpers
  String get typeDisplay => '${type.emoji} ${type.displayName}';

  String get fullDisplay {
    final buffer = StringBuffer();
    buffer.write(displayBadge);

    if (isRare) buffer.write(' 💎');
    if (isNew) buffer.write(' 🆕');
    if (isExpiringSoon) buffer.write(' ⏰');

    return buffer.toString();
  }

  String get statusDisplay {
    if (isExpired) return 'Expired';
    if (isExpiringSoon) return 'Expiring Soon';
    if (isNew) return 'New';
    if (isRare) return 'Rare';
    return 'Active';
  }

  // 🔍 Search Helpers
  List<String> get searchKeywords {
    final keywords = <String>[];
    keywords.add(badge.toLowerCase());
    keywords.add(type.displayName.toLowerCase());
    keywords.addAll(badge.toLowerCase().split(' '));

    if (description != null) {
      keywords.addAll(description!.toLowerCase().split(' '));
    }

    return keywords
        .where((keyword) => keyword.isNotEmpty && keyword.length > 2)
        .toList();
  }

  // 🧪 Factory constructors for testing
  factory BadgeEntity.empty() {
    return BadgeEntity(
      id: '',
      profileId: '',
      badge: '',
      type: BadgeType.achievement,
      createdAt: DateTime.now(),
    );
  }

  factory BadgeEntity.verified() {
    return BadgeEntity(
      id: 'badge_verified',
      profileId: 'sample_profile',
      badge: 'Photo Verified',
      type: BadgeType.verification,
      description: 'Profile photo has been verified by our team',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 5)),
      iconUrl: '/icons/verified.png',
      color: '#4CAF50',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    );
  }

  factory BadgeEntity.premium() {
    return BadgeEntity(
      id: 'badge_premium',
      profileId: 'sample_profile',
      badge: 'Premium Member',
      type: BadgeType.premium,
      description: 'Enjoy exclusive premium features and benefits',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 30)),
      expiresAt: DateTime.now().add(
        const Duration(days: 335),
      ), // 1 year subscription
      iconUrl: '/icons/premium.png',
      color: '#FFD700',
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    );
  }

  factory BadgeEntity.earlyAdopter() {
    return BadgeEntity(
      id: 'badge_early_adopter',
      profileId: 'sample_profile',
      badge: 'Early Adopter',
      type: BadgeType.special,
      description: 'One of the first users to join Hiccup',
      isVisible: true,
      isRare: true,
      earnedAt: DateTime.now().subtract(const Duration(days: 100)),
      iconUrl: '/icons/early_adopter.png',
      color: '#9C27B0',
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
    );
  }

  factory BadgeEntity.adventurous() {
    return BadgeEntity(
      id: 'badge_adventurous',
      profileId: 'sample_profile',
      badge: 'Adventurous',
      type: BadgeType.personality,
      description: 'Loves exploring new places and trying new experiences',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 15)),
      iconUrl: '/icons/adventurous.png',
      color: '#FF5722',
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    );
  }

  // Sample badge sets
  static List<BadgeEntity> sampleBadges() {
    return [
      BadgeEntity.verified(),
      BadgeEntity.premium(),
      BadgeEntity.earlyAdopter(),
      BadgeEntity.adventurous(),
    ];
  }
}

/// 🎯 Badge Entity Extensions - Additional functionality
extension BadgeEntityExtensions on BadgeEntity {
  /// Check if badge is recently earned (within last 7 days)
  bool get isRecentlyEarned {
    if (earnedAt == null) return false;
    return DateTime.now().difference(earnedAt!).inDays <= 7;
  }

  /// Get badge age in days since earned
  int? get badgeAgeInDays {
    if (earnedAt == null) return null;
    return DateTime.now().difference(earnedAt!).inDays;
  }

  /// Get days until expiration
  int? get daysUntilExpiration {
    if (expiresAt == null) return null;
    final difference = expiresAt!.difference(DateTime.now());
    return difference.isNegative ? 0 : difference.inDays;
  }

  /// Check if badge has high display priority
  bool get hasHighPriority {
    return type.priority <= 3 && isVisible && isActive;
  }

  /// Get badge rarity level
  String get rarityLevel {
    if (isRare) return 'Rare';
    if (type == BadgeType.special) return 'Special';
    if (type == BadgeType.verification) return 'Standard';
    if (isPermanent) return 'Permanent';
    return 'Common';
  }

  /// Generate badge summary for display
  String get badgeSummary {
    final buffer = StringBuffer();
    buffer.write(displayBadge);

    if (isRare) buffer.write(' (Rare)');
    if (isNew) buffer.write(' (New)');
    if (isExpiringSoon) buffer.write(' (Expiring)');

    return buffer.toString();
  }

  /// Check if badge is worth highlighting
  bool get isWorthHighlighting {
    return isRare || isNew || type.priority <= 2;
  }

  /// Get badge color for UI display
  String get displayColor {
    if (color != null) return color!;

    // Default colors based on type
    switch (type) {
      case BadgeType.verification:
        return '#4CAF50'; // Green
      case BadgeType.achievement:
        return '#FF9800'; // Orange
      case BadgeType.personality:
        return '#E91E63'; // Pink
      case BadgeType.interest:
        return '#2196F3'; // Blue
      case BadgeType.premium:
        return '#FFD700'; // Gold
      case BadgeType.special:
        return '#9C27B0'; // Purple
    }
  }

  /// Format earned date for display
  String? get earnedDateDisplay {
    if (earnedAt == null) return null;

    final now = DateTime.now();
    final difference = now.difference(earnedAt!);

    if (difference.inDays == 0) {
      return 'Earned today';
    } else if (difference.inDays == 1) {
      return 'Earned yesterday';
    } else if (difference.inDays <= 7) {
      return 'Earned ${difference.inDays} days ago';
    } else if (difference.inDays <= 30) {
      return 'Earned ${(difference.inDays / 7).round()} weeks ago';
    } else {
      return 'Earned ${(difference.inDays / 30).round()} months ago';
    }
  }
}
