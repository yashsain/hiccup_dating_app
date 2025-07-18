import 'package:freezed_annotation/freezed_annotation.dart';

part 'interest_entity.freezed.dart';

/// 🎯 Interest Entity - Clean Domain Model for User Interests (2025)
///
/// This entity represents a user's interest or hobby.
/// Based on the design document, users can have up to 10 interests.
///
/// Features:
/// - Immutable data structure
/// - Built-in validation (50 char limit)
/// - Type-safe properties
/// - Category classification
/// - Freezed for equality and copyWith
///
/// Usage:
/// ```dart
/// final interest = InterestEntity(
///   id: 'interest_123',
///   profileId: 'user_123',
///   interest: 'Photography',
///   category: InterestCategory.creative,
/// );
/// ```

enum InterestCategory {
  sports,
  creative,
  outdoor,
  technology,
  food,
  music,
  travel,
  fitness,
  gaming,
  reading,
  social,
  professional,
  other;

  String get displayName {
    switch (this) {
      case InterestCategory.sports:
        return 'Sports';
      case InterestCategory.creative:
        return 'Creative';
      case InterestCategory.outdoor:
        return 'Outdoor';
      case InterestCategory.technology:
        return 'Technology';
      case InterestCategory.food:
        return 'Food & Drink';
      case InterestCategory.music:
        return 'Music';
      case InterestCategory.travel:
        return 'Travel';
      case InterestCategory.fitness:
        return 'Fitness';
      case InterestCategory.gaming:
        return 'Gaming';
      case InterestCategory.reading:
        return 'Reading';
      case InterestCategory.social:
        return 'Social';
      case InterestCategory.professional:
        return 'Professional';
      case InterestCategory.other:
        return 'Other';
    }
  }

  String get emoji {
    switch (this) {
      case InterestCategory.sports:
        return '⚽';
      case InterestCategory.creative:
        return '🎨';
      case InterestCategory.outdoor:
        return '🏔️';
      case InterestCategory.technology:
        return '💻';
      case InterestCategory.food:
        return '🍕';
      case InterestCategory.music:
        return '🎵';
      case InterestCategory.travel:
        return '✈️';
      case InterestCategory.fitness:
        return '💪';
      case InterestCategory.gaming:
        return '🎮';
      case InterestCategory.reading:
        return '📚';
      case InterestCategory.social:
        return '👥';
      case InterestCategory.professional:
        return '💼';
      case InterestCategory.other:
        return '🌟';
    }
  }

  int get priority {
    switch (this) {
      case InterestCategory.sports:
        return 1;
      case InterestCategory.creative:
        return 2;
      case InterestCategory.outdoor:
        return 3;
      case InterestCategory.technology:
        return 4;
      case InterestCategory.food:
        return 5;
      case InterestCategory.music:
        return 6;
      case InterestCategory.travel:
        return 7;
      case InterestCategory.fitness:
        return 8;
      case InterestCategory.gaming:
        return 9;
      case InterestCategory.reading:
        return 10;
      case InterestCategory.social:
        return 11;
      case InterestCategory.professional:
        return 12;
      case InterestCategory.other:
        return 13;
    }
  }

  List<String> get commonInterests {
    switch (this) {
      case InterestCategory.sports:
        return [
          'Football',
          'Basketball',
          'Tennis',
          'Soccer',
          'Baseball',
          'Hockey',
          'Golf',
          'Swimming',
        ];
      case InterestCategory.creative:
        return [
          'Photography',
          'Painting',
          'Drawing',
          'Writing',
          'Sculpting',
          'Crafting',
          'Design',
          'Music Production',
        ];
      case InterestCategory.outdoor:
        return [
          'Hiking',
          'Camping',
          'Rock Climbing',
          'Skiing',
          'Surfing',
          'Fishing',
          'Kayaking',
          'Cycling',
        ];
      case InterestCategory.technology:
        return [
          'Programming',
          'AI/ML',
          'Robotics',
          'Web Development',
          'Mobile Apps',
          'Gaming',
          'VR/AR',
          'Blockchain',
        ];
      case InterestCategory.food:
        return [
          'Cooking',
          'Baking',
          'Wine Tasting',
          'Coffee',
          'Food Photography',
          'Restaurant Hopping',
          'Grilling',
          'Vegetarian',
        ];
      case InterestCategory.music:
        return [
          'Live Concerts',
          'Playing Guitar',
          'Singing',
          'DJing',
          'Classical Music',
          'Jazz',
          'Rock',
          'Electronic',
        ];
      case InterestCategory.travel:
        return [
          'Backpacking',
          'Road Trips',
          'Cultural Tours',
          'Adventure Travel',
          'Beach Vacations',
          'City Breaks',
          'Solo Travel',
          'Food Tourism',
        ];
      case InterestCategory.fitness:
        return [
          'Yoga',
          'CrossFit',
          'Running',
          'Weightlifting',
          'Pilates',
          'Martial Arts',
          'Dancing',
          'Rock Climbing',
        ];
      case InterestCategory.gaming:
        return [
          'Video Games',
          'Board Games',
          'Card Games',
          'Esports',
          'RPGs',
          'Strategy Games',
          'Mobile Gaming',
          'VR Gaming',
        ];
      case InterestCategory.reading:
        return [
          'Fiction',
          'Non-fiction',
          'Mystery',
          'Romance',
          'Sci-Fi',
          'Biography',
          'Poetry',
          'Audiobooks',
        ];
      case InterestCategory.social:
        return [
          'Volunteering',
          'Networking',
          'Parties',
          'Meetups',
          'Community',
          'Activism',
          'Events',
          'Charity',
        ];
      case InterestCategory.professional:
        return [
          'Entrepreneurship',
          'Leadership',
          'Marketing',
          'Finance',
          'Consulting',
          'Startups',
          'Business',
          'Investing',
        ];
      case InterestCategory.other:
        return [
          'Collecting',
          'Astrology',
          'Fashion',
          'Beauty',
          'Pets',
          'Cars',
          'History',
          'Philosophy',
        ];
    }
  }
}

@freezed
class InterestEntity with _$InterestEntity {
  const factory InterestEntity({
    required String id,
    required String profileId,
    required String interest,
    required InterestCategory category,
    @Default(0) int popularity,
    @Default(false) bool isCustom,
    required DateTime createdAt,
  }) = _InterestEntity;

  const InterestEntity._();

  // ✅ Validation Methods
  bool get isValid {
    return _validateInterest() && _validatePopularity();
  }

  bool _validateInterest() {
    return interest.trim().isNotEmpty &&
        interest.length >= 2 &&
        interest.length <= 50;
  }

  bool _validatePopularity() {
    return popularity >= 0 && popularity <= 100;
  }

  // 📊 Computed Properties
  String get displayInterest => interest.trim();

  String get displayWithEmoji => '${category.emoji} $displayInterest';

  bool get isPopular => popularity >= 70;

  bool get isNiche => popularity <= 20;

  String get popularityLevel {
    if (popularity >= 80) return 'Very Popular';
    if (popularity >= 60) return 'Popular';
    if (popularity >= 40) return 'Moderate';
    if (popularity >= 20) return 'Niche';
    return 'Very Niche';
  }

  // 🎯 Business Logic Helpers
  bool get canEdit => isCustom; // Only custom interests can be edited

  bool get isPredefined => !isCustom;

  bool get isCommonInterest {
    return category.commonInterests
        .map((e) => e.toLowerCase())
        .contains(interest.toLowerCase());
  }

  // 🔍 Search Helpers
  List<String> get searchKeywords {
    final keywords = <String>[];
    keywords.add(interest.toLowerCase());
    keywords.add(category.displayName.toLowerCase());
    keywords.addAll(interest.toLowerCase().split(' '));
    return keywords
        .where((keyword) => keyword.isNotEmpty && keyword.length > 1)
        .toList();
  }

  // 🎨 Display Helpers
  String get categoryDisplay => '${category.emoji} ${category.displayName}';

  String get fullDisplay => '$displayInterest (${category.displayName})';

  // 🧪 Factory constructors for testing
  factory InterestEntity.empty() {
    return InterestEntity(
      id: '',
      profileId: '',
      interest: '',
      category: InterestCategory.other,
      createdAt: DateTime.now(),
    );
  }

  factory InterestEntity.sample(String interestName, InterestCategory cat) {
    final popularity = _getPopularityForInterest(interestName);

    return InterestEntity(
      id: 'interest_${interestName.toLowerCase().replaceAll(' ', '_')}',
      profileId: 'sample_profile',
      interest: interestName,
      category: cat,
      popularity: popularity,
      isCustom: !cat.commonInterests.contains(interestName),
      createdAt: DateTime.now().subtract(Duration(days: popularity ~/ 10)),
    );
  }

  static int _getPopularityForInterest(String interest) {
    // Simulate popularity based on interest type
    final popularInterests = [
      'Photography',
      'Hiking',
      'Cooking',
      'Travel',
      'Music',
      'Reading',
    ];

    if (popularInterests.contains(interest)) {
      return 75 + (interest.hashCode % 25); // 75-99 range
    } else {
      return 25 + (interest.hashCode % 50); // 25-74 range
    }
  }

  // Sample interest sets
  static List<InterestEntity> sampleInterests() {
    return [
      InterestEntity.sample('Photography', InterestCategory.creative),
      InterestEntity.sample('Hiking', InterestCategory.outdoor),
      InterestEntity.sample('Cooking', InterestCategory.food),
      InterestEntity.sample('Travel', InterestCategory.travel),
      InterestEntity.sample('Reading', InterestCategory.reading),
      InterestEntity.sample('Yoga', InterestCategory.fitness),
      InterestEntity.sample('Gaming', InterestCategory.gaming),
    ];
  }
}

/// 🎯 Interest Entity Extensions - Additional functionality
extension InterestEntityExtensions on InterestEntity {
  /// Check if interest is recently added (within last 7 days)
  bool get isRecentlyAdded {
    return DateTime.now().difference(createdAt).inDays <= 7;
  }

  /// Get interest age in days
  int get interestAgeInDays {
    return DateTime.now().difference(createdAt).inDays;
  }

  /// Check if interest matches another interest (fuzzy matching)
  bool matchesInterest(String otherInterest) {
    final thisLower = interest.toLowerCase().trim();
    final otherLower = otherInterest.toLowerCase().trim();

    // Exact match
    if (thisLower == otherLower) return true;

    // Contains match
    if (thisLower.contains(otherLower) || otherLower.contains(thisLower)) {
      return true;
    }

    // Word overlap
    final thisWords = thisLower.split(' ');
    final otherWords = otherLower.split(' ');
    final overlap = thisWords.toSet().intersection(otherWords.toSet());

    return overlap.isNotEmpty;
  }

  /// Get compatibility score with another interest (0-100)
  int getCompatibilityScore(InterestEntity other) {
    // Same interest = 100% compatibility
    if (matchesInterest(other.interest)) return 100;

    // Same category = 60% compatibility
    if (category == other.category) return 60;

    // Related categories get partial compatibility
    final relatedCategories = _getRelatedCategories();
    if (relatedCategories.contains(other.category)) return 30;

    return 0;
  }

  List<InterestCategory> _getRelatedCategories() {
    switch (category) {
      case InterestCategory.sports:
        return [InterestCategory.fitness, InterestCategory.outdoor];
      case InterestCategory.creative:
        return [InterestCategory.music, InterestCategory.reading];
      case InterestCategory.outdoor:
        return [
          InterestCategory.sports,
          InterestCategory.fitness,
          InterestCategory.travel,
        ];
      case InterestCategory.technology:
        return [InterestCategory.gaming, InterestCategory.professional];
      case InterestCategory.food:
        return [InterestCategory.travel, InterestCategory.social];
      case InterestCategory.music:
        return [InterestCategory.creative, InterestCategory.social];
      case InterestCategory.travel:
        return [InterestCategory.outdoor, InterestCategory.food];
      case InterestCategory.fitness:
        return [InterestCategory.sports, InterestCategory.outdoor];
      case InterestCategory.gaming:
        return [InterestCategory.technology, InterestCategory.social];
      case InterestCategory.reading:
        return [InterestCategory.creative, InterestCategory.professional];
      case InterestCategory.social:
        return [InterestCategory.music, InterestCategory.gaming];
      case InterestCategory.professional:
        return [InterestCategory.technology, InterestCategory.reading];
      case InterestCategory.other:
        return [];
    }
  }

  /// Generate interest summary for profile display
  String get interestSummary {
    final buffer = StringBuffer();
    buffer.write(displayInterest);

    if (isPopular) {
      buffer.write(' 🔥');
    } else if (isNiche) {
      buffer.write(' 💎');
    }

    return buffer.toString();
  }
}
