import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt_entity.freezed.dart';

/// 💬 Prompt Entity - Clean Domain Model for Q&A Prompts (2025)
///
/// This entity represents a single prompt question-response pair.
/// Based on the design document, users can have up to 3 prompts.
///
/// Features:
/// - Immutable data structure
/// - Built-in validation (150 char limit)
/// - Type-safe properties
/// - Display ordering support
/// - Freezed for equality and copyWith
///
/// Usage:
/// ```dart
/// final prompt = PromptEntity(
///   id: 'prompt_123',
///   profileId: 'user_123',
///   question: 'Two truths and a lie about me...',
///   response: 'I speak French, I hate pizza, I've been skydiving',
///   displayOrder: 1,
/// );
/// ```
@freezed
sealed class PromptEntity with _$PromptEntity {
  const factory PromptEntity({
    required String id,
    required String profileId,
    required String question,
    required String response,
    required int displayOrder,
    required DateTime createdAt,
  }) = _PromptEntity;

  const PromptEntity._();

  // ✅ Validation Methods
  bool get isValid {
    return _validateQuestion() &&
        _validateResponse() &&
        _validateDisplayOrder();
  }

  bool _validateQuestion() {
    return question.trim().isNotEmpty && question.length <= 100;
  }

  bool _validateResponse() {
    return response.trim().isNotEmpty && response.length <= 150;
  }

  bool _validateDisplayOrder() {
    return displayOrder >= 1 && displayOrder <= 3;
  }

  // 📊 Computed Properties
  String get displayQuestion => question.trim();

  String get displayResponse => response.trim();

  int get responseLength => response.trim().length;

  bool get isLongResponse => responseLength > 100;

  // 🎯 Business Logic Helpers
  bool get canEdit => true; // Prompts can always be edited

  String get shortResponse {
    final cleanResponse = response.trim();
    return cleanResponse.length <= 50
        ? cleanResponse
        : '${cleanResponse.substring(0, 47)}...';
  }

  // 🔍 Search Helpers
  List<String> get searchKeywords {
    final keywords = <String>[];
    keywords.addAll(question.toLowerCase().split(' '));
    keywords.addAll(response.toLowerCase().split(' '));
    return keywords
        .where((keyword) => keyword.isNotEmpty && keyword.length > 2)
        .toList();
  }

  // 🧪 Factory constructors for testing
  factory PromptEntity.empty() {
    return PromptEntity(
      id: '',
      profileId: '',
      question: '',
      response: '',
      displayOrder: 1,
      createdAt: DateTime.now(),
    );
  }

  factory PromptEntity.sample({int order = 1}) {
    final samples = [
      {
        'question': 'Two truths and a lie about me...',
        'response': 'I speak French, I hate pizza, I\'ve been skydiving',
      },
      {
        'question': 'My ideal weekend involves...',
        'response': 'Hiking, brunch, and a good movie marathon',
      },
      {
        'question': 'A quirky fact about me...',
        'response': 'I can recite every line from The Princess Bride',
      },
    ];

    final sampleIndex = (order - 1) % samples.length;
    final sample = samples[sampleIndex];

    return PromptEntity(
      id: 'prompt_$order',
      profileId: 'sample_profile',
      question: sample['question']!,
      response: sample['response']!,
      displayOrder: order,
      createdAt: DateTime.now().subtract(Duration(days: order)),
    );
  }
}

/// 🎯 Prompt Entity Extensions - Additional functionality
extension PromptEntityExtensions on PromptEntity {
  /// Check if prompt is recently created (within last 7 days)
  bool get isRecentlyCreated {
    return DateTime.now().difference(createdAt).inDays <= 7;
  }

  /// Get prompt age in days
  int get promptAgeInDays {
    return DateTime.now().difference(createdAt).inDays;
  }

  /// Generate formatted prompt display
  String get formattedDisplay {
    return '$displayQuestion\n\n$displayResponse';
  }

  /// Check if response needs truncation for card display
  bool get needsTruncation => response.length > 100;

  /// Get character count status for editing
  String get characterCountStatus {
    final remaining = 150 - responseLength;
    return remaining >= 0
        ? '$remaining characters remaining'
        : 'Over limit by ${-remaining}';
  }
}
