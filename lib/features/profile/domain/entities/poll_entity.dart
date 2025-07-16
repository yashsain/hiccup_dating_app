import 'package:equatable/equatable.dart';

/// 📊 Poll Entity - Clean Domain Model for Interactive Polls (2025)
///
/// This entity represents a user-created poll for interactive engagement.
/// Based on the design document, each profile can have one active poll.
///
/// Features:
/// - Immutable data structure
/// - Built-in validation (2-4 options, 100 char question limit)
/// - Type-safe properties
/// - Vote tracking support
/// - Equatable for easy comparison
///
/// Usage:
/// ```dart
/// final poll = PollEntity(
///   id: 'poll_123',
///   profileId: 'user_123',
///   question: 'What\'s your ideal first date?',
///   options: ['Dinner', 'Coffee', 'Hike', 'Movie'],
///   isActive: true,
/// );
/// ```
class PollEntity extends Equatable {
  // 🔑 Core Identity
  final String id;
  final String profileId;

  // 💭 Content
  final String question;
  final List<String> options;

  // 🎯 Status
  final bool isActive;

  // 📊 Vote tracking (will be managed separately in data layer)
  final Map<String, int> votes; // option -> vote count
  final int totalVotes;

  // ⏰ Timestamps
  final DateTime createdAt;

  const PollEntity({
    required this.id,
    required this.profileId,
    required this.question,
    required this.options,
    this.isActive = true,
    this.votes = const {},
    this.totalVotes = 0,
    required this.createdAt,
  });

  // 🔄 Copy with method for immutable updates
  PollEntity copyWith({
    String? id,
    String? profileId,
    String? question,
    List<String>? options,
    bool? isActive,
    Map<String, int>? votes,
    int? totalVotes,
    DateTime? createdAt,
  }) {
    return PollEntity(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      question: question ?? this.question,
      options: options ?? this.options,
      isActive: isActive ?? this.isActive,
      votes: votes ?? this.votes,
      totalVotes: totalVotes ?? this.totalVotes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // ✅ Validation Methods
  bool get isValid {
    return _validateQuestion() && _validateOptions() && _validateVotes();
  }

  bool _validateQuestion() {
    return question.trim().isNotEmpty && question.length <= 100;
  }

  bool _validateOptions() {
    return options.isNotEmpty &&
        options.length >= 2 &&
        options.length <= 4 &&
        options.every(
          (option) => option.trim().isNotEmpty && option.length <= 50,
        ) &&
        options.toSet().length == options.length; // No duplicates
  }

  bool _validateVotes() {
    // All vote options should exist in options list
    return votes.keys.every((option) => options.contains(option));
  }

  // 📊 Computed Properties
  String get displayQuestion => question.trim();

  List<String> get displayOptions =>
      options.map((option) => option.trim()).toList();

  bool get hasVotes => totalVotes > 0;

  String? get mostPopularOption {
    if (votes.isEmpty) return null;

    String? mostPopular;
    int maxVotes = 0;

    for (final entry in votes.entries) {
      if (entry.value > maxVotes) {
        maxVotes = entry.value;
        mostPopular = entry.key;
      }
    }

    return mostPopular;
  }

  // 🎯 Vote Analysis
  double getOptionPercentage(String option) {
    if (totalVotes == 0) return 0.0;
    return (votes[option] ?? 0) / totalVotes;
  }

  int getOptionVotes(String option) {
    return votes[option] ?? 0;
  }

  List<MapEntry<String, int>> get sortedResults {
    final results = <MapEntry<String, int>>[];

    for (final option in options) {
      results.add(MapEntry(option, getOptionVotes(option)));
    }

    results.sort((a, b) => b.value.compareTo(a.value));
    return results;
  }

  // 📱 Display Helpers
  String get shortQuestion {
    if (question.length <= 50) return question;
    return '${question.substring(0, 47)}...';
  }

  String get formattedResults {
    if (totalVotes == 0) return 'No votes yet';

    final buffer = StringBuffer();
    buffer.writeln('Results ($totalVotes votes):');

    for (final result in sortedResults) {
      final percentage = (getOptionPercentage(result.key) * 100).toInt();
      buffer.writeln('${result.key}: ${result.value} votes ($percentage%)');
    }

    return buffer.toString().trim();
  }

  // 🔍 Search Helpers
  List<String> get searchKeywords {
    final keywords = <String>[];

    keywords.addAll(question.toLowerCase().split(' '));
    keywords.addAll(options.map((option) => option.toLowerCase()));

    return keywords
        .where((keyword) => keyword.isNotEmpty && keyword.length > 2)
        .toList();
  }

  // 🎨 Engagement Metrics
  double get engagementScore {
    if (totalVotes == 0) return 0.0;

    // Higher score for more votes and more balanced distribution
    double balanceScore = 0.0;
    if (votes.isNotEmpty) {
      final percentages = votes.values.map((v) => v / totalVotes).toList();
      final averagePercentage = 1.0 / options.length;

      double variance = 0.0;
      for (final percentage in percentages) {
        variance +=
            (percentage - averagePercentage) * (percentage - averagePercentage);
      }

      balanceScore = 1.0 - (variance / options.length);
    }

    // Combine vote count and balance (more votes = better, more balanced = better)
    final voteScore = (totalVotes / 100.0).clamp(0.0, 1.0);
    return (voteScore * 0.7 + balanceScore * 0.3).clamp(0.0, 1.0);
  }

  bool get isEngaging => engagementScore > 0.3;

  // 📋 Equatable implementation
  @override
  List<Object?> get props => [
    id,
    profileId,
    question,
    options,
    isActive,
    votes,
    totalVotes,
    createdAt,
  ];

  // 🔍 Debug representation
  @override
  String toString() {
    return 'PollEntity('
        'id: $id, '
        'profileId: $profileId, '
        'question: "$shortQuestion", '
        'options: ${options.length}, '
        'votes: $totalVotes, '
        'active: $isActive'
        ')';
  }

  // 🧪 Factory constructors for testing
  factory PollEntity.empty() {
    return PollEntity(
      id: '',
      profileId: '',
      question: '',
      options: [],
      createdAt: DateTime.now(),
    );
  }

  factory PollEntity.sample1() {
    return PollEntity(
      id: 'poll_1',
      profileId: 'user_123',
      question: 'What\'s your ideal first date?',
      options: [
        'Dinner at a cozy restaurant',
        'Coffee and a walk',
        'Hiking adventure',
        'Movie night',
      ],
      isActive: true,
      votes: {
        'Coffee and a walk': 15,
        'Dinner at a cozy restaurant': 12,
        'Hiking adventure': 8,
        'Movie night': 5,
      },
      totalVotes: 40,
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    );
  }

  factory PollEntity.sample2() {
    return PollEntity(
      id: 'poll_2',
      profileId: 'user_456',
      question: 'Best weekend vibe?',
      options: ['Chill at home', 'Party with friends', 'Outdoor adventure'],
      isActive: true,
      votes: {
        'Chill at home': 22,
        'Outdoor adventure': 18,
        'Party with friends': 10,
      },
      totalVotes: 50,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    );
  }

  factory PollEntity.sample3() {
    return PollEntity(
      id: 'poll_3',
      profileId: 'user_789',
      question: 'Favorite dessert?',
      options: ['Chocolate cake', 'Ice cream', 'Fruit tart', 'Cookies'],
      isActive: true,
      votes: {
        'Ice cream': 28,
        'Chocolate cake': 25,
        'Cookies': 15,
        'Fruit tart': 12,
      },
      totalVotes: 80,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    );
  }
}

/// 🎯 Poll Entity Extensions - Additional functionality
extension PollEntityExtensions on PollEntity {
  /// Check if poll was recently created (within last 7 days)
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

  /// Add a vote to the poll (returns new poll with updated votes)
  PollEntity addVote(String option) {
    if (!options.contains(option)) {
      throw ArgumentError('Option "$option" not found in poll options');
    }

    final newVotes = Map<String, int>.from(votes);
    newVotes[option] = (newVotes[option] ?? 0) + 1;

    return copyWith(votes: newVotes, totalVotes: totalVotes + 1);
  }

  /// Remove a vote from the poll (returns new poll with updated votes)
  PollEntity removeVote(String option) {
    if (!options.contains(option)) {
      throw ArgumentError('Option "$option" not found in poll options');
    }

    final currentVotes = votes[option] ?? 0;
    if (currentVotes == 0) {
      return this; // No votes to remove
    }

    final newVotes = Map<String, int>.from(votes);
    newVotes[option] = currentVotes - 1;

    // Remove option from votes map if it reaches 0
    if (newVotes[option] == 0) {
      newVotes.remove(option);
    }

    return copyWith(votes: newVotes, totalVotes: totalVotes - 1);
  }

  /// Get winner (most voted option) with tie handling
  String? get winner {
    if (votes.isEmpty) return null;

    final sortedResults = this.sortedResults;
    if (sortedResults.isEmpty) return null;

    // Check for tie
    if (sortedResults.length > 1 &&
        sortedResults[0].value == sortedResults[1].value) {
      return null; // It's a tie
    }

    return sortedResults.first.key;
  }

  /// Check if there's a tie for first place
  bool get hasTie {
    if (votes.isEmpty || totalVotes == 0) return false;

    final maxVotes = votes.values.reduce((a, b) => a > b ? a : b);
    final winnersCount = votes.values
        .where((votes) => votes == maxVotes)
        .length;

    return winnersCount > 1;
  }

  /// Get all options tied for first place
  List<String> get tiedWinners {
    if (!hasTie) return [];

    final maxVotes = votes.values.reduce((a, b) => a > b ? a : b);
    return votes.entries
        .where((entry) => entry.value == maxVotes)
        .map((entry) => entry.key)
        .toList();
  }

  /// Generate poll summary for sharing
  String get pollSummary {
    final buffer = StringBuffer();
    buffer.writeln('Poll: $question');

    if (totalVotes == 0) {
      buffer.writeln('No votes yet! Be the first to vote.');
    } else {
      buffer.writeln('Results ($totalVotes votes):');

      for (final result in sortedResults) {
        final percentage = (getOptionPercentage(result.key) * 100).toInt();
        buffer.writeln('${result.key}: $percentage%');
      }
    }

    return buffer.toString().trim();
  }
}

/// 🎯 Poll Question Templates - Common poll questions
class PollQuestions {
  static const List<String> dating = [
    'What\'s your ideal first date?',
    'Best way to spend a weekend?',
    'Your love language?',
    'Deal breaker in a relationship?',
    'Perfect vacation type?',
    'Favorite date night activity?',
    'How do you show affection?',
    'Biggest turn-on?',
    'Relationship goal?',
    'Communication style?',
  ];

  static const List<String> lifestyle = [
    'Favorite type of music?',
    'Best time of day?',
    'Ideal living situation?',
    'Favorite season?',
    'Preferred social setting?',
    'Biggest motivation?',
    'Favorite way to relax?',
    'Exercise preference?',
    'Ideal work environment?',
    'Favorite cuisine?',
  ];

  static const List<String> fun = [
    'Favorite dessert?',
    'Superpower you\'d choose?',
    'Zombie apocalypse weapon?',
    'Favorite movie genre?',
    'Best pizza topping?',
    'Childhood cartoon?',
    'Favorite ice cream flavor?',
    'Spirit animal?',
    'Favorite emoji?',
    'Best midnight snack?',
  ];

  static const List<String> personality = [
    'Biggest fear?',
    'Proudest achievement?',
    'Life motto?',
    'Biggest pet peeve?',
    'Hidden talent?',
    'Weirdest habit?',
    'Favorite memory?',
    'Biggest dream?',
    'Core value?',
    'Personality trait?',
  ];

  static List<String> get all => [
    ...dating,
    ...lifestyle,
    ...fun,
    ...personality,
  ];

  static String getRandomQuestion() {
    final random = DateTime.now().millisecondsSinceEpoch % all.length;
    return all[random];
  }

  static List<String> getRandomOptions(int count) {
    // This would be more sophisticated in a real app
    const sampleOptions = [
      'Option A',
      'Option B',
      'Option C',
      'Option D',
      'Choice 1',
      'Choice 2',
      'Choice 3',
      'Choice 4',
      'Yes',
      'No',
      'Maybe',
      'Depends',
    ];

    return sampleOptions.take(count).toList();
  }
}
