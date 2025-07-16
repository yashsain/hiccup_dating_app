import 'package:equatable/equatable.dart';

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
/// - Equatable for easy comparison
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
class PromptEntity extends Equatable {
  // 🔑 Core Identity
  final String id;
  final String profileId;

  // 💭 Content
  final String question;
  final String response;

  // 🎯 Display
  final int displayOrder;

  // ⏰ Timestamps
  final DateTime createdAt;

  const PromptEntity({
    required this.id,
    required this.profileId,
    required this.question,
    required this.response,
    required this.displayOrder,
    required this.createdAt,
  });

  // 🔄 Copy with method for immutable updates
  PromptEntity copyWith({
    String? id,
    String? profileId,
    String? question,
    String? response,
    int? displayOrder,
    DateTime? createdAt,
  }) {
    return PromptEntity(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      question: question ?? this.question,
      response: response ?? this.response,
      displayOrder: displayOrder ?? this.displayOrder,
      createdAt: createdAt ?? this.createdAt,
    );
  }

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
    return response.trim().isNotEmpty &&
        response.length <= 150 &&
        response.length >= 5;
  }

  bool _validateDisplayOrder() {
    return displayOrder >= 1 && displayOrder <= 3;
  }

  // 📊 Computed Properties
  String get displayQuestion => question.trim();
  String get displayResponse => response.trim();

  bool get isLongResponse => response.length > 100;

  int get responseWordCount =>
      response.split(' ').where((word) => word.isNotEmpty).length;

  double get responseCompletion => response.length / 150.0;

  // 🎯 Display Helpers
  String get shortResponse {
    if (response.length <= 80) return response;
    return '${response.substring(0, 77)}...';
  }

  String get formattedForDisplay {
    return '${displayQuestion}\n\n${displayResponse}';
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

  // 📱 Character count helpers (for UI)
  int get remainingCharacters => 150 - response.length;

  bool get isNearCharacterLimit => remainingCharacters <= 10;

  String get characterCountDisplay => '${response.length}/150';

  // 🎨 Content analysis
  bool get containsEmoji {
    final emojiRegex = RegExp(
      r'[\u{1F600}-\u{1F64F}]|[\u{1F300}-\u{1F5FF}]|[\u{1F680}-\u{1F6FF}]|[\u{2600}-\u{26FF}]|[\u{2700}-\u{27BF}]',
      unicode: true,
    );
    return emojiRegex.hasMatch(response);
  }

  bool get isQuestionStyle => response.contains('?');

  bool get isListStyle =>
      response.contains('•') ||
      response.contains('-') ||
      response.contains('1.');

  // 📋 Equatable implementation
  @override
  List<Object?> get props => [
    id,
    profileId,
    question,
    response,
    displayOrder,
    createdAt,
  ];

  // 🔍 Debug representation
  @override
  String toString() {
    return 'PromptEntity('
        'id: $id, '
        'profileId: $profileId, '
        'question: "${question.length > 30 ? question.substring(0, 30) + '...' : question}", '
        'response: "${shortResponse}", '
        'order: $displayOrder, '
        'wordCount: $responseWordCount'
        ')';
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

  factory PromptEntity.sample1() {
    return PromptEntity(
      id: 'prompt_1',
      profileId: 'user_123',
      question: 'Two truths and a lie about me...',
      response:
          'I speak French fluently, I hate pizza (who does that?), and I went skydiving last summer in New Zealand.',
      displayOrder: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    );
  }

  factory PromptEntity.sample2() {
    return PromptEntity(
      id: 'prompt_2',
      profileId: 'user_123',
      question: 'My ideal weekend involves...',
      response:
          'A perfect Saturday morning hike, discovering a new coffee shop, and ending the day with a good movie or book.',
      displayOrder: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
    );
  }

  factory PromptEntity.sample3() {
    return PromptEntity(
      id: 'prompt_3',
      profileId: 'user_123',
      question: 'A quirky fact about me...',
      response:
          'I can recite every line from The Princess Bride and I collect vintage postcards from cities I\'ve never been to.',
      displayOrder: 3,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    );
  }
}

/// 🎯 Prompt Entity Extensions - Additional functionality
extension PromptEntityExtensions on PromptEntity {
  /// Check if prompt was recently created (within last 7 days)
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

  /// Generate hashtags from response content
  List<String> get suggestedHashtags {
    final hashtags = <String>[];
    final words = response.toLowerCase().split(' ');

    // Common dating app hashtags based on content
    final hashtagMap = {
      'travel': ['#wanderlust', '#travel', '#adventure'],
      'food': ['#foodie', '#coffee', '#cooking'],
      'music': ['#music', '#concert', '#playlist'],
      'fitness': ['#fitness', '#hiking', '#yoga'],
      'books': ['#bookworm', '#reading', '#literature'],
      'movies': ['#movies', '#cinema', '#netflix'],
      'art': ['#art', '#creative', '#design'],
      'dogs': ['#doglover', '#pets', '#puppy'],
      'cats': ['#catlover', '#pets', '#kitty'],
    };

    for (final word in words) {
      for (final entry in hashtagMap.entries) {
        if (word.contains(entry.key)) {
          hashtags.addAll(entry.value);
        }
      }
    }

    return hashtags.toSet().take(3).toList();
  }

  /// Check if response is engaging (has good length and content)
  bool get isEngagingResponse {
    return response.length >= 50 &&
        responseWordCount >= 8 &&
        (containsEmoji || isQuestionStyle || response.contains('!'));
  }

  /// Get content quality score (0.0 to 1.0)
  double get contentQualityScore {
    double score = 0.0;

    // Length score (0.3 weight)
    if (response.length >= 50)
      score += 0.3;
    else
      score += (response.length / 50) * 0.3;

    // Word count score (0.2 weight)
    if (responseWordCount >= 10)
      score += 0.2;
    else
      score += (responseWordCount / 10) * 0.2;

    // Engagement score (0.3 weight)
    if (containsEmoji) score += 0.1;
    if (isQuestionStyle) score += 0.1;
    if (response.contains('!')) score += 0.1;

    // Completeness score (0.2 weight)
    if (response.length >= 100)
      score += 0.2;
    else
      score += (response.length / 100) * 0.2;

    return score.clamp(0.0, 1.0);
  }
}

/// 🎯 Prompt Question Templates - Common prompt questions
class PromptQuestions {
  static const List<String> popular = [
    'Two truths and a lie about me...',
    'My ideal weekend involves...',
    'A quirky fact about me...',
    'I\'m looking for someone who...',
    'My love language is...',
    'The best way to win me over is...',
    'I\'m overly competitive about...',
    'My most controversial opinion is...',
    'I\'m secretly really good at...',
    'The key to my heart is...',
    'I\'m weirdly attracted to...',
    'My biggest pet peeve is...',
    'I could talk for hours about...',
    'My comfort food is...',
    'I\'m most proud of...',
    'My friends would describe me as...',
    'I\'m currently reading/watching...',
    'My favorite travel memory is...',
    'I\'m passionate about...',
    'My dream date would be...',
  ];

  static const List<String> casual = [
    'Ask me about...',
    'I recently discovered...',
    'My current obsession is...',
    'I\'m learning how to...',
    'My go-to karaoke song is...',
    'I\'m terrible at...',
    'My hidden talent is...',
    'I collect...',
    'My perfect Sunday is...',
    'I\'m currently binge-watching...',
  ];

  static const List<String> deep = [
    'I value most in a relationship...',
    'My biggest fear is...',
    'I\'m most grateful for...',
    'My life philosophy is...',
    'I\'m working on becoming...',
    'My biggest life change was...',
    'I believe in...',
    'My greatest achievement is...',
    'I\'m inspired by...',
    'My definition of success is...',
  ];

  static List<String> get all => [...popular, ...casual, ...deep];

  static String getRandomQuestion() {
    final random = DateTime.now().millisecondsSinceEpoch % all.length;
    return all[random];
  }
}
