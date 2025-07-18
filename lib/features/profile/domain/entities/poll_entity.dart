import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_entity.freezed.dart';

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
/// - Freezed for equality and copyWith
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
@freezed
sealed class PollEntity with _$PollEntity {
  const factory PollEntity({
    required String id,
    required String profileId,
    required String question,
    required List<String> options,
    @Default(true) bool isActive,
    @Default({}) Map<String, int> votes,
    @Default(0) int totalVotes,
    required DateTime createdAt,
  }) = _PollEntity;

  const PollEntity._();

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

  int get mostPopularVotes {
    if (votes.isEmpty) return 0;
    return votes.values.reduce((a, b) => a > b ? a : b);
  }

  // 🎯 Business Logic Helpers
  bool canVote(String option) {
    return isActive && options.contains(option);
  }

  int getVotesForOption(String option) {
    return votes[option] ?? 0;
  }

  double getPercentageForOption(String option) {
    if (totalVotes == 0) return 0.0;
    return (getVotesForOption(option) / totalVotes) * 100;
  }

  List<MapEntry<String, int>> get sortedVoteEntries {
    final entries = votes.entries.toList();
    entries.sort((a, b) => b.value.compareTo(a.value));
    return entries;
  }

  // 📊 Vote Analysis
  bool get isCloseRace {
    if (votes.length < 2) return false;

    final sortedVotes = votes.values.toList()..sort((a, b) => b.compareTo(a));
    if (sortedVotes.length < 2) return false;

    final first = sortedVotes[0];
    final second = sortedVotes[1];

    return (first - second) <= (totalVotes * 0.1); // Within 10%
  }

  bool get hasWinner {
    if (!hasVotes) return false;
    return mostPopularVotes > (totalVotes * 0.5); // More than 50%
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

  factory PollEntity.sample() {
    return PollEntity(
      id: 'poll_sample',
      profileId: 'sample_profile',
      question: 'What\'s your ideal first date?',
      options: ['Dinner', 'Coffee', 'Hike', 'Movie'],
      isActive: true,
      votes: {'Dinner': 15, 'Coffee': 23, 'Hike': 12, 'Movie': 8},
      totalVotes: 58,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    );
  }

  factory PollEntity.sampleWeekend() {
    return PollEntity(
      id: 'poll_weekend',
      profileId: 'sample_profile',
      question: 'Best weekend vibe?',
      options: ['Chill', 'Party', 'Adventure'],
      isActive: true,
      votes: {'Chill': 45, 'Party': 32, 'Adventure': 38},
      totalVotes: 115,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    );
  }
}

/// 🎯 Poll Entity Extensions - Additional functionality
extension PollEntityExtensions on PollEntity {
  /// Check if poll is recently created (within last 7 days)
  bool get isRecentlyCreated {
    return DateTime.now().difference(createdAt).inDays <= 7;
  }

  /// Get poll age in days
  int get pollAgeInDays {
    return DateTime.now().difference(createdAt).inDays;
  }

  /// Generate poll summary for display
  String get pollSummary {
    if (!hasVotes) {
      return '$displayQuestion (No votes yet)';
    }

    return '$displayQuestion ($totalVotes vote${totalVotes != 1 ? 's' : ''})';
  }

  /// Get formatted vote results
  List<String> get formattedResults {
    return displayOptions.map((option) {
      final votes = getVotesForOption(option);
      final percentage = getPercentageForOption(option);
      return '$option: $votes vote${votes != 1 ? 's' : ''} (${percentage.toStringAsFixed(1)}%)';
    }).toList();
  }

  /// Check if poll needs more engagement
  bool get needsMoreVotes => totalVotes < 10;

  /// Get engagement level
  String get engagementLevel {
    if (totalVotes < 5) return 'Low';
    if (totalVotes < 20) return 'Medium';
    if (totalVotes < 50) return 'High';
    return 'Very High';
  }
}
