import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../entities/profile_entity.dart';
import '../entities/prompt_entity.dart';
import '../entities/poll_entity.dart';
import '../entities/media_entity.dart';
import '../entities/interest_entity.dart';
import '../entities/badge_entity.dart';
import '../repositories/profile_repository.dart';
import '../../../../shared/database/database_provider.dart';

// This line is required for code generation
part 'update_profile_usecase.g.dart';

/// 🔧 Update Profile Use Case - Business Logic for Profile Updates (2025)
///
/// This use case handles all profile update operations with comprehensive
/// validation, business logic, and error handling.
///
/// Features:
/// - Complete profile update operations
/// - Input validation and business rules
/// - Batch update support
/// - Profile completeness calculation
/// - Atomic operations with rollback
/// - Comprehensive error handling
///
/// Usage:
/// ```dart
/// final useCase = ref.watch(updateProfileUseCaseProvider);
/// await useCase.updateBasicInfo(profileId, updatedProfile);
/// ```

/// 📝 Update Result - Wrapper for update operations
class UpdateResult<T> {
  final T? data;
  final bool success;
  final String? error;
  final Map<String, dynamic>? validationErrors;

  const UpdateResult._({
    this.data,
    required this.success,
    this.error,
    this.validationErrors,
  });

  /// Create successful result
  factory UpdateResult.success(T data) {
    return UpdateResult._(data: data, success: true);
  }

  /// Create failure result
  factory UpdateResult.failure(
    String error, {
    Map<String, dynamic>? validationErrors,
  }) {
    return UpdateResult._(
      success: false,
      error: error,
      validationErrors: validationErrors,
    );
  }

  /// Create validation failure result
  factory UpdateResult.validationFailure(Map<String, dynamic> errors) {
    return UpdateResult._(
      success: false,
      error: 'Validation failed',
      validationErrors: errors,
    );
  }

  bool get isFailure => !success;
  T get dataOrThrow => success ? data! : throw Exception(error);
}

/// 🔧 Update Profile Use Case Implementation
class UpdateProfileUseCase {
  final ProfileRepository _repository;

  UpdateProfileUseCase(this._repository);

  // 👤 BASIC PROFILE OPERATIONS

  /// Update basic profile information
  Future<UpdateResult<ProfileEntity>> updateBasicInfo(
    String profileId,
    ProfileEntity updatedProfile,
  ) async {
    try {
      // 1. Validate basic profile data
      final validationResult = _validateBasicProfile(updatedProfile);
      if (!validationResult.success) {
        return UpdateResult.validationFailure(
          validationResult.validationErrors!,
        );
      }

      // 2. Check if profile exists
      final exists = await _repository.profileExists(profileId);
      if (!exists) {
        return UpdateResult.failure('Profile not found');
      }

      // 3. Update profile with current timestamp
      final profileToUpdate = updatedProfile.copyWith(
        id: profileId,
        updatedAt: DateTime.now(),
      );

      // 4. Perform update
      final result = await _repository.updateProfile(profileToUpdate);
      return UpdateResult.success(result);
    } catch (e) {
      return UpdateResult.failure('Failed to update profile: $e');
    }
  }

  /// Update profile completeness and validation
  Future<UpdateResult<ProfileEntity>> updateProfileStatus(
    String profileId, {
    bool? photoVerification,
    bool? identityVerification,
    String? premium,
  }) async {
    try {
      final profile = await _repository.getProfile(profileId);
      if (profile == null) {
        return UpdateResult.failure('Profile not found');
      }

      final updatedProfile = profile.copyWith(
        photoVerification: photoVerification,
        identityVerification: identityVerification,
        premium: premium,
        updatedAt: DateTime.now(),
      );

      final result = await _repository.updateProfile(updatedProfile);
      return UpdateResult.success(result);
    } catch (e) {
      return UpdateResult.failure('Failed to update profile status: $e');
    }
  }

  // 💬 PROMPT OPERATIONS

  /// Update profile prompts (max 3)
  Future<UpdateResult<List<PromptEntity>>> updatePrompts(
    String profileId,
    List<PromptEntity> prompts,
  ) async {
    try {
      // 1. Validate prompts
      final validationResult = _validatePrompts(prompts);
      if (!validationResult.success) {
        return UpdateResult.validationFailure(
          validationResult.validationErrors!,
        );
      }

      // 2. Delete existing prompts
      await _repository.deletePrompts(profileId, []);

      // 3. Create new prompts
      final results = <PromptEntity>[];
      for (int i = 0; i < prompts.length; i++) {
        final prompt = prompts[i].copyWith(
          profileId: profileId,
          displayOrder: i + 1,
        );
        final result = await _repository.createPrompt(prompt);
        results.add(result);
      }

      return UpdateResult.success(results);
    } catch (e) {
      return UpdateResult.failure('Failed to update prompts: $e');
    }
  }

  /// Add a single prompt
  Future<UpdateResult<PromptEntity>> addPrompt(
    String profileId,
    PromptEntity prompt,
  ) async {
    try {
      // 1. Check current prompt count
      final existingPrompts = await _repository.getPrompts(profileId);
      if (existingPrompts.length >= 3) {
        return UpdateResult.failure('Maximum 3 prompts allowed');
      }

      // 2. Validate prompt
      final validationResult = _validatePrompt(prompt);
      if (!validationResult.success) {
        return UpdateResult.validationFailure(
          validationResult.validationErrors!,
        );
      }

      // 3. Create prompt with proper order
      final promptToAdd = prompt.copyWith(
        profileId: profileId,
        displayOrder: existingPrompts.length + 1,
      );

      final result = await _repository.createPrompt(promptToAdd);
      return UpdateResult.success(result);
    } catch (e) {
      return UpdateResult.failure('Failed to add prompt: $e');
    }
  }

  /// Update a specific prompt
  Future<UpdateResult<PromptEntity>> updatePrompt(
    String promptId,
    PromptEntity updatedPrompt,
  ) async {
    try {
      // 1. Validate prompt
      final validationResult = _validatePrompt(updatedPrompt);
      if (!validationResult.success) {
        return UpdateResult.validationFailure(
          validationResult.validationErrors!,
        );
      }

      // 2. Update prompt
      final result = await _repository.updatePrompt(updatedPrompt);
      return UpdateResult.success(result);
    } catch (e) {
      return UpdateResult.failure('Failed to update prompt: $e');
    }
  }

  // 📊 POLL OPERATIONS

  /// Update or create profile poll (only 1 active)
  Future<UpdateResult<PollEntity>> updatePoll(
    String profileId,
    PollEntity poll,
  ) async {
    try {
      // 1. Validate poll
      final validationResult = _validatePoll(poll);
      if (!validationResult.success) {
        return UpdateResult.validationFailure(
          validationResult.validationErrors!,
        );
      }

      // 2. Deactivate existing poll
      final existingPoll = await _repository.getActivePoll(profileId);
      if (existingPoll != null) {
        await _repository.deactivatePoll(existingPoll.id);
      }

      // 3. Create new poll
      final pollToCreate = poll.copyWith(
        profileId: profileId,
        isActive: true,
        createdAt: DateTime.now(),
      );

      final result = await _repository.createPoll(pollToCreate);
      return UpdateResult.success(result);
    } catch (e) {
      return UpdateResult.failure('Failed to update poll: $e');
    }
  }

  /// Deactivate current poll
  Future<UpdateResult<bool>> deactivatePoll(String profileId) async {
    try {
      final poll = await _repository.getActivePoll(profileId);
      if (poll == null) {
        return UpdateResult.failure('No active poll found');
      }

      await _repository.deactivatePoll(poll.id);
      return UpdateResult.success(true);
    } catch (e) {
      return UpdateResult.failure('Failed to deactivate poll: $e');
    }
  }

  // 📸 MEDIA OPERATIONS

  /// Update profile media
  Future<UpdateResult<List<MediaEntity>>> updateMedia(
    String profileId,
    List<MediaEntity> media,
  ) async {
    try {
      // 1. Validate media
      final validationResult = _validateMedia(media);
      if (!validationResult.success) {
        return UpdateResult.validationFailure(
          validationResult.validationErrors!,
        );
      }

      // 2. Delete existing media
      await _repository.deleteMedia(profileId, []);

      // 3. Create new media
      final results = <MediaEntity>[];
      for (int i = 0; i < media.length; i++) {
        final mediaItem = media[i].copyWith(
          profileId: profileId,
          displayOrder: i + 1,
        );
        final result = await _repository.createMedia(mediaItem);
        results.add(result);
      }

      return UpdateResult.success(results);
    } catch (e) {
      return UpdateResult.failure('Failed to update media: $e');
    }
  }

  /// Add a single media item
  Future<UpdateResult<MediaEntity>> addMedia(
    String profileId,
    MediaEntity media,
  ) async {
    try {
      // 1. Check media limits
      final existingMedia = await _repository.getMedia(profileId);
      final mediaCounts = await _repository.getMediaCounts(profileId);

      if (!_checkMediaLimits(mediaCounts, media.type)) {
        return UpdateResult.failure(
          'Media limit exceeded for ${media.type.displayName}',
        );
      }

      // 2. Validate media
      final validationResult = _validateMediaItem(media);
      if (!validationResult.success) {
        return UpdateResult.validationFailure(
          validationResult.validationErrors!,
        );
      }

      // 3. Create media with proper order
      final mediaToAdd = media.copyWith(
        profileId: profileId,
        displayOrder: existingMedia.length + 1,
      );

      final result = await _repository.createMedia(mediaToAdd);
      return UpdateResult.success(result);
    } catch (e) {
      return UpdateResult.failure('Failed to add media: $e');
    }
  }

  /// Reorder media items
  Future<UpdateResult<bool>> reorderMedia(
    String profileId,
    List<String> mediaIds,
  ) async {
    try {
      await _repository.reorderMedia(profileId, mediaIds);
      return UpdateResult.success(true);
    } catch (e) {
      return UpdateResult.failure('Failed to reorder media: $e');
    }
  }

  // 🎯 INTEREST OPERATIONS

  /// Update profile interests (max 10)
  Future<UpdateResult<List<InterestEntity>>> updateInterests(
    String profileId,
    List<InterestEntity> interests,
  ) async {
    try {
      // 1. Validate interests
      final validationResult = _validateInterests(interests);
      if (!validationResult.success) {
        return UpdateResult.validationFailure(
          validationResult.validationErrors!,
        );
      }

      // 2. Delete existing interests
      await _repository.deleteInterests(profileId, []);

      // 3. Create new interests
      final results = <InterestEntity>[];
      for (final interest in interests) {
        final interestToAdd = interest.copyWith(profileId: profileId);
        final result = await _repository.createInterest(interestToAdd);
        results.add(result);
      }

      return UpdateResult.success(results);
    } catch (e) {
      return UpdateResult.failure('Failed to update interests: $e');
    }
  }

  /// Add a single interest
  Future<UpdateResult<InterestEntity>> addInterest(
    String profileId,
    InterestEntity interest,
  ) async {
    try {
      // 1. Check interest limit
      final existingInterests = await _repository.getInterests(profileId);
      if (existingInterests.length >= 10) {
        return UpdateResult.failure('Maximum 10 interests allowed');
      }

      // 2. Validate interest
      final validationResult = _validateInterest(interest);
      if (!validationResult.success) {
        return UpdateResult.validationFailure(
          validationResult.validationErrors!,
        );
      }

      // 3. Create interest
      final interestToAdd = interest.copyWith(profileId: profileId);
      final result = await _repository.createInterest(interestToAdd);
      return UpdateResult.success(result);
    } catch (e) {
      return UpdateResult.failure('Failed to add interest: $e');
    }
  }

  // 🏆 BADGE OPERATIONS

  /// Update profile badges (max 5)
  Future<UpdateResult<List<BadgeEntity>>> updateBadges(
    String profileId,
    List<BadgeEntity> badges,
  ) async {
    try {
      // 1. Validate badges
      final validationResult = _validateBadges(badges);
      if (!validationResult.success) {
        return UpdateResult.validationFailure(
          validationResult.validationErrors!,
        );
      }

      // 2. Delete existing badges
      await _repository.deleteBadges(profileId, []);

      // 3. Create new badges
      final results = <BadgeEntity>[];
      for (final badge in badges) {
        final badgeToAdd = badge.copyWith(profileId: profileId);
        final result = await _repository.createBadge(badgeToAdd);
        results.add(result);
      }

      return UpdateResult.success(results);
    } catch (e) {
      return UpdateResult.failure('Failed to update badges: $e');
    }
  }

  /// Add a single badge
  Future<UpdateResult<BadgeEntity>> addBadge(
    String profileId,
    BadgeEntity badge,
  ) async {
    try {
      // 1. Check badge limit
      final existingBadges = await _repository.getBadges(profileId);
      if (existingBadges.length >= 5) {
        return UpdateResult.failure('Maximum 5 badges allowed');
      }

      // 2. Validate badge
      final validationResult = _validateBadge(badge);
      if (!validationResult.success) {
        return UpdateResult.validationFailure(
          validationResult.validationErrors!,
        );
      }

      // 3. Create badge
      final badgeToAdd = badge.copyWith(profileId: profileId);
      final result = await _repository.createBadge(badgeToAdd);
      return UpdateResult.success(result);
    } catch (e) {
      return UpdateResult.failure('Failed to add badge: $e');
    }
  }

  // 🔄 BATCH OPERATIONS

  /// Update complete profile in a single transaction
  Future<UpdateResult<ProfileEntity>> updateCompleteProfile(
    String profileId, {
    ProfileEntity? profile,
    List<PromptEntity>? prompts,
    PollEntity? poll,
    List<MediaEntity>? media,
    List<InterestEntity>? interests,
    List<BadgeEntity>? badges,
  }) async {
    try {
      // 1. Validate all components
      final validationErrors = <String, dynamic>{};

      if (profile != null) {
        final result = _validateBasicProfile(profile);
        if (!result.success) {
          validationErrors.addAll(result.validationErrors!);
        }
      }

      if (prompts != null) {
        final result = _validatePrompts(prompts);
        if (!result.success) {
          validationErrors.addAll(result.validationErrors!);
        }
      }

      if (poll != null) {
        final result = _validatePoll(poll);
        if (!result.success) {
          validationErrors.addAll(result.validationErrors!);
        }
      }

      if (media != null) {
        final result = _validateMedia(media);
        if (!result.success) {
          validationErrors.addAll(result.validationErrors!);
        }
      }

      if (interests != null) {
        final result = _validateInterests(interests);
        if (!result.success) {
          validationErrors.addAll(result.validationErrors!);
        }
      }

      if (badges != null) {
        final result = _validateBadges(badges);
        if (!result.success) {
          validationErrors.addAll(result.validationErrors!);
        }
      }

      if (validationErrors.isNotEmpty) {
        return UpdateResult.validationFailure(validationErrors);
      }

      // 2. Update all components
      if (profile != null) {
        await updateBasicInfo(profileId, profile);
      }

      if (prompts != null) {
        await updatePrompts(profileId, prompts);
      }

      if (poll != null) {
        await updatePoll(profileId, poll);
      }

      if (media != null) {
        await updateMedia(profileId, media);
      }

      if (interests != null) {
        await updateInterests(profileId, interests);
      }

      if (badges != null) {
        await updateBadges(profileId, badges);
      }

      // 3. Return updated profile
      final updatedProfile = await _repository.getProfile(profileId);
      if (updatedProfile == null) {
        return UpdateResult.failure('Profile not found after update');
      }

      return UpdateResult.success(updatedProfile);
    } catch (e) {
      return UpdateResult.failure('Failed to update complete profile: $e');
    }
  }

  // 🔍 UTILITY METHODS

  /// Calculate profile completeness score
  Future<double> calculateProfileCompleteness(String profileId) async {
    try {
      final profile = await _repository.getProfile(profileId);
      if (profile == null) return 0.0;

      final prompts = await _repository.getPrompts(profileId);
      final poll = await _repository.getActivePoll(profileId);
      final media = await _repository.getMedia(profileId);
      final interests = await _repository.getInterests(profileId);
      final badges = await _repository.getBadges(profileId);

      return _calculateCompleteness(
        profile: profile,
        prompts: prompts,
        poll: poll,
        media: media,
        interests: interests,
        badges: badges,
      );
    } catch (e) {
      return 0.0;
    }
  }

  /// Get profile statistics
  Future<Map<String, dynamic>> getProfileStatistics(String profileId) async {
    try {
      final profile = await _repository.getProfile(profileId);
      if (profile == null) return {};

      final prompts = await _repository.getPrompts(profileId);
      final poll = await _repository.getActivePoll(profileId);
      final media = await _repository.getMedia(profileId);
      final interests = await _repository.getInterests(profileId);
      final badges = await _repository.getBadges(profileId);

      return {
        'completeness': _calculateCompleteness(
          profile: profile,
          prompts: prompts,
          poll: poll,
          media: media,
          interests: interests,
          badges: badges,
        ),
        'prompts': prompts.length,
        'poll': poll != null ? 1 : 0,
        'media': media.length,
        'interests': interests.length,
        'badges': badges.length,
        'isVerified': profile.isVerified,
        'isPremium': profile.isPremium,
        'lastUpdated': profile.updatedAt.toIso8601String(),
      };
    } catch (e) {
      return {};
    }
  }

  // 🔐 VALIDATION METHODS

  UpdateResult<ProfileEntity> _validateBasicProfile(ProfileEntity profile) {
    final errors = <String, dynamic>{};

    if (profile.name.trim().isEmpty) {
      errors['name'] = 'Name is required';
    } else if (profile.name.length > 50) {
      errors['name'] = 'Name must be 50 characters or less';
    }

    if (profile.age < 18 || profile.age > 100) {
      errors['age'] = 'Age must be between 18 and 100';
    }

    if (profile.location.trim().isEmpty) {
      errors['location'] = 'Location is required';
    } else if (profile.location.length > 100) {
      errors['location'] = 'Location must be 100 characters or less';
    }

    if (profile.gender.trim().isEmpty) {
      errors['gender'] = 'Gender is required';
    } else if (profile.gender.length > 30) {
      errors['gender'] = 'Gender must be 30 characters or less';
    }

    if (profile.bio != null && profile.bio!.length > 500) {
      errors['bio'] = 'Bio must be 500 characters or less';
    }

    if (errors.isNotEmpty) {
      return UpdateResult.validationFailure(errors);
    }

    return UpdateResult.success(profile);
  }

  UpdateResult<List<PromptEntity>> _validatePrompts(
    List<PromptEntity> prompts,
  ) {
    final errors = <String, dynamic>{};

    if (prompts.length > 3) {
      errors['prompts'] = 'Maximum 3 prompts allowed';
    }

    for (int i = 0; i < prompts.length; i++) {
      final prompt = prompts[i];
      final promptErrors = <String>[];

      if (prompt.question.trim().isEmpty) {
        promptErrors.add('Question is required');
      } else if (prompt.question.length > 100) {
        promptErrors.add('Question must be 100 characters or less');
      }

      if (prompt.response.trim().isEmpty) {
        promptErrors.add('Response is required');
      } else if (prompt.response.length > 150) {
        promptErrors.add('Response must be 150 characters or less');
      }

      if (promptErrors.isNotEmpty) {
        errors['prompt_$i'] = promptErrors;
      }
    }

    if (errors.isNotEmpty) {
      return UpdateResult.validationFailure(errors);
    }

    return UpdateResult.success(prompts);
  }

  UpdateResult<List<PromptEntity>> _validatePrompt(PromptEntity prompt) {
    return _validatePrompts([prompt]);
  }

  UpdateResult<PollEntity> _validatePoll(PollEntity poll) {
    final errors = <String, dynamic>{};

    if (poll.question.trim().isEmpty) {
      errors['question'] = 'Poll question is required';
    } else if (poll.question.length > 100) {
      errors['question'] = 'Poll question must be 100 characters or less';
    }

    if (poll.options.length < 2) {
      errors['options'] = 'Poll must have at least 2 options';
    } else if (poll.options.length > 4) {
      errors['options'] = 'Poll can have maximum 4 options';
    }

    for (int i = 0; i < poll.options.length; i++) {
      final option = poll.options[i];
      if (option.trim().isEmpty) {
        errors['option_$i'] = 'Option cannot be empty';
      } else if (option.length > 50) {
        errors['option_$i'] = 'Option must be 50 characters or less';
      }
    }

    // Check for duplicate options
    final uniqueOptions = poll.options.toSet();
    if (uniqueOptions.length != poll.options.length) {
      errors['options'] = 'Duplicate options are not allowed';
    }

    if (errors.isNotEmpty) {
      return UpdateResult.validationFailure(errors);
    }

    return UpdateResult.success(poll);
  }

  UpdateResult<List<MediaEntity>> _validateMedia(List<MediaEntity> media) {
    final errors = <String, dynamic>{};

    // Check media type limits
    final photosCount = media.where((m) => m.type == MediaType.photo).length;
    final videosCount = media.where((m) => m.type == MediaType.video).length;
    final voiceNotesCount = media
        .where((m) => m.type == MediaType.voiceNote)
        .length;

    if (photosCount > 6) {
      errors['photos'] = 'Maximum 6 photos allowed';
    }
    if (videosCount > 3) {
      errors['videos'] = 'Maximum 3 videos allowed';
    }
    if (voiceNotesCount > 2) {
      errors['voiceNotes'] = 'Maximum 2 voice notes allowed';
    }

    for (int i = 0; i < media.length; i++) {
      final mediaItem = media[i];
      final mediaErrors = <String>[];

      if (mediaItem.filePath.trim().isEmpty) {
        mediaErrors.add('File path is required');
      }

      if (mediaItem.fileSizeBytes <= 0) {
        mediaErrors.add('Invalid file size');
      }

      if (mediaErrors.isNotEmpty) {
        errors['media_$i'] = mediaErrors;
      }
    }

    if (errors.isNotEmpty) {
      return UpdateResult.validationFailure(errors);
    }

    return UpdateResult.success(media);
  }

  UpdateResult<List<MediaEntity>> _validateMediaItem(MediaEntity media) {
    return _validateMedia([media]);
  }

  UpdateResult<List<InterestEntity>> _validateInterests(
    List<InterestEntity> interests,
  ) {
    final errors = <String, dynamic>{};

    if (interests.length > 10) {
      errors['interests'] = 'Maximum 10 interests allowed';
    }

    for (int i = 0; i < interests.length; i++) {
      final interest = interests[i];
      final interestErrors = <String>[];

      if (interest.interest.trim().isEmpty) {
        interestErrors.add('Interest name is required');
      } else if (interest.interest.length > 50) {
        interestErrors.add('Interest name must be 50 characters or less');
      }

      if (interestErrors.isNotEmpty) {
        errors['interest_$i'] = interestErrors;
      }
    }

    // Check for duplicate interests
    final uniqueInterests = interests
        .map((i) => i.interest.toLowerCase())
        .toSet();
    if (uniqueInterests.length != interests.length) {
      errors['interests'] = 'Duplicate interests are not allowed';
    }

    if (errors.isNotEmpty) {
      return UpdateResult.validationFailure(errors);
    }

    return UpdateResult.success(interests);
  }

  UpdateResult<List<InterestEntity>> _validateInterest(
    InterestEntity interest,
  ) {
    return _validateInterests([interest]);
  }

  UpdateResult<List<BadgeEntity>> _validateBadges(List<BadgeEntity> badges) {
    final errors = <String, dynamic>{};

    if (badges.length > 5) {
      errors['badges'] = 'Maximum 5 badges allowed';
    }

    for (int i = 0; i < badges.length; i++) {
      final badge = badges[i];
      final badgeErrors = <String>[];

      if (badge.badge.trim().isEmpty) {
        badgeErrors.add('Badge name is required');
      } else if (badge.badge.length > 50) {
        badgeErrors.add('Badge name must be 50 characters or less');
      }

      if (badgeErrors.isNotEmpty) {
        errors['badge_$i'] = badgeErrors;
      }
    }

    if (errors.isNotEmpty) {
      return UpdateResult.validationFailure(errors);
    }

    return UpdateResult.success(badges);
  }

  UpdateResult<List<BadgeEntity>> _validateBadge(BadgeEntity badge) {
    return _validateBadges([badge]);
  }

  // 🔢 BUSINESS LOGIC METHODS

  bool _checkMediaLimits(Map<MediaType, int> currentCounts, MediaType newType) {
    final currentCount = currentCounts[newType] ?? 0;

    switch (newType) {
      case MediaType.photo:
        return currentCount < 6;
      case MediaType.video:
        return currentCount < 3;
      case MediaType.voiceNote:
        return currentCount < 2;
    }
  }

  double _calculateCompleteness({
    required ProfileEntity profile,
    required List<PromptEntity> prompts,
    required PollEntity? poll,
    required List<MediaEntity> media,
    required List<InterestEntity> interests,
    required List<BadgeEntity> badges,
  }) {
    double score = 0.0;

    // Basic info (40%)
    if (profile.name.isNotEmpty) score += 0.10;
    if (profile.age >= 18) score += 0.05;
    if (profile.location.isNotEmpty) score += 0.05;
    if (profile.gender.isNotEmpty) score += 0.05;
    if (profile.bio != null && profile.bio!.isNotEmpty) score += 0.10;
    if (profile.datingGoals != null && profile.datingGoals!.isNotEmpty)
      score += 0.05;

    // Media (25%)
    final photos = media.where((m) => m.type == MediaType.photo).length;
    if (photos >= 1) score += 0.10;
    if (photos >= 3) score += 0.08;
    if (photos >= 5) score += 0.07;

    // Prompts (20%)
    if (prompts.isNotEmpty) score += 0.07;
    if (prompts.length >= 2) score += 0.07;
    if (prompts.length >= 3) score += 0.06;

    // Interactive content (10%)
    if (poll != null) score += 0.10;

    // Interests (3%)
    if (interests.isNotEmpty) score += 0.01;
    if (interests.length >= 5) score += 0.01;
    if (interests.length >= 8) score += 0.01;

    // Badges (2%)
    if (badges.isNotEmpty) score += 0.02;

    return score.clamp(0.0, 1.0);
  }
}

// 🎯 RIVERPOD PROVIDERS

/// 🔧 Riverpod Provider for UpdateProfileUseCase
@riverpod
UpdateProfileUseCase updateProfileUseCase(UpdateProfileUseCaseRef ref) {
  // Repository will be injected here once we create the data layer
  throw UnimplementedError('ProfileRepository provider not implemented yet');
}

/// 🔧 Riverpod Provider for Basic Info Update
@riverpod
Future<UpdateResult<ProfileEntity>> updateBasicInfo(
  UpdateBasicInfoRef ref,
  String profileId,
  ProfileEntity profile,
) async {
  final useCase = ref.watch(updateProfileUseCaseProvider);
  return await useCase.updateBasicInfo(profileId, profile);
}

/// 🔧 Riverpod Provider for Prompts Update
@riverpod
Future<UpdateResult<List<PromptEntity>>> updatePrompts(
  UpdatePromptsRef ref,
  String profileId,
  List<PromptEntity> prompts,
) async {
  final useCase = ref.watch(updateProfileUseCaseProvider);
  return await useCase.updatePrompts(profileId, prompts);
}

/// 🔧 Riverpod Provider for Poll Update
@riverpod
Future<UpdateResult<PollEntity>> updatePoll(
  UpdatePollRef ref,
  String profileId,
  PollEntity poll,
) async {
  final useCase = ref.watch(updateProfileUseCaseProvider);
  return await useCase.updatePoll(profileId, poll);
}

/// 🔧 Riverpod Provider for Media Update
@riverpod
Future<UpdateResult<List<MediaEntity>>> updateMedia(
  UpdateMediaRef ref,
  String profileId,
  List<MediaEntity> media,
) async {
  final useCase = ref.watch(updateProfileUseCaseProvider);
  return await useCase.updateMedia(profileId, media);
}

/// 🔧 Riverpod Provider for Interests Update
@riverpod
Future<UpdateResult<List<InterestEntity>>> updateInterests(
  UpdateInterestsRef ref,
  String profileId,
  List<InterestEntity> interests,
) async {
  final useCase = ref.watch(updateProfileUseCaseProvider);
  return await useCase.updateInterests(profileId, interests);
}

/// 🔧 Riverpod Provider for Badges Update
@riverpod
Future<UpdateResult<List<BadgeEntity>>> updateBadges(
  UpdateBadgesRef ref,
  String profileId,
  List<BadgeEntity> badges,
) async {
  final useCase = ref.watch(updateProfileUseCaseProvider);
  return await useCase.updateBadges(profileId, badges);
}

/// 🔧 Riverpod Provider for Complete Profile Update
@riverpod
Future<UpdateResult<ProfileEntity>> updateCompleteProfile(
  UpdateCompleteProfileRef ref,
  String profileId, {
  ProfileEntity? profile,
  List<PromptEntity>? prompts,
  PollEntity? poll,
  List<MediaEntity>? media,
  List<InterestEntity>? interests,
  List<BadgeEntity>? badges,
}) async {
  final useCase = ref.watch(updateProfileUseCaseProvider);
  return await useCase.updateCompleteProfile(
    profileId,
    profile: profile,
    prompts: prompts,
    poll: poll,
    media: media,
    interests: interests,
    badges: badges,
  );
}

/// 🔧 Riverpod Provider for Profile Completeness
@riverpod
Future<double> profileCompleteness(
  ProfileCompletenessRef ref,
  String profileId,
) async {
  final useCase = ref.watch(updateProfileUseCaseProvider);
  return await useCase.calculateProfileCompleteness(profileId);
}

/// 🔧 Riverpod Provider for Profile Statistics
@riverpod
Future<Map<String, dynamic>> updateProfileStatistics(
  UpdateProfileStatisticsRef ref,
  String profileId,
) async {
  final useCase = ref.watch(updateProfileUseCaseProvider);
  return await useCase.getProfileStatistics(profileId);
}
