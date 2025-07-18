import '../../domain/entities/prompt_entity.dart';

/// 📝 Prompt Model - Entity ↔ Database Mapping (2025)
///
/// This model handles conversion between PromptEntity and database maps.
/// Prompts are Q&A pairs that users answer to showcase their personality.
/// Based on design document: max 3 prompts per profile.
///
/// Key Features:
/// - Type-safe conversions with validation
/// - Order management for prompt display sequence
/// - Character limit enforcement (500 chars for responses)
/// - Proper null handling and error recovery
/// - Easy backend swap capability
///
/// Usage:
/// ```dart
/// // Entity → Database
/// final map = PromptModel.toMap(promptEntity);
/// await database.insert('prompts', map);
///
/// // Database → Entity
/// final prompt = PromptModel.fromMap(databaseMap);
/// ```
class PromptModel {
  // 🚫 Private constructor - This is a utility class
  PromptModel._();

  /// 📤 Convert PromptEntity to Database Map
  ///
  /// Serializes prompt data for SQLite storage with proper validation
  /// and type conversion for all fields.
  static Map<String, dynamic> toMap(PromptEntity entity) {
    try {
      return {
        // 🔑 Primary identifiers
        'id': entity.id,
        'profile_id': entity.profileId,

        // 📝 Prompt content
        'question': entity.question,
        'response': entity.response,

        // 📊 Display order (for consistent prompt sequence)
        'display_order': entity.displayOrder,

        // ⏰ Timestamps
        'created_at': entity.createdAt.toIso8601String(),
      };
    } catch (e) {
      throw PromptModelException(
        'Failed to convert PromptEntity to Map: ${e.toString()}',
        entity.id,
      );
    }
  }

  /// 📥 Convert Database Map to PromptEntity
  ///
  /// Deserializes database data back into clean domain entity
  /// with comprehensive validation and error handling.
  static PromptEntity fromMap(Map<String, dynamic> map) {
    try {
      // 🔍 Validate required fields
      _validateRequiredFields(map);

      return PromptEntity(
        // 🔑 Primary identifiers
        id: map['id'] as String,
        profileId: map['profile_id'] as String,

        // 📝 Prompt content
        question: map['question'] as String,
        response: map['response'] as String,

        // 📊 Display order
        displayOrder: map['display_order'] as int,

        // ⏰ Timestamps
        createdAt: DateTime.parse(map['created_at'] as String),
      );
    } catch (e) {
      throw PromptModelException(
        'Failed to convert Map to PromptEntity: ${e.toString()}',
        map['id']?.toString(),
      );
    }
  }

  /// 🔄 Convert multiple prompts for bulk operations
  ///
  /// Efficiently converts a list of entities to database maps
  /// for batch insert/update operations.
  static List<Map<String, dynamic>> toMapList(List<PromptEntity> entities) {
    return entities.map((entity) => toMap(entity)).toList();
  }

  /// 📥 Convert multiple database maps to entities
  ///
  /// Efficiently converts database results to entity list
  /// with proper error handling for each item.
  static List<PromptEntity> fromMapList(List<Map<String, dynamic>> maps) {
    final entities = <PromptEntity>[];
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
      print(
        '⚠️ PromptModel: Some prompts failed to convert: ${errors.join(', ')}',
      );
    }

    return entities;
  }

  /// 🔄 Create update map for profile prompt reordering
  ///
  /// Creates update maps for changing prompt display order
  /// without affecting other fields.
  static List<Map<String, dynamic>> createReorderMaps(
    List<PromptEntity> prompts,
  ) {
    return prompts.asMap().entries.map((entry) {
      final index = entry.key;
      final prompt = entry.value;

      return {
        'id': prompt.id,
        'display_order': index + 1, // 1-based ordering
      };
    }).toList();
  }

  /// 🎯 Create map for new prompt with auto-order
  ///
  /// Creates a new prompt map with automatically assigned order
  /// based on existing prompts for the profile.
  static Map<String, dynamic> toMapWithAutoOrder(
    PromptEntity entity,
    int existingPromptCount,
  ) {
    final map = toMap(entity);
    map['order_index'] = existingPromptCount + 1;
    return map;
  }

  // 🛠️ PRIVATE HELPER METHODS

  /// Validate that all required fields are present and valid
  static void _validateRequiredFields(Map<String, dynamic> map) {
    final requiredFields = [
      'id',
      'profile_id',
      'question',
      'response',
      'display_order',
      'created_at',
    ];
    final missingFields = <String>[];

    for (final field in requiredFields) {
      if (!map.containsKey(field) || map[field] == null) {
        missingFields.add(field);
      }
    }

    if (missingFields.isNotEmpty) {
      throw PromptModelException(
        'Missing required fields: ${missingFields.join(', ')}',
        map['id']?.toString(),
      );
    }

    // Validate business rules
    _validateBusinessRules(map);
  }

  /// Validate business rules for prompt data
  static void _validateBusinessRules(Map<String, dynamic> map) {
    // Validate question length (reasonable limits)
    final question = map['question'] as String;
    if (question.isEmpty || question.length > 200) {
      throw PromptModelException(
        'Question must be 1-200 characters',
        map['id']?.toString(),
      );
    }

    // Validate response length (design document: reasonable limit)
    final response = map['response'] as String;
    if (response.isEmpty || response.length > 500) {
      throw PromptModelException(
        'Response must be 1-500 characters',
        map['id']?.toString(),
      );
    }

    // Validate order (must be positive)
    final order = map['display_order'] as int;
    if (order < 1 || order > 3) {
      // Max 3 prompts per profile
      throw PromptModelException(
        'Display order must be 1-3 (max 3 prompts per profile)',
        map['id']?.toString(),
      );
    }
  }
}

/// 🚨 Prompt Model Exception - Custom error handling
///
/// Provides detailed error information for prompt data conversion issues.
class PromptModelException implements Exception {
  final String message;
  final String? promptId;
  final DateTime timestamp;

  PromptModelException(this.message, [this.promptId])
    : timestamp = DateTime.now();

  @override
  String toString() {
    final id = promptId != null ? ' (Prompt ID: $promptId)' : '';
    return 'PromptModelException$id: $message [${timestamp.toIso8601String()}]';
  }
}

/// 🧪 Prompt Model Utilities - Helper methods for testing and validation
///
/// Utilities for testing the prompt data layer and ensuring data integrity.
class PromptModelUtils {
  // 🚫 Private constructor - This is a utility class
  PromptModelUtils._();

  /// Popular prompt questions from dating apps (for testing/suggestions)
  static const List<String> sampleQuestions = [
    "Two truths and a lie",
    "My ideal weekend is...",
    "I'm overly competitive about...",
    "The way to my heart is...",
    "I want someone who...",
    "My most controversial opinion is...",
    "You should not go out with me if...",
    "A life goal of mine is...",
    "I'm weirdly attracted to...",
    "My greatest strength is...",
  ];

  /// Create sample prompt map for testing
  static Map<String, dynamic> createSampleMap({
    String? id,
    String? profileId,
    int displayOrder = 1,
  }) {
    return {
      'id': id ?? 'test_prompt_1',
      'profile_id': profileId ?? 'test_profile_1',
      'question': sampleQuestions[displayOrder - 1],
      'response':
          'This is a sample response that showcases personality and interests.',
      'display_order': displayOrder,
      'created_at': DateTime.now()
          .subtract(Duration(days: displayOrder))
          .toIso8601String(),
    };
  }

  /// Create a set of 3 sample prompts for a profile
  static List<Map<String, dynamic>> createSamplePromptSet(String profileId) {
    return List.generate(
      3,
      (index) => createSampleMap(
        id: 'prompt_${profileId}_${index + 1}',
        profileId: profileId,
        displayOrder: index + 1,
      ),
    );
  }

  /// Validate prompt entity can be converted to map and back
  static bool validateRoundTrip(PromptEntity entity) {
    try {
      final map = PromptModel.toMap(entity);
      final restored = PromptModel.fromMap(map);

      return entity.id == restored.id &&
          entity.profileId == restored.profileId &&
          entity.question == restored.question &&
          entity.response == restored.response &&
          entity.displayOrder == restored.displayOrder;
    } catch (e) {
      return false;
    }
  }

  /// Check if prompts are in correct display order
  static bool validatePromptOrder(List<PromptEntity> prompts) {
    if (prompts.isEmpty) return true;

    // Sort by order and check sequence
    final sorted = [...prompts]
      ..sort((a, b) => a.displayOrder.compareTo(b.displayOrder));

    for (int i = 0; i < sorted.length; i++) {
      if (sorted[i].displayOrder != i + 1) {
        return false; // Order should be 1, 2, 3...
      }
    }

    return true;
  }

  /// Get next available order for new prompt
  static int getNextOrder(List<PromptEntity> existingPrompts) {
    if (existingPrompts.isEmpty) return 1;

    final maxOrder = existingPrompts
        .map((p) => p.displayOrder)
        .reduce((max, current) => current > max ? current : max);

    return maxOrder + 1;
  }
}
