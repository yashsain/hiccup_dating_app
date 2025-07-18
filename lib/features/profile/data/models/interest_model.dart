import '../../domain/entities/interest_entity.dart';

/// 🎯 Interest Model - Entity ↔ Database Mapping (2025)
///
/// This model handles conversion between InterestEntity and database maps.
/// Interests represent user hobbies, activities, and passions that help
/// with matching and conversation starters.
/// Based on design document: max 10 interests per profile.
///
/// Key Features:
/// - Category-based interest organization
/// - Interest validation and deduplication
/// - Popularity tracking for suggestions
/// - Type-safe conversions with validation
/// - Easy backend swap capability
///
/// Usage:
/// ```dart
/// // Entity → Database
/// final map = InterestModel.toMap(interestEntity);
/// await database.insert('interests', map);
///
/// // Database → Entity
/// final interest = InterestModel.fromMap(databaseMap);
/// ```
class InterestModel {
  // 🚫 Private constructor - This is a utility class
  InterestModel._();

  /// 📤 Convert InterestEntity to Database Map
  ///
  /// Serializes interest data for SQLite storage with proper
  /// category enum handling and validation.
  static Map<String, dynamic> toMap(InterestEntity entity) {
    try {
      return {
        // 🔑 Primary identifiers
        'id': entity.id,
        'profile_id': entity.profileId,

        // 🎯 Interest content
        'interest': entity.interest
            .trim()
            .toLowerCase(), // Normalize for consistency
        'display_name': entity.interest, // Keep original formatting for display
        'category': entity.category.name, // enum to string
        // 📊 Metadata
        'is_custom': entity.isCustom ? 1 : 0, // SQLite boolean
        'popularity': entity.popularity,

        // ⏰ Timestamps
        'created_at': entity.createdAt.toIso8601String(),
      };
    } catch (e) {
      throw InterestModelException(
        'Failed to convert InterestEntity to Map: ${e.toString()}',
        entity.id,
      );
    }
  }

  /// 📥 Convert Database Map to InterestEntity
  ///
  /// Deserializes database data back into clean domain entity
  /// with proper enum conversion and validation.
  static InterestEntity fromMap(Map<String, dynamic> map) {
    try {
      // 🔍 Validate required fields
      _validateRequiredFields(map);

      return InterestEntity(
        // 🔑 Primary identifiers
        id: map['id'] as String,
        profileId: map['profile_id'] as String,

        // 🎯 Interest content (use display_name for proper formatting)
        interest: map['display_name'] as String? ?? map['interest'] as String,
        category: InterestCategory.values.firstWhere(
          (category) => category.name == map['category'],
          orElse: () => InterestCategory.other, // Default fallback
        ),

        // 📊 Metadata
        isCustom: (map['is_custom'] as int? ?? 0) == 1,
        popularity: map['popularity'] as int? ?? 0,

        // ⏰ Timestamps
        createdAt: DateTime.parse(map['created_at'] as String),
      );
    } catch (e) {
      throw InterestModelException(
        'Failed to convert Map to InterestEntity: ${e.toString()}',
        map['id']?.toString(),
      );
    }
  }

  /// 🔄 Convert multiple interests for bulk operations
  ///
  /// Efficiently converts a list of entities to database maps
  /// for batch insert/update operations.
  static List<Map<String, dynamic>> toMapList(List<InterestEntity> entities) {
    return entities.map((entity) => toMap(entity)).toList();
  }

  /// 📥 Convert multiple database maps to entities
  ///
  /// Efficiently converts database results to entity list
  /// with proper error handling and deduplication.
  static List<InterestEntity> fromMapList(List<Map<String, dynamic>> maps) {
    final entities = <InterestEntity>[];
    final seen = <String>{}; // Track duplicates
    final errors = <String>[];

    for (final map in maps) {
      try {
        final entity = fromMap(map);
        final normalizedInterest = entity.interest.trim().toLowerCase();

        // Skip duplicates (shouldn't happen with proper constraints)
        if (!seen.contains(normalizedInterest)) {
          entities.add(entity);
          seen.add(normalizedInterest);
        }
      } catch (e) {
        errors.add('Map ${map['id']}: ${e.toString()}');
      }
    }

    // Log errors but don't fail the entire operation
    if (errors.isNotEmpty) {
      print(
        '⚠️ InterestModel: Some interests failed to convert: ${errors.join(', ')}',
      );
    }

    return entities;
  }

  /// 🔄 Create maps for bulk interest addition
  ///
  /// Creates database maps for adding multiple interests at once
  /// with proper validation and deduplication.
  static List<Map<String, dynamic>> createBulkInsertMaps(
    String profileId,
    List<String> interests, {
    InterestCategory? defaultCategory,
  }) {
    final maps = <Map<String, dynamic>>[];
    final seen = <String>{};

    for (final interest in interests) {
      final normalized = interest.trim().toLowerCase();

      // Skip empty or duplicate interests
      if (normalized.isEmpty || seen.contains(normalized)) continue;
      seen.add(normalized);

      // Determine category (can be enhanced with ML/categorization)
      final category = defaultCategory ?? _categorizeInterest(interest);

      final entity = InterestEntity(
        id: '${profileId}_${normalized.replaceAll(' ', '_')}_${DateTime.now().millisecondsSinceEpoch}',
        profileId: profileId,
        interest: interest.trim(),
        category: category,
        createdAt: DateTime.now(),
      );

      maps.add(toMap(entity));
    }

    return maps;
  }

  /// 📊 Create popularity update maps
  ///
  /// Creates update maps for adjusting interest popularity scores
  /// based on usage patterns.
  static List<Map<String, dynamic>> createPopularityUpdateMaps(
    List<InterestEntity> interests,
    Map<String, int> popularityAdjustments,
  ) {
    return interests
        .where(
          (interest) => popularityAdjustments.containsKey(
            interest.interest.toLowerCase(),
          ),
        )
        .map((interest) {
          final adjustment =
              popularityAdjustments[interest.interest.toLowerCase()]!;
          final newScore = interest.popularity + adjustment;

          return {
            'id': interest.id,
            'popularity_score': newScore.clamp(
              0,
              1000,
            ), // Keep score in reasonable range
          };
        })
        .toList();
  }

  /// 🎯 Create verification update map
  ///
  /// Creates update map to mark an interest as verified
  /// (commonly used interests that are validated).
  static Map<String, dynamic> createVerificationMap(String interestId) {
    return {'id': interestId, 'is_verified': 1};
  }

  // 🛠️ PRIVATE HELPER METHODS

  /// Validate that all required fields are present and valid
  static void _validateRequiredFields(Map<String, dynamic> map) {
    final requiredFields = [
      'id',
      'profile_id',
      'interest',
      'category',
      'created_at',
    ];
    final missingFields = <String>[];

    for (final field in requiredFields) {
      if (!map.containsKey(field) || map[field] == null) {
        missingFields.add(field);
      }
    }

    if (missingFields.isNotEmpty) {
      throw InterestModelException(
        'Missing required fields: ${missingFields.join(', ')}',
        map['id']?.toString(),
      );
    }

    // Validate business rules
    _validateBusinessRules(map);
  }

  /// Validate business rules for interest data
  static void _validateBusinessRules(Map<String, dynamic> map) {
    // Validate interest name
    final interest = map['interest'] as String;
    if (interest.trim().isEmpty || interest.length > 50) {
      throw InterestModelException(
        'Interest must be 1-50 characters',
        map['id']?.toString(),
      );
    }

    // Check for inappropriate content (basic check)
    final lowerInterest = interest.toLowerCase();
    final inappropriateWords = [
      'hate',
      'violence',
      'illegal',
    ]; // Can be expanded
    for (final word in inappropriateWords) {
      if (lowerInterest.contains(word)) {
        throw InterestModelException(
          'Interest contains inappropriate content',
          map['id']?.toString(),
        );
      }
    }

    // Validate popularity score if present
    final popularityScore = map['popularity_score'] as int?;
    if (popularityScore != null &&
        (popularityScore < 0 || popularityScore > 1000)) {
      throw InterestModelException(
        'Popularity score must be 0-1000',
        map['id']?.toString(),
      );
    }
  }

  /// Simple interest categorization (can be enhanced with ML)
  static InterestCategory _categorizeInterest(String interest) {
    final lowerInterest = interest.toLowerCase();

    // Sports and fitness
    if (RegExp(
      r'\b(gym|fitness|running|soccer|basketball|tennis|yoga|hiking|cycling|swimming|football|baseball|volleyball|boxing|martial arts|crossfit)\b',
    ).hasMatch(lowerInterest)) {
      return InterestCategory.sports;
    }

    // Arts and creativity
    if (RegExp(
      r'\b(painting|drawing|photography|music|singing|dancing|writing|poetry|theater|art|crafts|design|sculpture)\b',
    ).hasMatch(lowerInterest)) {
      return InterestCategory.creative;
    }

    // Entertainment
    if (RegExp(
      r'\b(movies|tv|netflix|gaming|games|comedy|standup|concerts|festivals|nightlife)\b',
    ).hasMatch(lowerInterest)) {
      return InterestCategory.gaming;
    }

    // Food and drink
    if (RegExp(
      r'\b(cooking|baking|wine|beer|coffee|restaurants|food|cuisine|chef|cocktails|dining)\b',
    ).hasMatch(lowerInterest)) {
      return InterestCategory.food;
    }

    // Travel and adventure
    if (RegExp(
      r'\b(travel|traveling|backpacking|adventure|exploring|camping|beach|mountains|road trips|vacation)\b',
    ).hasMatch(lowerInterest)) {
      return InterestCategory.travel;
    }

    // Learning and education
    if (RegExp(
      r'\b(reading|books|learning|education|study|science|history|philosophy|languages|courses)\b',
    ).hasMatch(lowerInterest)) {
      return InterestCategory.reading;
    }

    // Technology
    if (RegExp(
      r'\b(technology|tech|programming|coding|computers|apps|gadgets|ai|robotics|startups)\b',
    ).hasMatch(lowerInterest)) {
      return InterestCategory.technology;
    }

    // Nature and outdoors
    if (RegExp(
      r'\b(nature|outdoors|gardening|plants|animals|pets|environment|sustainability|wildlife)\b',
    ).hasMatch(lowerInterest)) {
      return InterestCategory.outdoor;
    }

    // Default to other
    return InterestCategory.other;
  }
}

/// 🚨 Interest Model Exception - Custom error handling
///
/// Provides detailed error information for interest data conversion issues.
class InterestModelException implements Exception {
  final String message;
  final String? interestId;
  final DateTime timestamp;

  InterestModelException(this.message, [this.interestId])
    : timestamp = DateTime.now();

  @override
  String toString() {
    final id = interestId != null ? ' (Interest ID: $interestId)' : '';
    return 'InterestModelException$id: $message [${timestamp.toIso8601String()}]';
  }
}

/// 🧪 Interest Model Utilities - Helper methods for testing and validation
///
/// Utilities for testing the interest data layer and ensuring data integrity.
class InterestModelUtils {
  // 🚫 Private constructor - This is a utility class
  InterestModelUtils._();

  /// Popular interests by category (for suggestions)
  static final Map<InterestCategory, List<String>> popularInterestsByCategory =
      {
        InterestCategory.sports: [
          'Gym',
          'Running',
          'Yoga',
          'Hiking',
          'Swimming',
          'Cycling',
          'Soccer',
          'Basketball',
          'Tennis',
          'Boxing',
        ],
        InterestCategory.creative: [
          'Photography',
          'Music',
          'Painting',
          'Dancing',
          'Writing',
          'Singing',
          'Drawing',
          'Theater',
          'Crafts',
          'Design',
        ],
        InterestCategory.gaming: [
          'Movies',
          'Gaming',
          'TV Shows',
          'Comedy',
          'Concerts',
          'Festivals',
          'Nightlife',
          'Board Games',
          'Netflix',
          'Anime',
        ],
        InterestCategory.food: [
          'Cooking',
          'Wine',
          'Coffee',
          'Restaurants',
          'Baking',
          'Cocktails',
          'Food Festivals',
          'Beer',
          'Cuisine',
          'Dining',
        ],
        InterestCategory.travel: [
          'Travel',
          'Backpacking',
          'Road Trips',
          'Beach',
          'Mountains',
          'Camping',
          'Exploring',
          'Adventure Sports',
          'Vacation',
          'Culture',
        ],
        InterestCategory.reading: [
          'Reading',
          'Learning',
          'Science',
          'History',
          'Philosophy',
          'Languages',
          'Books',
          'Courses',
          'Education',
          'Research',
        ],
        InterestCategory.technology: [
          'Technology',
          'Programming',
          'Gaming',
          'Apps',
          'Gadgets',
          'AI',
          'Startups',
          'Innovation',
          'Coding',
          'Robotics',
        ],
        InterestCategory.outdoor: [
          'Nature',
          'Gardening',
          'Animals',
          'Pets',
          'Environment',
          'Wildlife',
          'Sustainability',
          'Plants',
          'Conservation',
          'Outdoors',
        ],
        InterestCategory.social: [
          'Fashion',
          'Shopping',
          'Self-care',
          'Wellness',
          'Meditation',
          'Spirituality',
          'Volunteering',
          'Social Causes',
          'Health',
          'Fitness',
        ],
        InterestCategory.other: [
          'Life',
          'People',
          'Fun',
          'Adventure',
          'Creativity',
          'Growth',
          'Happiness',
          'Connection',
          'Experiences',
          'Learning',
        ],
      };

  /// Create sample interest map for testing
  static Map<String, dynamic> createSampleMap({
    String? id,
    String? profileId,
    String? interest,
    InterestCategory? category,
    bool isVerified = false,
  }) {
    final selectedCategory = category ?? InterestCategory.lifestyle;
    final selectedInterest =
        interest ?? popularInterestsByCategory[selectedCategory]!.first;

    return {
      'id': id ?? 'test_interest_1',
      'profile_id': profileId ?? 'test_profile_1',
      'interest': selectedInterest.toLowerCase(),
      'display_name': selectedInterest,
      'category': selectedCategory.name,
      'is_verified': isVerified ? 1 : 0,
      'popularity_score': isVerified ? 100 : 10,
      'created_at': DateTime.now().toIso8601String(),
    };
  }

  /// Create sample interest set for a profile
  static List<Map<String, dynamic>> createSampleInterestSet(String profileId) {
    final interests = <String>[
      'Photography',
      'Hiking',
      'Coffee',
      'Travel',
      'Music',
      'Cooking',
      'Movies',
      'Reading',
      'Yoga',
      'Dancing',
    ];

    return interests.asMap().entries.map((entry) {
      final index = entry.key;
      final interest = entry.value;

      return createSampleMap(
        id: 'interest_${profileId}_${index + 1}',
        profileId: profileId,
        interest: interest,
        isVerified: index < 3, // First 3 are verified
      );
    }).toList();
  }

  /// Validate interest entity can be converted to map and back
  static bool validateRoundTrip(InterestEntity entity) {
    try {
      final map = InterestModel.toMap(entity);
      final restored = InterestModel.fromMap(map);

      return entity.id == restored.id &&
          entity.profileId == restored.profileId &&
          entity.interest.toLowerCase() == restored.interest.toLowerCase() &&
          entity.category == restored.category;
    } catch (e) {
      return false;
    }
  }

  /// Get suggested interests based on existing interests
  static List<String> getSuggestedInterests(
    List<InterestEntity> existingInterests, {
    int limit = 10,
  }) {
    final existingNames = existingInterests
        .map((i) => i.interest.toLowerCase())
        .toSet();

    final suggestions = <String>[];

    // Get suggestions from same categories as existing interests
    for (final interest in existingInterests) {
      final categoryInterests =
          popularInterestsByCategory[interest.category] ?? [];
      for (final suggestion in categoryInterests) {
        if (!existingNames.contains(suggestion.toLowerCase()) &&
            !suggestions.contains(suggestion)) {
          suggestions.add(suggestion);
        }
      }
    }

    // Fill with popular interests if needed
    if (suggestions.length < limit) {
      for (final categoryInterests in popularInterestsByCategory.values) {
        for (final suggestion in categoryInterests) {
          if (!existingNames.contains(suggestion.toLowerCase()) &&
              !suggestions.contains(suggestion)) {
            suggestions.add(suggestion);
            if (suggestions.length >= limit) break;
          }
        }
        if (suggestions.length >= limit) break;
      }
    }

    return suggestions.take(limit).toList();
  }

  /// Check if interests exceed maximum limit (10)
  static bool exceedsMaximumLimit(List<InterestEntity> interests) {
    return interests.length > 10;
  }

  /// Check for duplicate interests
  static bool hasDuplicates(List<InterestEntity> interests) {
    final seen = <String>{};
    for (final interest in interests) {
      final normalized = interest.interest.toLowerCase();
      if (seen.contains(normalized)) {
        return true;
      }
      seen.add(normalized);
    }
    return false;
  }

  /// Get interest distribution by category
  static Map<InterestCategory, int> getCategoryDistribution(
    List<InterestEntity> interests,
  ) {
    final distribution = <InterestCategory, int>{};

    for (final interest in interests) {
      distribution[interest.category] =
          (distribution[interest.category] ?? 0) + 1;
    }

    return distribution;
  }

  /// Check if profile has diverse interests across categories
  static bool hasDiverseInterests(List<InterestEntity> interests) {
    final categories = interests.map((i) => i.category).toSet();
    return categories.length >= 3; // At least 3 different categories
  }
}
