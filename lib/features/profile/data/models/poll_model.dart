import '../../domain/entities/poll_entity.dart';

/// 📊 Poll Model - Entity ↔ Database Mapping (2025)
///
/// This model handles conversion between PollEntity and database maps.
/// Polls are interactive questions with multiple choice options that
/// users can create to engage with potential matches.
/// Based on design document: 1 active poll per profile.
///
/// Key Features:
/// - JSON array handling for poll options
/// - Active poll state management
/// - Option validation (2-4 options per poll)
/// - Type-safe conversions with validation
/// - Easy backend swap capability
///
/// Usage:
/// ```dart
/// // Entity → Database
/// final map = PollModel.toMap(pollEntity);
/// await database.insert('polls', map);
///
/// // Database → Entity
/// final poll = PollModel.fromMap(databaseMap);
/// ```
class PollModel {
  // 🚫 Private constructor - This is a utility class
  PollModel._();

  /// 📤 Convert PollEntity to Database Map
  ///
  /// Serializes poll data for SQLite storage including JSON encoding
  /// of poll options array.
  static Map<String, dynamic> toMap(PollEntity entity) {
    try {
      return {
        // 🔑 Primary identifiers
        'id': entity.id,
        'profile_id': entity.profileId,

        // 📊 Poll content
        'question': entity.question,
        'options': _encodeOptions(entity.options),

        // ⚡ State management
        'is_active': entity.isActive ? 1 : 0, // SQLite boolean
        // ⏰ Timestamps
        'created_at': entity.createdAt.toIso8601String(),
      };
    } catch (e) {
      throw PollModelException(
        'Failed to convert PollEntity to Map: ${e.toString()}',
        entity.id,
      );
    }
  }

  /// 📥 Convert Database Map to PollEntity
  ///
  /// Deserializes database data back into clean domain entity
  /// with proper JSON decoding and validation.
  static PollEntity fromMap(Map<String, dynamic> map) {
    try {
      // 🔍 Validate required fields
      _validateRequiredFields(map);

      return PollEntity(
        // 🔑 Primary identifiers
        id: map['id'] as String,
        profileId: map['profile_id'] as String,

        // 📊 Poll content
        question: map['question'] as String,
        options: _decodeOptions(map['options']),

        // ⚡ State management
        isActive: (map['is_active'] as int? ?? 0) == 1,

        // ⏰ Timestamps
        createdAt: DateTime.parse(map['created_at'] as String),
      );
    } catch (e) {
      throw PollModelException(
        'Failed to convert Map to PollEntity: ${e.toString()}',
        map['id']?.toString(),
      );
    }
  }

  /// 🔄 Convert multiple polls for bulk operations
  ///
  /// Efficiently converts a list of entities to database maps
  /// for batch operations.
  static List<Map<String, dynamic>> toMapList(List<PollEntity> entities) {
    return entities.map((entity) => toMap(entity)).toList();
  }

  /// 📥 Convert multiple database maps to entities
  ///
  /// Efficiently converts database results to entity list
  /// with proper error handling.
  static List<PollEntity> fromMapList(List<Map<String, dynamic>> maps) {
    final entities = <PollEntity>[];
    final errors = <String>[];

    for (final map in maps) {
      try {
        entities.add(fromMap(map));
      } catch (e) {
        errors.add('Map ${map['id']}: ${e.toString()}');
      }
    }

    // Log errors but don't fail the entire operation
    if (errors.isNotEmpty) {
      print('⚠️ PollModel: Some polls failed to convert: ${errors.join(', ')}');
    }

    return entities;
  }

  /// ⚡ Create activation map for poll state changes
  ///
  /// Creates update map to activate a poll (and deactivate others
  /// for the same profile, since only 1 can be active).
  static Map<String, dynamic> createActivationMap(String pollId) {
    return {'id': pollId, 'is_active': 1};
  }

  /// 💤 Create deactivation map for poll state changes
  ///
  /// Creates update map to deactivate a poll.
  static Map<String, dynamic> createDeactivationMap(String pollId) {
    return {'id': pollId, 'is_active': 0};
  }

  /// 🔄 Create update map for poll content changes
  ///
  /// Creates update map for editing poll question and options
  /// without affecting active state.
  static Map<String, dynamic> toUpdateMap(PollEntity entity) {
    return {
      'id': entity.id,
      'question': entity.question,
      'options': _encodeOptions(entity.options),
    };
  }

  // 🛠️ PRIVATE HELPER METHODS

  /// Encode options list to JSON string for database storage
  static String _encodeOptions(List<String> options) {
    if (options.isEmpty) return '[]';

    // Simple JSON array encoding for string options
    final escaped = options
        .map(
          (option) =>
              '"${option.replaceAll('"', '\\"').replaceAll('\n', '\\n')}"',
        )
        .join(',');

    return '[$escaped]';
  }

  /// Decode JSON string to options list from database
  static List<String> _decodeOptions(dynamic value) {
    if (value == null || value == '[]') return [];

    try {
      final String jsonString = value as String;

      // Simple JSON array parsing for string options
      if (!jsonString.startsWith('[') || !jsonString.endsWith(']')) {
        throw PollModelException('Invalid options format: not a JSON array');
      }

      final content = jsonString.substring(1, jsonString.length - 1).trim();
      if (content.isEmpty) return [];

      // Split by comma and clean up quotes
      return content
          .split('","')
          .map((s) => s.trim())
          .where((s) => s.isNotEmpty)
          .map((s) {
            // Remove leading/trailing quotes and unescape
            if (s.startsWith('"')) s = s.substring(1);
            if (s.endsWith('"')) s = s.substring(0, s.length - 1);
            return s.replaceAll('\\"', '"').replaceAll('\\n', '\n');
          })
          .toList();
    } catch (e) {
      throw PollModelException(
        'Failed to decode poll options: ${e.toString()}',
      );
    }
  }

  /// Validate that all required fields are present and valid
  static void _validateRequiredFields(Map<String, dynamic> map) {
    final requiredFields = [
      'id',
      'profile_id',
      'question',
      'options',
      'is_active',
      'created_at',
    ];
    final missingFields = <String>[];

    for (final field in requiredFields) {
      if (!map.containsKey(field) || map[field] == null) {
        missingFields.add(field);
      }
    }

    if (missingFields.isNotEmpty) {
      throw PollModelException(
        'Missing required fields: ${missingFields.join(', ')}',
        map['id']?.toString(),
      );
    }

    // Validate business rules
    _validateBusinessRules(map);
  }

  /// Validate business rules for poll data
  static void _validateBusinessRules(Map<String, dynamic> map) {
    // Validate question length
    final question = map['question'] as String;
    if (question.isEmpty || question.length > 100) {
      throw PollModelException(
        'Question must be 1-100 characters',
        map['id']?.toString(),
      );
    }

    // Validate options
    final options = _decodeOptions(map['options']);
    if (options.length < 2 || options.length > 4) {
      throw PollModelException(
        'Poll must have 2-4 options',
        map['id']?.toString(),
      );
    }

    // Validate each option length
    for (int i = 0; i < options.length; i++) {
      final option = options[i];
      if (option.isEmpty || option.length > 50) {
        throw PollModelException(
          'Option ${i + 1} must be 1-50 characters',
          map['id']?.toString(),
        );
      }
    }

    // Check for duplicate options
    final uniqueOptions = options.toSet();
    if (uniqueOptions.length != options.length) {
      throw PollModelException(
        'Poll options must be unique',
        map['id']?.toString(),
      );
    }
  }
}

/// 🚨 Poll Model Exception - Custom error handling
///
/// Provides detailed error information for poll data conversion issues.
class PollModelException implements Exception {
  final String message;
  final String? pollId;
  final DateTime timestamp;

  PollModelException(this.message, [this.pollId]) : timestamp = DateTime.now();

  @override
  String toString() {
    final id = pollId != null ? ' (Poll ID: $pollId)' : '';
    return 'PollModelException$id: $message [${timestamp.toIso8601String()}]';
  }
}

/// 🧪 Poll Model Utilities - Helper methods for testing and validation
///
/// Utilities for testing the poll data layer and ensuring data integrity.
class PollModelUtils {
  // 🚫 Private constructor - This is a utility class
  PollModelUtils._();

  /// Popular poll questions from dating apps (for testing/suggestions)
  static const List<Map<String, List<String>>> samplePolls = [
    {
      "What's your ideal first date?": [
        "Dinner at a nice restaurant",
        "Coffee and a walk",
        "Adventure activity",
        "Movie night at home",
      ],
    },
    {
      "Best weekend vibe?": [
        "Chill and relax",
        "Party and socialize",
        "Outdoor adventure",
        "Creative projects",
      ],
    },
    {
      "Your love language?": [
        "Words of affirmation",
        "Physical touch",
        "Quality time",
        "Acts of service",
      ],
    },
    {
      "Favorite season?": [
        "Spring blooms",
        "Summer heat",
        "Fall colors",
        "Winter coziness",
      ],
    },
    {
      "Dream vacation?": [
        "Beach relaxation",
        "City exploration",
        "Mountain hiking",
        "Cultural immersion",
      ],
    },
  ];

  /// Create sample poll map for testing
  static Map<String, dynamic> createSampleMap({
    String? id,
    String? profileId,
    bool isActive = true,
    int pollIndex = 0,
  }) {
    final pollData = samplePolls[pollIndex % samplePolls.length];
    final question = pollData.keys.first;
    final options = pollData[question]!;

    return {
      'id': id ?? 'test_poll_1',
      'profile_id': profileId ?? 'test_profile_1',
      'question': question,
      'options': PollModel._encodeOptions(options),
      'is_active': isActive ? 1 : 0,
      'created_at': DateTime.now()
          .subtract(const Duration(days: 1))
          .toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    };
  }

  /// Create random sample poll
  static Map<String, dynamic> createRandomSampleMap({
    String? id,
    String? profileId,
    bool isActive = true,
  }) {
    final randomIndex = DateTime.now().millisecond % samplePolls.length;
    return createSampleMap(
      id: id,
      profileId: profileId,
      isActive: isActive,
      pollIndex: randomIndex,
    );
  }

  /// Validate poll entity can be converted to map and back
  static bool validateRoundTrip(PollEntity entity) {
    try {
      final map = PollModel.toMap(entity);
      final restored = PollModel.fromMap(map);

      return entity.id == restored.id &&
          entity.profileId == restored.profileId &&
          entity.question == restored.question &&
          _listsEqual(entity.options, restored.options) &&
          entity.isActive == restored.isActive;
    } catch (e) {
      return false;
    }
  }

  /// Check if two string lists are equal
  static bool _listsEqual(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  /// Validate poll has correct structure and content
  static bool validatePollStructure(PollEntity poll) {
    try {
      // Check basic structure
      if (poll.question.isEmpty || poll.options.isEmpty) return false;
      if (poll.options.length < 2 || poll.options.length > 4) return false;

      // Check for unique options
      final uniqueOptions = poll.options.toSet();
      if (uniqueOptions.length != poll.options.length) return false;

      // Check option lengths
      for (final option in poll.options) {
        if (option.isEmpty || option.length > 50) return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get suggested poll questions based on interests
  static List<String> getSuggestedQuestions(List<String> interests) {
    // Simple interest-based suggestions (can be enhanced)
    final suggestions = <String>[];

    if (interests.contains('travel') || interests.contains('adventure')) {
      suggestions.add("Dream vacation destination?");
    }
    if (interests.contains('food') || interests.contains('cooking')) {
      suggestions.add("Favorite cuisine type?");
    }
    if (interests.contains('music')) {
      suggestions.add("Go-to music genre?");
    }
    if (interests.contains('fitness') || interests.contains('sports')) {
      suggestions.add("Favorite way to stay active?");
    }

    // Always include general questions
    suggestions.addAll([
      "What's your ideal first date?",
      "Best weekend vibe?",
      "Your love language?",
    ]);

    return suggestions.take(5).toList(); // Limit suggestions
  }
}
