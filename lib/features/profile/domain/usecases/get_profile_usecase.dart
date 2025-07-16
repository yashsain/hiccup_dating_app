import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../entities/profile_entity.dart';
import '../entities/prompt_entity.dart';
import '../entities/poll_entity.dart';
import '../entities/media_entity.dart';
import '../entities/interest_entity.dart';
import '../entities/badge_entity.dart';
import '../repositories/profile_repository.dart';

// This line is required for code generation
part 'get_profile_usecase.g.dart';

/// 🔍 Get Profile Use Case - Business Logic for Profile Retrieval (2025)
///
/// This use case handles all profile retrieval operations with business logic.
/// It orchestrates data from multiple sources and applies business rules.
///
/// Features:
/// - Comprehensive profile data retrieval
/// - Business rule validation
/// - Error handling and logging
/// - Performance optimization
/// - Caching support (future)
///
/// Usage:
/// ```dart
/// final useCase = ref.watch(getProfileUseCaseProvider);
/// final result = await useCase.execute('profile_123');
/// ```

/// 📊 Profile Data - Complete profile information
class ProfileData {
  final ProfileEntity profile;
  final List<PromptEntity> prompts;
  final PollEntity? activePoll;
  final List<MediaEntity> media;
  final List<InterestEntity> interests;
  final List<BadgeEntity> badges;

  const ProfileData({
    required this.profile,
    required this.prompts,
    this.activePoll,
    required this.media,
    required this.interests,
    required this.badges,
  });

  // 📊 Computed Properties
  bool get isComplete => profile.hasCompletedProfile;

  double get completenessScore => profile.profileCompleteness;

  bool get isVerified => profile.isVerified;

  bool get isPremium => profile.isPremium;

  int get totalContent =>
      prompts.length + media.length + interests.length + badges.length;

  bool get hasActiveContent =>
      prompts.isNotEmpty || media.isNotEmpty || activePoll != null;

  // 🎯 Display Helpers
  String get profileSummary => profile.profileSummary;

  List<MediaEntity> get photos =>
      media.where((m) => m.type == MediaType.photo).toList();

  List<MediaEntity> get videos =>
      media.where((m) => m.type == MediaType.video).toList();

  List<MediaEntity> get voiceNotes =>
      media.where((m) => m.type == MediaType.voiceNote).toList();

  List<BadgeEntity> get visibleBadges =>
      badges.where((b) => b.isVisible).toList();

  List<InterestEntity> get sortedInterests {
    final sorted = List<InterestEntity>.from(interests);
    sorted.sort((a, b) => b.popularity.compareTo(a.popularity));
    return sorted;
  }

  // 🔍 Content Analysis
  Map<String, int> get contentCounts => {
    'prompts': prompts.length,
    'photos': photos.length,
    'videos': videos.length,
    'voiceNotes': voiceNotes.length,
    'interests': interests.length,
    'badges': badges.length,
  };

  Map<InterestCategory, int> get interestsByCategory {
    final Map<InterestCategory, int> counts = {};
    for (final interest in interests) {
      counts[interest.category] = (counts[interest.category] ?? 0) + 1;
    }
    return counts;
  }

  Map<BadgeType, int> get badgesByType {
    final Map<BadgeType, int> counts = {};
    for (final badge in badges) {
      counts[badge.type] = (counts[badge.type] ?? 0) + 1;
    }
    return counts;
  }

  // 📱 UI Helpers
  String get mainPhotoUrl => photos.isNotEmpty ? photos.first.filePath : '';

  List<String> get photoUrls => photos.map((p) => p.filePath).toList();

  List<String> get interestNames => interests.map((i) => i.interest).toList();

  List<String> get badgeNames => badges.map((b) => b.badge).toList();

  @override
  String toString() {
    return 'ProfileData('
        'profile: ${profile.displayName}, '
        'prompts: ${prompts.length}, '
        'media: ${media.length}, '
        'interests: ${interests.length}, '
        'badges: ${badges.length}, '
        'completeness: ${(completenessScore * 100).toInt()}%'
        ')';
  }
}

/// 🔍 Get Profile Use Case Implementation
class GetProfileUseCase {
  final ProfileRepository _repository;

  GetProfileUseCase(this._repository);

  /// Execute the use case - Get complete profile data
  Future<ProfileData?> execute(String profileId) async {
    try {
      // 1. Get main profile
      final profile = await _repository.getProfile(profileId);
      if (profile == null) {
        return null;
      }

      // 2. Get all related data in parallel for performance
      final futures = await Future.wait([
        _repository.getPrompts(profileId),
        _repository.getActivePoll(profileId),
        _repository.getMedia(profileId),
        _repository.getInterests(profileId),
        _repository.getVisibleBadges(profileId),
      ]);

      final prompts = futures[0] as List<PromptEntity>;
      final activePoll = futures[1] as PollEntity?;
      final media = futures[2] as List<MediaEntity>;
      final interests = futures[3] as List<InterestEntity>;
      final badges = futures[4] as List<BadgeEntity>;

      // 3. Sort and organize data
      final sortedPrompts = _sortPrompts(prompts);
      final sortedMedia = _sortMedia(media);
      final sortedInterests = _sortInterests(interests);
      final sortedBadges = _sortBadges(badges);

      // 4. Apply business rules
      final filteredMedia = _filterValidMedia(sortedMedia);
      final activePolls = _filterActivePolls(activePoll);

      // 5. Create result
      return ProfileData(
        profile: profile,
        prompts: sortedPrompts,
        activePoll: activePolls,
        media: filteredMedia,
        interests: sortedInterests,
        badges: sortedBadges,
      );
    } catch (e) {
      // Log error (in real app, use proper logging)
      print('Error in GetProfileUseCase: $e');
      rethrow;
    }
  }

  /// Get basic profile info only (lightweight)
  Future<ProfileEntity?> getBasicProfile(String profileId) async {
    try {
      return await _repository.getProfile(profileId);
    } catch (e) {
      print('Error getting basic profile: $e');
      return null;
    }
  }

  /// Get profile with specific content types
  Future<ProfileData?> getProfileWithContent(
    String profileId, {
    bool includePrompts = true,
    bool includePoll = true,
    bool includeMedia = true,
    bool includeInterests = true,
    bool includeBadges = true,
  }) async {
    try {
      final profile = await _repository.getProfile(profileId);
      if (profile == null) return null;

      // Conditionally fetch data based on parameters
      final futures = <Future>[];

      if (includePrompts) {
        futures.add(_repository.getPrompts(profileId));
      } else {
        futures.add(Future.value(<PromptEntity>[]));
      }

      if (includePoll) {
        futures.add(_repository.getActivePoll(profileId));
      } else {
        futures.add(Future.value(null));
      }

      if (includeMedia) {
        futures.add(_repository.getMedia(profileId));
      } else {
        futures.add(Future.value(<MediaEntity>[]));
      }

      if (includeInterests) {
        futures.add(_repository.getInterests(profileId));
      } else {
        futures.add(Future.value(<InterestEntity>[]));
      }

      if (includeBadges) {
        futures.add(_repository.getVisibleBadges(profileId));
      } else {
        futures.add(Future.value(<BadgeEntity>[]));
      }

      final results = await Future.wait(futures);

      return ProfileData(
        profile: profile,
        prompts: results[0] as List<PromptEntity>,
        activePoll: results[1] as PollEntity?,
        media: results[2] as List<MediaEntity>,
        interests: results[3] as List<InterestEntity>,
        badges: results[4] as List<BadgeEntity>,
      );
    } catch (e) {
      print('Error in getProfileWithContent: $e');
      return null;
    }
  }

  /// Get multiple profiles (for discovery, etc.)
  Future<List<ProfileData>> getMultipleProfiles(List<String> profileIds) async {
    try {
      final profiles = <ProfileData>[];

      // Process in batches to avoid overwhelming the database
      const batchSize = 10;
      for (int i = 0; i < profileIds.length; i += batchSize) {
        final batch = profileIds.skip(i).take(batchSize).toList();

        final batchFutures = batch.map((id) => execute(id));
        final batchResults = await Future.wait(batchFutures);

        profiles.addAll(
          batchResults.where((p) => p != null).cast<ProfileData>(),
        );
      }

      return profiles;
    } catch (e) {
      print('Error in getMultipleProfiles: $e');
      return [];
    }
  }

  /// Check if profile exists
  Future<bool> profileExists(String profileId) async {
    try {
      return await _repository.profileExists(profileId);
    } catch (e) {
      print('Error checking profile existence: $e');
      return false;
    }
  }

  /// Get profile statistics
  Future<Map<String, dynamic>> getProfileStats(String profileId) async {
    try {
      final stats = await _repository.getProfileStatistics(profileId);

      // Add computed statistics
      final profileData = await execute(profileId);
      if (profileData != null) {
        stats['completeness'] = profileData.completenessScore;
        stats['isComplete'] = profileData.isComplete;
        stats['totalContent'] = profileData.totalContent;
        stats['contentCounts'] = profileData.contentCounts;
        stats['interestsByCategory'] = profileData.interestsByCategory;
        stats['badgesByType'] = profileData.badgesByType;
      }

      return stats;
    } catch (e) {
      print('Error getting profile stats: $e');
      return {};
    }
  }

  // 🎯 PRIVATE HELPER METHODS

  /// Sort prompts by display order
  List<PromptEntity> _sortPrompts(List<PromptEntity> prompts) {
    final sorted = List<PromptEntity>.from(prompts);
    sorted.sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
    return sorted;
  }

  /// Sort media by display order
  List<MediaEntity> _sortMedia(List<MediaEntity> media) {
    final sorted = List<MediaEntity>.from(media);
    sorted.sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
    return sorted;
  }

  /// Sort interests by popularity
  List<InterestEntity> _sortInterests(List<InterestEntity> interests) {
    final sorted = List<InterestEntity>.from(interests);
    sorted.sort((a, b) => b.popularity.compareTo(a.popularity));
    return sorted;
  }

  /// Sort badges by priority and rarity
  List<BadgeEntity> _sortBadges(List<BadgeEntity> badges) {
    return BadgeHelpers.sortBadges(badges);
  }

  /// Filter out invalid media
  List<MediaEntity> _filterValidMedia(List<MediaEntity> media) {
    return media.where((m) => m.isValid).toList();
  }

  /// Filter active polls only
  PollEntity? _filterActivePolls(PollEntity? poll) {
    if (poll == null) return null;
    return poll.isActive && poll.isValid ? poll : null;
  }
}

/// 🔍 Riverpod Provider for GetProfileUseCase
@riverpod
GetProfileUseCase getProfileUseCase(GetProfileUseCaseRef ref) {
  // Repository will be injected here once we create the data layer
  throw UnimplementedError('ProfileRepository provider not implemented yet');
}

/// 🔍 Riverpod Provider for Profile Data
@riverpod
Future<ProfileData?> profileData(ProfileDataRef ref, String profileId) async {
  final useCase = ref.watch(getProfileUseCaseProvider);
  return await useCase.execute(profileId);
}

/// 🔍 Riverpod Provider for Basic Profile
@riverpod
Future<ProfileEntity?> basicProfile(
  BasicProfileRef ref,
  String profileId,
) async {
  final useCase = ref.watch(getProfileUseCaseProvider);
  return await useCase.getBasicProfile(profileId);
}

/// 🔍 Riverpod Provider for Profile Statistics
@riverpod
Future<Map<String, dynamic>> profileStatistics(
  ProfileStatisticsRef ref,
  String profileId,
) async {
  final useCase = ref.watch(getProfileUseCaseProvider);
  return await useCase.getProfileStats(profileId);
}

/// 🔍 Riverpod Provider for Profile Existence Check
@riverpod
Future<bool> profileExists(ProfileExistsRef ref, String profileId) async {
  final useCase = ref.watch(getProfileUseCaseProvider);
  return await useCase.profileExists(profileId);
}

/// 🔍 Riverpod Provider for Multiple Profiles
@riverpod
Future<List<ProfileData>> multipleProfiles(
  MultipleProfilesRef ref,
  List<String> profileIds,
) async {
  final useCase = ref.watch(getProfileUseCaseProvider);
  return await useCase.getMultipleProfiles(profileIds);
}
