import '../entities/badge_entity.dart';
import '../entities/interest_entity.dart';
import '../entities/media_entity.dart';
import '../entities/poll_entity.dart';
import '../entities/profile_entity.dart';
import '../entities/prompt_entity.dart';

/// 🔄 Profile Repository Interface - Clean Architecture Contract (2025)
///
/// This interface defines the contract for profile data operations.
/// It follows Clean Architecture principles where the domain layer
/// defines contracts that the data layer implements.
///
/// Key Features:
/// - Platform-agnostic operations
/// - Async/await support
/// - Comprehensive error handling
/// - Type-safe return values
/// - Follows repository pattern
///
/// Usage:
/// ```dart
/// // Data layer implements this interface
/// class ProfileRepositoryImpl implements ProfileRepository {
///   @override
///   Future<ProfileEntity?> getProfile(String id) async {
///     // Implementation details
///   }
/// }
/// ```
abstract class ProfileRepository {
  // 👤 PROFILE OPERATIONS

  /// Get a profile by ID
  /// Returns null if profile doesn't exist
  Future<ProfileEntity?> getProfile(String id);

  /// Get all profiles (for discovery/admin features)
  /// Returns empty list if no profiles exist
  Future<List<ProfileEntity>> getAllProfiles();

  /// Create a new profile
  /// Throws exception if profile already exists or validation fails
  Future<ProfileEntity> createProfile(ProfileEntity profile);

  /// Update an existing profile
  /// Throws exception if profile doesn't exist or validation fails
  Future<ProfileEntity> updateProfile(ProfileEntity profile);

  /// Delete prompts for a profile
  Future<bool> deletePrompts(String profileId, List<String> promptIds);

  /// Delete interests for a profile
  Future<bool> deleteInterests(String profileId, List<String> interestIds);

  /// Delete badges for a profile
  Future<bool> deleteBadges(String profileId, List<String> badgeIds);

  // 📝 PROMPT OPERATIONS

  /// Create prompts for a profile
  Future<List<PromptEntity>> createPrompts(
    String profileId,
    List<PromptEntity> prompts,
  );

  /// Update prompts for a profile
  Future<List<PromptEntity>> updatePrompts(
    String profileId,
    List<PromptEntity> prompts,
  );

  // 📊 POLL OPERATIONS

  /// Get poll for a profile
  Future<PollEntity?> getPoll(String profileId);

  /// Create poll for a profile
  Future<PollEntity> createPoll(String profileId, PollEntity poll);

  /// Update poll for a profile
  Future<PollEntity> updatePoll(String profileId, PollEntity poll);

  /// Delete poll for a profile
  Future<bool> deletePoll(String profileId, String pollId);

  // 🎥 MEDIA OPERATIONS

  /// Get media for a profile
  Future<List<MediaEntity>> getMedia(String profileId);

  /// Create media for a profile
  Future<List<MediaEntity>> createMedia(
    String profileId,
    List<MediaEntity> media,
  );

  /// Update media for a profile
  Future<List<MediaEntity>> updateMedia(
    String profileId,
    List<MediaEntity> media,
  );

  /// Delete media for a profile
  Future<bool> deleteMedia(String profileId, List<String> mediaIds);

  // 🎯 INTEREST OPERATIONS

  /// Get interests for a profile
  Future<List<InterestEntity>> getInterests(String profileId);

  /// Create interests for a profile
  Future<List<InterestEntity>> createInterests(
    String profileId,
    List<InterestEntity> interests,
  );

  /// Update interests for a profile
  Future<List<InterestEntity>> updateInterests(
    String profileId,
    List<InterestEntity> interests,
  );

  // 🏆 BADGE OPERATIONS

  /// Get badges for a profile
  Future<List<BadgeEntity>> getBadges(String profileId);

  /// Create badges for a profile
  Future<List<BadgeEntity>> createBadges(
    String profileId,
    List<BadgeEntity> badges,
  );

  /// Update badges for a profile
  Future<List<BadgeEntity>> updateBadges(
    String profileId,
    List<BadgeEntity> badges,
  );

  /// Delete a profile and all associated data
  /// Returns true if successful, false if profile doesn't exist
  Future<bool> deleteProfile(String id);

  /// Check if a profile exists
  Future<bool> profileExists(String id);

  // 💬 PROMPT OPERATIONS

  /// Get all prompts for a profile
  Future<List<PromptEntity>> getPrompts(String profileId);

  /// Get a specific prompt by ID
  Future<PromptEntity?> getPrompt(String id);

  /// Create a new prompt
  /// Throws exception if maximum prompts reached (3) or validation fails
  Future<PromptEntity> createPrompt(PromptEntity prompt);

  /// Update an existing prompt
  /// Throws exception if prompt doesn't exist or validation fails
  Future<PromptEntity> updatePrompt(PromptEntity prompt);

  /// Delete a prompt
  /// Returns true if successful, false if prompt doesn't exist
  Future<bool> deletePrompt(String id);

  /// Reorder prompts (update display order)
  Future<void> reorderPrompts(String profileId, List<String> promptIds);

  // 📊 POLL OPERATIONS

  /// Get all polls for a profile (active and inactive)
  Future<List<PollEntity>> getPolls(String profileId);

  /// Vote on a poll (increment vote count)
  Future<PollEntity> voteOnPoll(String pollId, String option);

  /// Remove vote from a poll (decrement vote count)
  Future<PollEntity> removeVoteFromPoll(String pollId, String option);

  /// Deactivate a poll
  Future<PollEntity> deactivatePoll(String pollId);

  // 📸 MEDIA OPERATIONS

  /// Get media by type for a profile
  Future<List<MediaEntity>> getMediaByType(String profileId, MediaType type);

  /// Get a specific media item by ID
  Future<MediaEntity?> getMediaItem(String id);

  /// Reorder media items (update display order)
  Future<void> reorderMedia(String profileId, List<String> mediaIds);

  /// Get media count by type for a profile
  Future<Map<MediaType, int>> getMediaCounts(String profileId);

  // 🎯 INTEREST OPERATIONS

  /// Get interests by category for a profile
  Future<List<InterestEntity>> getInterestsByCategory(
    String profileId,
    InterestCategory category,
  );

  /// Get a specific interest by ID
  Future<InterestEntity?> getInterest(String id);

  /// Create a new interest
  /// Throws exception if maximum interests reached (10) or validation fails
  Future<InterestEntity> createInterest(InterestEntity interest);

  /// Update an existing interest
  /// Throws exception if interest doesn't exist or validation fails
  Future<InterestEntity> updateInterest(InterestEntity interest);

  /// Delete an interest
  /// Returns true if successful, false if interest doesn't exist
  Future<bool> deleteInterest(String id);

  /// Get popular interests across all profiles
  Future<List<String>> getPopularInterests();

  /// Get suggested interests for a profile
  Future<List<String>> getSuggestedInterests(String profileId);

  // 🏆 BADGE OPERATIONS

  /// Get badges by type for a profile
  Future<List<BadgeEntity>> getBadgesByType(String profileId, BadgeType type);

  /// Get a specific badge by ID
  Future<BadgeEntity?> getBadge(String id);

  /// Create a new badge
  /// Throws exception if maximum badges reached (5) or validation fails
  Future<BadgeEntity> createBadge(BadgeEntity badge);

  /// Update an existing badge
  /// Throws exception if badge doesn't exist or validation fails
  Future<BadgeEntity> updateBadge(BadgeEntity badge);

  /// Delete a badge
  /// Returns true if successful, false if badge doesn't exist
  Future<bool> deleteBadge(String id);

  /// Award a badge to a profile
  Future<BadgeEntity> awardBadge(
    String profileId,
    String badgeName,
    BadgeType type,
  );

  /// Toggle badge visibility
  Future<BadgeEntity> toggleBadgeVisibility(String badgeId);

  /// Get available badges for a profile
  Future<List<String>> getAvailableBadges(String profileId);

  // 🔍 SEARCH & DISCOVERY OPERATIONS

  /// Search profiles by criteria
  Future<List<ProfileEntity>> searchProfiles({
    String? query,
    int? minAge,
    int? maxAge,
    String? location,
    String? gender,
    List<String>? interests,
    int limit = 50,
    int offset = 0,
  });

  /// Get profiles for discovery (matching algorithm)
  Future<List<ProfileEntity>> getDiscoveryProfiles(
    String currentProfileId, {
    int limit = 10,
    int offset = 0,
  });

  /// Get profiles with similar interests
  Future<List<ProfileEntity>> getSimilarProfiles(
    String profileId, {
    int limit = 10,
  });

  /// Get trending profiles
  Future<List<ProfileEntity>> getTrendingProfiles({int limit = 10});

  // 📊 ANALYTICS & STATISTICS

  /// Get comprehensive profile analytics
  Future<Map<String, dynamic>> getProfileAnalytics(String profileId);

  /// Get app-wide statistics
  Future<Map<String, dynamic>> getAppStatistics();

  /// Get user engagement metrics
  Future<Map<String, dynamic>> getUserEngagementMetrics(String profileId);

  /// Get content performance metrics
  Future<Map<String, dynamic>> getContentPerformanceMetrics(String profileId);

  // 🧹 MAINTENANCE OPERATIONS

  /// Clean up expired data (badges, polls, etc.)
  Future<void> cleanupExpiredData();

  /// Validate profile data integrity
  Future<List<String>> validateProfileIntegrity(String profileId);

  /// Backup profile data
  Future<Map<String, dynamic>> backupProfileData(String profileId);

  /// Restore profile data
  Future<void> restoreProfileData(String profileId, Map<String, dynamic> data);

  /// Get database health status
  Future<bool> getDatabaseHealth();

  /// Optimize database performance
  Future<void> optimizeDatabase();

  // 🔄 BULK OPERATIONS

  /// Create multiple profiles (for testing/seeding)
  Future<List<ProfileEntity>> createMultipleProfiles(
    List<ProfileEntity> profiles,
  );

  /// Update multiple profiles
  Future<List<ProfileEntity>> updateMultipleProfiles(
    List<ProfileEntity> profiles,
  );

  /// Delete multiple profiles
  Future<void> deleteMultipleProfiles(List<String> profileIds);

  /// Get multiple profiles by IDs
  Future<List<ProfileEntity>> getMultipleProfiles(List<String> profileIds);

  // 🎯 ADVANCED OPERATIONS

  /// Get profile recommendations based on algorithm
  Future<List<ProfileEntity>> getRecommendations(
    String profileId, {
    int limit = 10,
  });

  /// Update profile last active timestamp
  Future<void> updateLastActive(String profileId);

  /// Get profile activity timeline
  Future<List<Map<String, dynamic>>> getProfileActivity(
    String profileId, {
    int limit = 50,
  });

  /// Get profile completeness score
  Future<double> getProfileCompleteness(String profileId);

  /// Get profile verification status
  Future<Map<String, bool>> getVerificationStatus(String profileId);

  /// Update profile verification status
  Future<void> updateVerificationStatus(
    String profileId,
    bool photoVerified,
    bool identityVerified,
  );
}

/// 🔄 Profile Repository Exception - Custom exceptions for repository operations
class ProfileRepositoryException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const ProfileRepositoryException(
    this.message, {
    this.code,
    this.originalError,
  });

  @override
  String toString() {
    return 'ProfileRepositoryException: $message${code != null ? ' (Code: $code)' : ''}';
  }
}

/// 🎯 Repository Exception Types - Common exception types
class ProfileNotFoundException extends ProfileRepositoryException {
  const ProfileNotFoundException(String profileId)
    : super('Profile not found: $profileId', code: 'PROFILE_NOT_FOUND');
}

class ProfileAlreadyExistsException extends ProfileRepositoryException {
  const ProfileAlreadyExistsException(String profileId)
    : super('Profile already exists: $profileId', code: 'PROFILE_EXISTS');
}

class MaximumLimitExceededException extends ProfileRepositoryException {
  const MaximumLimitExceededException(String type, int limit)
    : super('Maximum $type limit exceeded: $limit', code: 'MAX_LIMIT_EXCEEDED');
}

class ValidationException extends ProfileRepositoryException {
  const ValidationException(String field, String reason)
    : super('Validation failed for $field: $reason', code: 'VALIDATION_ERROR');
}

class DatabaseException extends ProfileRepositoryException {
  const DatabaseException(String operation, dynamic error)
    : super(
        'Database error during $operation',
        code: 'DATABASE_ERROR',
        originalError: error,
      );
}

/// 🎯 Repository Result - Wrapper for repository operations with error handling
class RepositoryResult<T> {
  final T? data;
  final ProfileRepositoryException? error;
  final bool isSuccess;

  const RepositoryResult._({this.data, this.error, required this.isSuccess});

  /// Create a successful result
  factory RepositoryResult.success(T data) {
    return RepositoryResult._(data: data, isSuccess: true);
  }

  /// Create a failed result
  factory RepositoryResult.failure(ProfileRepositoryException error) {
    return RepositoryResult._(error: error, isSuccess: false);
  }

  /// Check if result is successful
  bool get isFailure => !isSuccess;

  /// Get data or throw exception
  T get dataOrThrow {
    if (isSuccess) {
      return data!;
    } else {
      throw error!;
    }
  }

  /// Get data or return default value
  T? get dataOrNull => isSuccess ? data : null;

  /// Transform successful result
  RepositoryResult<R> map<R>(R Function(T) transform) {
    if (isSuccess) {
      try {
        return RepositoryResult.success(transform(data!));
      } catch (e) {
        return RepositoryResult.failure(
          ProfileRepositoryException('Transformation failed: $e'),
        );
      }
    } else {
      return RepositoryResult.failure(error!);
    }
  }

  /// Handle result with callbacks
  R when<R>({
    required R Function(T) onSuccess,
    required R Function(ProfileRepositoryException) onFailure,
  }) {
    if (isSuccess) {
      return onSuccess(data!);
    } else {
      return onFailure(error!);
    }
  }
}

/// 🎯 Repository Extensions - Helper extensions for common operations
extension ProfileRepositoryExtensions on ProfileRepository {
  /// Get profile or throw exception
  Future<ProfileEntity> getProfileOrThrow(String id) async {
    final profile = await getProfile(id);
    if (profile == null) {
      throw ProfileNotFoundException(id);
    }
    return profile;
  }

  /// Get active poll or create empty one
  Future<PollEntity> getActivePollOrEmpty(String profileId) async {
    final poll = await getActivePoll(profileId);
    return poll ?? PollEntity.empty().copyWith(profileId: profileId);
  }

  /// Check if profile can add more content
  Future<bool> canAddMorePrompts(String profileId) async {
    final prompts = await getPrompts(profileId);
    return prompts.length < 3;
  }

  Future<bool> canAddMoreMedia(String profileId, MediaType type) async {
    final media = await getMediaByType(profileId, type);
    return media.length < type.maxCount;
  }

  Future<bool> canAddMoreInterests(String profileId) async {
    final interests = await getInterests(profileId);
    return interests.length < 10;
  }

  Future<bool> canAddMoreBadges(String profileId) async {
    final badges = await getBadges(profileId);
    return badges.length < 5;
  }

  /// Get full profile with all related data
  Future<Map<String, dynamic>> getFullProfile(String profileId) async {
    final profile = await getProfile(profileId);
    if (profile == null) {
      throw ProfileNotFoundException(profileId);
    }

    final prompts = await getPrompts(profileId);
    final activePoll = await getActivePoll(profileId);
    final media = await getMedia(profileId);
    final interests = await getInterests(profileId);
    final badges = await getVisibleBadges(profileId);

    return {
      'profile': profile,
      'prompts': prompts,
      'activePoll': activePoll,
      'media': media,
      'interests': interests,
      'badges': badges,
    };
  }

  /// Check if profile is complete
  Future<bool> isProfileComplete(String profileId) async {
    final profile = await getProfile(profileId);
    if (profile == null) return false;

    final prompts = await getPrompts(profileId);
    final media = await getMedia(profileId);

    return profile.name.isNotEmpty &&
        profile.age >= 18 &&
        profile.location.isNotEmpty &&
        profile.gender.isNotEmpty &&
        (profile.bio?.isNotEmpty ?? false) &&
        prompts.isNotEmpty &&
        media.isNotEmpty;
  }
}
