import 'package:equatable/equatable.dart';

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
/// - Equatable for easy comparison
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
        return '🍽️';
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
        return '🔍';
    }
  }

  // Common interests for each category
  List<String> get commonInterests {
    switch (this) {
      case InterestCategory.sports:
        return [
          'Football',
          'Basketball',
          'Tennis',
          'Soccer',
          'Swimming',
          'Running',
          'Baseball',
          'Golf',
        ];
      case InterestCategory.creative:
        return [
          'Photography',
          'Painting',
          'Drawing',
          'Writing',
          'Design',
          'Crafts',
          'Pottery',
          'Singing',
        ];
      case InterestCategory.outdoor:
        return [
          'Hiking',
          'Camping',
          'Rock Climbing',
          'Biking',
          'Fishing',
          'Gardening',
          'Beach',
          'Nature',
        ];
      case InterestCategory.technology:
        return [
          'Programming',
          'Gaming',
          'AI',
          'Gadgets',
          'Coding',
          'Tech News',
          'Apps',
          'Innovation',
        ];
      case InterestCategory.food:
        return [
          'Cooking',
          'Baking',
          'Wine',
          'Coffee',
          'Restaurants',
          'Food Trucks',
          'Cocktails',
          'Vegan',
        ];
      case InterestCategory.music:
        return [
          'Jazz',
          'Rock',
          'Pop',
          'Classical',
          'Hip Hop',
          'Country',
          'Electronic',
          'Concerts',
        ];
      case InterestCategory.travel:
        return [
          'Backpacking',
          'Road Trips',
          'International',
          'Solo Travel',
          'Adventure',
          'Culture',
          'Hotels',
          'Flights',
        ];
      case InterestCategory.fitness:
        return [
          'Yoga',
          'Gym',
          'Pilates',
          'CrossFit',
          'Cycling',
          'Martial Arts',
          'Dance',
          'Meditation',
        ];
      case InterestCategory.gaming:
        return [
          'Video Games',
          'Board Games',
          'PC Gaming',
          'Console',
          'Mobile Games',
          'VR',
          'Esports',
          'Streaming',
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

class InterestEntity extends Equatable {
  // 🔑 Core Identity
  final String id;
  final String profileId;

  // 💭 Content
  final String interest;
  final InterestCategory category;

  // 🎯 Metadata
  final int popularity; // How many people share this interest (0-100)
  final bool isCustom; // User-created vs predefined

  // ⏰ Timestamps
  final DateTime createdAt;

  const InterestEntity({
    required this.id,
    required this.profileId,
    required this.interest,
    required this.category,
    this.popularity = 0,
    this.isCustom = false,
    required this.createdAt,
  });

  // 🔄 Copy with method for immutable updates
  InterestEntity copyWith({
    String? id,
    String? profileId,
    String? interest,
    InterestCategory? category,
    int? popularity,
    bool? isCustom,
    DateTime? createdAt,
  }) {
    return InterestEntity(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      interest: interest ?? this.interest,
      category: category ?? this.category,
      popularity: popularity ?? this.popularity,
      isCustom: isCustom ?? this.isCustom,
      createdAt: createdAt ?? this.createdAt,
    );
  }

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

  String get displayCategory => category.displayName;

  String get categoryEmoji => category.emoji;

  bool get isPopular => popularity >= 70;

  bool get isNiche => popularity <= 20;

  // 🎯 Display Helpers
  String get displayWithEmoji => '$categoryEmoji $displayInterest';

  String get displayWithCategory =>
      '$displayInterest • ${category.displayName}';

  String get popularityDisplay {
    if (popularity >= 80) return 'Very Popular';
    if (popularity >= 60) return 'Popular';
    if (popularity >= 40) return 'Common';
    if (popularity >= 20) return 'Niche';
    return 'Unique';
  }

  // 🔍 Search Helpers
  List<String> get searchKeywords {
    final keywords = <String>[];

    keywords.add(interest.toLowerCase());
    keywords.add(category.displayName.toLowerCase());
    keywords.addAll(interest.toLowerCase().split(' '));

    return keywords.where((keyword) => keyword.isNotEmpty).toList();
  }

  // 🎨 Matching Helpers
  bool matchesInterest(String otherInterest) {
    return interest.toLowerCase() == otherInterest.toLowerCase();
  }

  bool matchesCategory(InterestCategory otherCategory) {
    return category == otherCategory;
  }

  double similarityScore(InterestEntity other) {
    // Same interest = 1.0
    if (matchesInterest(other.interest)) return 1.0;

    // Same category = 0.3
    if (matchesCategory(other.category)) return 0.3;

    // Check for keyword overlap
    final myKeywords = searchKeywords.toSet();
    final otherKeywords = other.searchKeywords.toSet();
    final overlap = myKeywords.intersection(otherKeywords).length;
    final total = myKeywords.union(otherKeywords).length;

    return overlap / total * 0.5;
  }

  // 📋 Equatable implementation
  @override
  List<Object?> get props => [
    id,
    profileId,
    interest,
    category,
    popularity,
    isCustom,
    createdAt,
  ];

  // 🔍 Debug representation
  @override
  String toString() {
    return 'InterestEntity('
        'id: $id, '
        'profileId: $profileId, '
        'interest: "$displayInterest", '
        'category: ${category.displayName}, '
        'popularity: $popularity, '
        'custom: $isCustom'
        ')';
  }

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

  factory InterestEntity.sample1() {
    return InterestEntity(
      id: 'interest_1',
      profileId: 'user_123',
      interest: 'Photography',
      category: InterestCategory.creative,
      popularity: 75,
      isCustom: false,
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
    );
  }

  factory InterestEntity.sample2() {
    return InterestEntity(
      id: 'interest_2',
      profileId: 'user_123',
      interest: 'Hiking',
      category: InterestCategory.outdoor,
      popularity: 85,
      isCustom: false,
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    );
  }

  factory InterestEntity.sample3() {
    return InterestEntity(
      id: 'interest_3',
      profileId: 'user_123',
      interest: 'Coffee Brewing',
      category: InterestCategory.food,
      popularity: 45,
      isCustom: true,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
    );
  }
}

/// 🎯 Interest Entity Extensions - Additional functionality
extension InterestEntityExtensions on InterestEntity {
  /// Check if interest was recently created (within last 7 days)
  bool get isRecentlyCreated {
    return DateTime.now().difference(createdAt).inDays <= 7;
  }

  /// Get creation time in human readable format
  String get createdTimeAgo {
    final difference = DateTime.now().difference(createdAt);

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

  /// Get suggested related interests
  List<String> get relatedInterests {
    final related = <String>[];

    // Add 3-5 related interests from the same category
    final categoryInterests = category.commonInterests;
    categoryInterests.shuffle();

    for (final relatedInterest in categoryInterests) {
      if (relatedInterest.toLowerCase() != interest.toLowerCase()) {
        related.add(relatedInterest);
        if (related.length >= 5) break;
      }
    }

    return related;
  }

  /// Generate interest hashtags
  List<String> get hashtags {
    final hashtags = <String>[];

    // Add main hashtag
    hashtags.add('#${interest.replaceAll(' ', '').toLowerCase()}');

    // Add category hashtag
    hashtags.add('#${category.displayName.replaceAll(' ', '').toLowerCase()}');

    // Add popular hashtag if popular
    if (isPopular) {
      hashtags.add('#popular');
    }

    return hashtags;
  }

  /// Check if interest is suitable for matching
  bool get isSuitableForMatching {
    return interest.length >= 3 && !isCustom || (isCustom && popularity >= 10);
  }
}

/// 🎯 Interest Helpers - Static utility methods
class InterestHelpers {
  /// Categorize an interest automatically
  static InterestCategory categorizeInterest(String interest) {
    final lowerInterest = interest.toLowerCase();

    for (final category in InterestCategory.values) {
      if (category.commonInterests.any(
        (common) =>
            common.toLowerCase().contains(lowerInterest) ||
            lowerInterest.contains(common.toLowerCase()),
      )) {
        return category;
      }
    }

    return InterestCategory.other;
  }

  /// Get popular interests across all categories
  static List<String> getPopularInterests() {
    final popular = <String>[];

    for (final category in InterestCategory.values) {
      popular.addAll(category.commonInterests.take(3));
    }

    return popular;
  }

  /// Get trending interests (mock data for now)
  static List<String> getTrendingInterests() {
    return [
      'Sustainable Living',
      'Mindfulness',
      'Plant-Based Cooking',
      'Digital Detox',
      'Urban Gardening',
      'Cryptocurrency',
      'NFTs',
      'Podcasting',
      'Home Brewing',
      'Vintage Shopping',
    ];
  }

  /// Validate interest name
  static bool isValidInterestName(String interest) {
    return interest.trim().isNotEmpty &&
        interest.length >= 2 &&
        interest.length <= 50 &&
        !interest.contains(RegExp(r'[<>{}[\]\\|`~!@#$%^&*()+=]'));
  }

  /// Generate interest suggestions based on existing interests
  static List<String> getSuggestions(List<InterestEntity> existingInterests) {
    final suggestions = <String>[];
    final existingNames = existingInterests
        .map((i) => i.interest.toLowerCase())
        .toSet();

    // Group by category
    final categoryCounts = <InterestCategory, int>{};
    for (final interest in existingInterests) {
      categoryCounts[interest.category] =
          (categoryCounts[interest.category] ?? 0) + 1;
    }

    // Suggest from most popular categories
    final sortedCategories = categoryCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    for (final entry in sortedCategories) {
      final categoryInterests = entry.key.commonInterests;

      for (final interest in categoryInterests) {
        if (!existingNames.contains(interest.toLowerCase())) {
          suggestions.add(interest);
          if (suggestions.length >= 10) break;
        }
      }

      if (suggestions.length >= 10) break;
    }

    return suggestions;
  }
}
