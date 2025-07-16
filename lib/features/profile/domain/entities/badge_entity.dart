import 'package:equatable/equatable.dart';

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
/// - Equatable for easy comparison
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
      case BadgeType.achievement:
        return 3;
      case BadgeType.personality:
        return 4;
      case BadgeType.interest:
        return 5;
      case BadgeType.special:
        return 6; // Lowest priority
    }
  }

  // Common badges for each type
  List<String> get commonBadges {
    switch (this) {
      case BadgeType.verification:
        return [
          'Verified',
          'Photo Verified',
          'Identity Verified',
          'Phone Verified',
        ];
      case BadgeType.achievement:
        return [
          'Early Adopter',
          'Active User',
          'Match Maker',
          'Conversation Starter',
          'Profile Complete',
        ];
      case BadgeType.personality:
        return [
          'Adventurous',
          'Foodie',
          'Bookworm',
          'Fitness Enthusiast',
          'Creative Soul',
          'Tech Savvy',
        ];
      case BadgeType.interest:
        return [
          'Dog Lover',
          'Cat Person',
          'Travel Junkie',
          'Music Lover',
          'Art Enthusiast',
          'Sports Fan',
        ];
      case BadgeType.premium:
        return ['Premium Member', 'VIP', 'Supporter', 'Exclusive Access'];
      case BadgeType.special:
        return [
          'Beta Tester',
          'Community Leader',
          'Influencer',
          'Brand Ambassador',
          'Featured User',
        ];
    }
  }
}

enum BadgeRarity {
  common,
  uncommon,
  rare,
  epic,
  legendary;

  String get displayName {
    switch (this) {
      case BadgeRarity.common:
        return 'Common';
      case BadgeRarity.uncommon:
        return 'Uncommon';
      case BadgeRarity.rare:
        return 'Rare';
      case BadgeRarity.epic:
        return 'Epic';
      case BadgeRarity.legendary:
        return 'Legendary';
    }
  }

  String get color {
    switch (this) {
      case BadgeRarity.common:
        return '#6B7280'; // Gray
      case BadgeRarity.uncommon:
        return '#10B981'; // Green
      case BadgeRarity.rare:
        return '#3B82F6'; // Blue
      case BadgeRarity.epic:
        return '#8B5CF6'; // Purple
      case BadgeRarity.legendary:
        return '#F59E0B'; // Gold
    }
  }

  double get dropRate {
    switch (this) {
      case BadgeRarity.common:
        return 0.60; // 60%
      case BadgeRarity.uncommon:
        return 0.25; // 25%
      case BadgeRarity.rare:
        return 0.10; // 10%
      case BadgeRarity.epic:
        return 0.04; // 4%
      case BadgeRarity.legendary:
        return 0.01; // 1%
    }
  }
}

class BadgeEntity extends Equatable {
  // 🔑 Core Identity
  final String id;
  final String profileId;

  // 💭 Content
  final String badge;
  final BadgeType type;
  final BadgeRarity rarity;

  // 🎯 Properties
  final bool isVisible;
  final bool isAutoAwarded; // System-awarded vs manually added
  final String? description;
  final String? iconPath;

  // 📊 Metadata
  final int displayOrder;
  final DateTime? expiresAt; // For time-limited badges

  // ⏰ Timestamps
  final DateTime createdAt;
  final DateTime? awardedAt;

  const BadgeEntity({
    required this.id,
    required this.profileId,
    required this.badge,
    required this.type,
    this.rarity = BadgeRarity.common,
    this.isVisible = true,
    this.isAutoAwarded = false,
    this.description,
    this.iconPath,
    this.displayOrder = 0,
    this.expiresAt,
    required this.createdAt,
    this.awardedAt,
  });

  // 🔄 Copy with method for immutable updates
  BadgeEntity copyWith({
    String? id,
    String? profileId,
    String? badge,
    BadgeType? type,
    BadgeRarity? rarity,
    bool? isVisible,
    bool? isAutoAwarded,
    String? description,
    String? iconPath,
    int? displayOrder,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? awardedAt,
  }) {
    return BadgeEntity(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      badge: badge ?? this.badge,
      type: type ?? this.type,
      rarity: rarity ?? this.rarity,
      isVisible: isVisible ?? this.isVisible,
      isAutoAwarded: isAutoAwarded ?? this.isAutoAwarded,
      description: description ?? this.description,
      iconPath: iconPath ?? this.iconPath,
      displayOrder: displayOrder ?? this.displayOrder,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      awardedAt: awardedAt ?? this.awardedAt,
    );
  }

  // ✅ Validation Methods
  bool get isValid {
    return _validateBadge() && _validateDisplayOrder();
  }

  bool _validateBadge() {
    return badge.trim().isNotEmpty && badge.length <= 50;
  }

  bool _validateDisplayOrder() {
    return displayOrder >= 0 && displayOrder <= 100;
  }

  // 📊 Computed Properties
  String get displayBadge => badge.trim();

  String get displayType => type.displayName;

  String get displayRarity => rarity.displayName;

  String get typeEmoji => type.emoji;

  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);

  bool get isActive => isVisible && !isExpired;

  bool get isPermanent => expiresAt == null;

  bool get isVerificationBadge => type == BadgeType.verification;

  bool get isPremiumBadge => type == BadgeType.premium;

  bool get isRare =>
      rarity == BadgeRarity.rare ||
      rarity == BadgeRarity.epic ||
      rarity == BadgeRarity.legendary;

  // 🎯 Display Helpers
  String get displayWithEmoji => '$typeEmoji $displayBadge';

  String get displayWithRarity => '$displayBadge (${rarity.displayName})';

  String get fullDisplay => '$typeEmoji $displayBadge • ${rarity.displayName}';

  String get shortDescription => description ?? 'No description available';

  // ⏰ Time Helpers
  String get expirationDisplay {
    if (expiresAt == null) return 'Permanent';
    if (isExpired) return 'Expired';

    final difference = expiresAt!.difference(DateTime.now());

    if (difference.inDays > 0) {
      return 'Expires in ${difference.inDays} day${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inHours > 0) {
      return 'Expires in ${difference.inHours} hour${difference.inHours > 1 ? 's' : ''}';
    } else if (difference.inMinutes > 0) {
      return 'Expires in ${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''}';
    } else {
      return 'Expires soon';
    }
  }

  String get awardedTimeAgo {
    final awardTime = awardedAt ?? createdAt;
    final difference = DateTime.now().difference(awardTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  // 🔍 Search Helpers
  List<String> get searchKeywords {
    final keywords = <String>[];

    keywords.add(badge.toLowerCase());
    keywords.add(type.displayName.toLowerCase());
    keywords.add(rarity.displayName.toLowerCase());
    keywords.addAll(badge.toLowerCase().split(' '));

    if (description != null) {
      keywords.addAll(description!.toLowerCase().split(' '));
    }

    return keywords.where((keyword) => keyword.isNotEmpty).toList();
  }

  // 🎨 UI Helpers
  String get rarityColor => rarity.color;

  int get sortPriority => type.priority * 100 + (100 - displayOrder);

  double get rarityScore => 1.0 - rarity.dropRate;

  // 🏆 Achievement Helpers
  bool get isNewlyAwarded {
    final awardTime = awardedAt ?? createdAt;
    return DateTime.now().difference(awardTime).inDays <= 3;
  }

  bool get isSpecialBadge =>
      type == BadgeType.special || rarity == BadgeRarity.legendary;

  // 📋 Equatable implementation
  @override
  List<Object?> get props => [
    id,
    profileId,
    badge,
    type,
    rarity,
    isVisible,
    isAutoAwarded,
    description,
    iconPath,
    displayOrder,
    expiresAt,
    createdAt,
    awardedAt,
  ];

  // 🔍 Debug representation
  @override
  String toString() {
    return 'BadgeEntity('
        'id: $id, '
        'profileId: $profileId, '
        'badge: "$displayBadge", '
        'type: ${type.displayName}, '
        'rarity: ${rarity.displayName}, '
        'visible: $isVisible, '
        'order: $displayOrder'
        ')';
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
      profileId: 'user_123',
      badge: 'Verified',
      type: BadgeType.verification,
      rarity: BadgeRarity.uncommon,
      isVisible: true,
      isAutoAwarded: true,
      description: 'Profile has been verified by Hiccup',
      displayOrder: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      awardedAt: DateTime.now().subtract(const Duration(days: 30)),
    );
  }

  factory BadgeEntity.premium() {
    return BadgeEntity(
      id: 'badge_premium',
      profileId: 'user_123',
      badge: 'Premium Member',
      type: BadgeType.premium,
      rarity: BadgeRarity.rare,
      isVisible: true,
      isAutoAwarded: true,
      description: 'Active Premium subscriber',
      displayOrder: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
      awardedAt: DateTime.now().subtract(const Duration(days: 15)),
      expiresAt: DateTime.now().add(
        const Duration(days: 15),
      ), // 30-day subscription
    );
  }

  factory BadgeEntity.dogLover() {
    return BadgeEntity(
      id: 'badge_dog_lover',
      profileId: 'user_123',
      badge: 'Dog Lover',
      type: BadgeType.interest,
      rarity: BadgeRarity.common,
      isVisible: true,
      isAutoAwarded: false,
      description: 'Loves spending time with dogs',
      displayOrder: 3,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      awardedAt: DateTime.now().subtract(const Duration(days: 10)),
    );
  }

  factory BadgeEntity.earlyAdopter() {
    return BadgeEntity(
      id: 'badge_early_adopter',
      profileId: 'user_123',
      badge: 'Early Adopter',
      type: BadgeType.achievement,
      rarity: BadgeRarity.epic,
      isVisible: true,
      isAutoAwarded: true,
      description: 'One of the first 1000 users on Hiccup',
      displayOrder: 4,
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
      awardedAt: DateTime.now().subtract(const Duration(days: 60)),
    );
  }

  factory BadgeEntity.adventurous() {
    return BadgeEntity(
      id: 'badge_adventurous',
      profileId: 'user_123',
      badge: 'Adventurous',
      type: BadgeType.personality,
      rarity: BadgeRarity.uncommon,
      isVisible: true,
      isAutoAwarded: false,
      description: 'Always up for new experiences',
      displayOrder: 5,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      awardedAt: DateTime.now().subtract(const Duration(days: 5)),
    );
  }
}

/// 🎯 Badge Entity Extensions - Additional functionality
extension BadgeEntityExtensions on BadgeEntity {
  /// Check if badge was recently awarded (within last 7 days)
  bool get isRecentlyAwarded {
    final awardTime = awardedAt ?? createdAt;
    return DateTime.now().difference(awardTime).inDays <= 7;
  }

  /// Get badge value score for sorting/ranking
  double get valueScore {
    double score = 0.0;

    // Type priority (0.4 weight)
    score += (7 - type.priority) / 6.0 * 0.4;

    // Rarity score (0.4 weight)
    score += rarityScore * 0.4;

    // Visibility bonus (0.1 weight)
    if (isVisible) score += 0.1;

    // Auto-awarded bonus (0.1 weight)
    if (isAutoAwarded) score += 0.1;

    return score.clamp(0.0, 1.0);
  }

  /// Generate badge summary for display
  String get badgeSummary {
    final buffer = StringBuffer();
    buffer.write('$typeEmoji $displayBadge');

    if (rarity != BadgeRarity.common) {
      buffer.write(' (${rarity.displayName})');
    }

    if (!isPermanent) {
      buffer.write(' • $expirationDisplay');
    }

    return buffer.toString();
  }

  /// Check if badge should be highlighted in UI
  bool get shouldHighlight {
    return isNewlyAwarded || isSpecialBadge || isRare;
  }

  /// Get badge congratulations message
  String get congratulationsMessage {
    switch (type) {
      case BadgeType.verification:
        return 'Congratulations! Your profile has been verified.';
      case BadgeType.achievement:
        return 'Achievement unlocked! You earned the $displayBadge badge.';
      case BadgeType.personality:
        return 'Your personality shines! You got the $displayBadge badge.';
      case BadgeType.interest:
        return 'Great interests! You earned the $displayBadge badge.';
      case BadgeType.premium:
        return 'Welcome to Premium! Enjoy exclusive features.';
      case BadgeType.special:
        return 'Something special! You received the $displayBadge badge.';
    }
  }
}

/// 🎯 Badge Helpers - Static utility methods
class BadgeHelpers {
  /// Get all available badges
  static List<String> getAllBadges() {
    final badges = <String>[];

    for (final type in BadgeType.values) {
      badges.addAll(type.commonBadges);
    }

    return badges;
  }

  /// Get badges by type
  static List<String> getBadgesByType(BadgeType type) {
    return type.commonBadges;
  }

  /// Get badge suggestions for a profile
  static List<String> getSuggestions(
    List<BadgeEntity> existingBadges,
    List<String> interests,
  ) {
    final suggestions = <String>[];
    final existingNames = existingBadges
        .map((b) => b.badge.toLowerCase())
        .toSet();

    // Suggest interest-based badges
    for (final interest in interests) {
      final interestBadges = _getInterestBadges(interest);
      for (final badge in interestBadges) {
        if (!existingNames.contains(badge.toLowerCase())) {
          suggestions.add(badge);
        }
      }
    }

    // Suggest personality badges
    final personalityBadges = BadgeType.personality.commonBadges;
    for (final badge in personalityBadges) {
      if (!existingNames.contains(badge.toLowerCase())) {
        suggestions.add(badge);
      }
    }

    return suggestions.take(10).toList();
  }

  /// Get interest-based badge suggestions
  static List<String> _getInterestBadges(String interest) {
    final badges = <String>[];
    final lowerInterest = interest.toLowerCase();

    // Simple mapping - in real app, this would be more sophisticated
    if (lowerInterest.contains('dog')) badges.add('Dog Lover');
    if (lowerInterest.contains('cat')) badges.add('Cat Person');
    if (lowerInterest.contains('travel')) badges.add('Travel Junkie');
    if (lowerInterest.contains('music')) badges.add('Music Lover');
    if (lowerInterest.contains('food') || lowerInterest.contains('cooking'))
      badges.add('Foodie');
    if (lowerInterest.contains('book') || lowerInterest.contains('reading'))
      badges.add('Bookworm');
    if (lowerInterest.contains('fitness') || lowerInterest.contains('gym'))
      badges.add('Fitness Enthusiast');
    if (lowerInterest.contains('art') || lowerInterest.contains('creative'))
      badges.add('Creative Soul');
    if (lowerInterest.contains('tech') || lowerInterest.contains('programming'))
      badges.add('Tech Savvy');
    if (lowerInterest.contains('sport')) badges.add('Sports Fan');

    return badges;
  }

  /// Validate badge name
  static bool isValidBadgeName(String badge) {
    return badge.trim().isNotEmpty &&
        badge.length >= 2 &&
        badge.length <= 50 &&
        !badge.contains(RegExp(r'[<>{}[\]\\|`~!@#$%^&*()+=]'));
  }

  /// Get badge rarity based on criteria
  static BadgeRarity getBadgeRarity(BadgeType type, bool isAutoAwarded) {
    switch (type) {
      case BadgeType.verification:
        return BadgeRarity.uncommon;
      case BadgeType.premium:
        return BadgeRarity.rare;
      case BadgeType.achievement:
        return isAutoAwarded ? BadgeRarity.uncommon : BadgeRarity.common;
      case BadgeType.personality:
        return BadgeRarity.common;
      case BadgeType.interest:
        return BadgeRarity.common;
      case BadgeType.special:
        return BadgeRarity.epic;
    }
  }

  /// Sort badges by priority and rarity
  static List<BadgeEntity> sortBadges(List<BadgeEntity> badges) {
    final sorted = List<BadgeEntity>.from(badges);

    sorted.sort((a, b) {
      // First by visibility (visible first)
      if (a.isVisible != b.isVisible) {
        return a.isVisible ? -1 : 1;
      }

      // Then by type priority
      if (a.type.priority != b.type.priority) {
        return a.type.priority.compareTo(b.type.priority);
      }

      // Then by rarity (rare first)
      if (a.rarity != b.rarity) {
        return a.rarity.dropRate.compareTo(b.rarity.dropRate);
      }

      // Finally by display order
      return a.displayOrder.compareTo(b.displayOrder);
    });

    return sorted;
  }
}
