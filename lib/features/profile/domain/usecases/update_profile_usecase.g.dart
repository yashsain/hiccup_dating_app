// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 🔧 Riverpod Provider for UpdateProfileUseCase
@ProviderFor(updateProfileUseCase)
const updateProfileUseCaseProvider = UpdateProfileUseCaseProvider._();

/// 🔧 Riverpod Provider for UpdateProfileUseCase
final class UpdateProfileUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateProfileUseCase,
          UpdateProfileUseCase,
          UpdateProfileUseCase
        >
    with $Provider<UpdateProfileUseCase> {
  /// 🔧 Riverpod Provider for UpdateProfileUseCase
  const UpdateProfileUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateProfileUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateProfileUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateProfileUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateProfileUseCase create(Ref ref) {
    return updateProfileUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateProfileUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateProfileUseCase>(value),
    );
  }
}

String _$updateProfileUseCaseHash() =>
    r'065b485fe1309408536fc97dc0a68a169f7f7ef3';

/// 🔧 Riverpod Provider for Basic Info Update
@ProviderFor(updateBasicInfo)
const updateBasicInfoProvider = UpdateBasicInfoFamily._();

/// 🔧 Riverpod Provider for Basic Info Update
final class UpdateBasicInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<UpdateResult<ProfileEntity>>,
          UpdateResult<ProfileEntity>,
          FutureOr<UpdateResult<ProfileEntity>>
        >
    with
        $FutureModifier<UpdateResult<ProfileEntity>>,
        $FutureProvider<UpdateResult<ProfileEntity>> {
  /// 🔧 Riverpod Provider for Basic Info Update
  const UpdateBasicInfoProvider._({
    required UpdateBasicInfoFamily super.from,
    required (String, ProfileEntity) super.argument,
  }) : super(
         retry: null,
         name: r'updateBasicInfoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateBasicInfoHash();

  @override
  String toString() {
    return r'updateBasicInfoProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<UpdateResult<ProfileEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UpdateResult<ProfileEntity>> create(Ref ref) {
    final argument = this.argument as (String, ProfileEntity);
    return updateBasicInfo(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateBasicInfoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateBasicInfoHash() => r'6b62b24975d669adf6d500ac53ff9af4c29a4807';

/// 🔧 Riverpod Provider for Basic Info Update
final class UpdateBasicInfoFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<UpdateResult<ProfileEntity>>,
          (String, ProfileEntity)
        > {
  const UpdateBasicInfoFamily._()
    : super(
        retry: null,
        name: r'updateBasicInfoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔧 Riverpod Provider for Basic Info Update
  UpdateBasicInfoProvider call(String profileId, ProfileEntity profile) =>
      UpdateBasicInfoProvider._(argument: (profileId, profile), from: this);

  @override
  String toString() => r'updateBasicInfoProvider';
}

/// 🔧 Riverpod Provider for Prompts Update
@ProviderFor(updatePrompts)
const updatePromptsProvider = UpdatePromptsFamily._();

/// 🔧 Riverpod Provider for Prompts Update
final class UpdatePromptsProvider
    extends
        $FunctionalProvider<
          AsyncValue<UpdateResult<List<PromptEntity>>>,
          UpdateResult<List<PromptEntity>>,
          FutureOr<UpdateResult<List<PromptEntity>>>
        >
    with
        $FutureModifier<UpdateResult<List<PromptEntity>>>,
        $FutureProvider<UpdateResult<List<PromptEntity>>> {
  /// 🔧 Riverpod Provider for Prompts Update
  const UpdatePromptsProvider._({
    required UpdatePromptsFamily super.from,
    required (String, List<PromptEntity>) super.argument,
  }) : super(
         retry: null,
         name: r'updatePromptsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updatePromptsHash();

  @override
  String toString() {
    return r'updatePromptsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<UpdateResult<List<PromptEntity>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UpdateResult<List<PromptEntity>>> create(Ref ref) {
    final argument = this.argument as (String, List<PromptEntity>);
    return updatePrompts(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePromptsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updatePromptsHash() => r'bcfbb2825d55fc1deb13c8ea40d86d0f43d9edd3';

/// 🔧 Riverpod Provider for Prompts Update
final class UpdatePromptsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<UpdateResult<List<PromptEntity>>>,
          (String, List<PromptEntity>)
        > {
  const UpdatePromptsFamily._()
    : super(
        retry: null,
        name: r'updatePromptsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔧 Riverpod Provider for Prompts Update
  UpdatePromptsProvider call(String profileId, List<PromptEntity> prompts) =>
      UpdatePromptsProvider._(argument: (profileId, prompts), from: this);

  @override
  String toString() => r'updatePromptsProvider';
}

/// 🔧 Riverpod Provider for Poll Update
@ProviderFor(updatePoll)
const updatePollProvider = UpdatePollFamily._();

/// 🔧 Riverpod Provider for Poll Update
final class UpdatePollProvider
    extends
        $FunctionalProvider<
          AsyncValue<UpdateResult<PollEntity>>,
          UpdateResult<PollEntity>,
          FutureOr<UpdateResult<PollEntity>>
        >
    with
        $FutureModifier<UpdateResult<PollEntity>>,
        $FutureProvider<UpdateResult<PollEntity>> {
  /// 🔧 Riverpod Provider for Poll Update
  const UpdatePollProvider._({
    required UpdatePollFamily super.from,
    required (String, PollEntity) super.argument,
  }) : super(
         retry: null,
         name: r'updatePollProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updatePollHash();

  @override
  String toString() {
    return r'updatePollProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<UpdateResult<PollEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UpdateResult<PollEntity>> create(Ref ref) {
    final argument = this.argument as (String, PollEntity);
    return updatePoll(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePollProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updatePollHash() => r'067ec266e1ade2a2d122c0fb6c2fb476f03e582a';

/// 🔧 Riverpod Provider for Poll Update
final class UpdatePollFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<UpdateResult<PollEntity>>,
          (String, PollEntity)
        > {
  const UpdatePollFamily._()
    : super(
        retry: null,
        name: r'updatePollProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔧 Riverpod Provider for Poll Update
  UpdatePollProvider call(String profileId, PollEntity poll) =>
      UpdatePollProvider._(argument: (profileId, poll), from: this);

  @override
  String toString() => r'updatePollProvider';
}

/// 🔧 Riverpod Provider for Media Update
@ProviderFor(updateMedia)
const updateMediaProvider = UpdateMediaFamily._();

/// 🔧 Riverpod Provider for Media Update
final class UpdateMediaProvider
    extends
        $FunctionalProvider<
          AsyncValue<UpdateResult<List<MediaEntity>>>,
          UpdateResult<List<MediaEntity>>,
          FutureOr<UpdateResult<List<MediaEntity>>>
        >
    with
        $FutureModifier<UpdateResult<List<MediaEntity>>>,
        $FutureProvider<UpdateResult<List<MediaEntity>>> {
  /// 🔧 Riverpod Provider for Media Update
  const UpdateMediaProvider._({
    required UpdateMediaFamily super.from,
    required (String, List<MediaEntity>) super.argument,
  }) : super(
         retry: null,
         name: r'updateMediaProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateMediaHash();

  @override
  String toString() {
    return r'updateMediaProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<UpdateResult<List<MediaEntity>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UpdateResult<List<MediaEntity>>> create(Ref ref) {
    final argument = this.argument as (String, List<MediaEntity>);
    return updateMedia(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateMediaProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateMediaHash() => r'5cd7251cee3f0d28bd90890d0c696830c707b855';

/// 🔧 Riverpod Provider for Media Update
final class UpdateMediaFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<UpdateResult<List<MediaEntity>>>,
          (String, List<MediaEntity>)
        > {
  const UpdateMediaFamily._()
    : super(
        retry: null,
        name: r'updateMediaProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔧 Riverpod Provider for Media Update
  UpdateMediaProvider call(String profileId, List<MediaEntity> media) =>
      UpdateMediaProvider._(argument: (profileId, media), from: this);

  @override
  String toString() => r'updateMediaProvider';
}

/// 🔧 Riverpod Provider for Interests Update
@ProviderFor(updateInterests)
const updateInterestsProvider = UpdateInterestsFamily._();

/// 🔧 Riverpod Provider for Interests Update
final class UpdateInterestsProvider
    extends
        $FunctionalProvider<
          AsyncValue<UpdateResult<List<InterestEntity>>>,
          UpdateResult<List<InterestEntity>>,
          FutureOr<UpdateResult<List<InterestEntity>>>
        >
    with
        $FutureModifier<UpdateResult<List<InterestEntity>>>,
        $FutureProvider<UpdateResult<List<InterestEntity>>> {
  /// 🔧 Riverpod Provider for Interests Update
  const UpdateInterestsProvider._({
    required UpdateInterestsFamily super.from,
    required (String, List<InterestEntity>) super.argument,
  }) : super(
         retry: null,
         name: r'updateInterestsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateInterestsHash();

  @override
  String toString() {
    return r'updateInterestsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<UpdateResult<List<InterestEntity>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UpdateResult<List<InterestEntity>>> create(Ref ref) {
    final argument = this.argument as (String, List<InterestEntity>);
    return updateInterests(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateInterestsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateInterestsHash() => r'ca683eda442c26f2883b4f1f4f5ed145d4f25cfc';

/// 🔧 Riverpod Provider for Interests Update
final class UpdateInterestsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<UpdateResult<List<InterestEntity>>>,
          (String, List<InterestEntity>)
        > {
  const UpdateInterestsFamily._()
    : super(
        retry: null,
        name: r'updateInterestsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔧 Riverpod Provider for Interests Update
  UpdateInterestsProvider call(
    String profileId,
    List<InterestEntity> interests,
  ) => UpdateInterestsProvider._(argument: (profileId, interests), from: this);

  @override
  String toString() => r'updateInterestsProvider';
}

/// 🔧 Riverpod Provider for Badges Update
@ProviderFor(updateBadges)
const updateBadgesProvider = UpdateBadgesFamily._();

/// 🔧 Riverpod Provider for Badges Update
final class UpdateBadgesProvider
    extends
        $FunctionalProvider<
          AsyncValue<UpdateResult<List<BadgeEntity>>>,
          UpdateResult<List<BadgeEntity>>,
          FutureOr<UpdateResult<List<BadgeEntity>>>
        >
    with
        $FutureModifier<UpdateResult<List<BadgeEntity>>>,
        $FutureProvider<UpdateResult<List<BadgeEntity>>> {
  /// 🔧 Riverpod Provider for Badges Update
  const UpdateBadgesProvider._({
    required UpdateBadgesFamily super.from,
    required (String, List<BadgeEntity>) super.argument,
  }) : super(
         retry: null,
         name: r'updateBadgesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateBadgesHash();

  @override
  String toString() {
    return r'updateBadgesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<UpdateResult<List<BadgeEntity>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UpdateResult<List<BadgeEntity>>> create(Ref ref) {
    final argument = this.argument as (String, List<BadgeEntity>);
    return updateBadges(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateBadgesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateBadgesHash() => r'368d99113d0aa4e777e1e978ee814d81945101ed';

/// 🔧 Riverpod Provider for Badges Update
final class UpdateBadgesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<UpdateResult<List<BadgeEntity>>>,
          (String, List<BadgeEntity>)
        > {
  const UpdateBadgesFamily._()
    : super(
        retry: null,
        name: r'updateBadgesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔧 Riverpod Provider for Badges Update
  UpdateBadgesProvider call(String profileId, List<BadgeEntity> badges) =>
      UpdateBadgesProvider._(argument: (profileId, badges), from: this);

  @override
  String toString() => r'updateBadgesProvider';
}

/// 🔧 Riverpod Provider for Complete Profile Update
@ProviderFor(updateCompleteProfile)
const updateCompleteProfileProvider = UpdateCompleteProfileFamily._();

/// 🔧 Riverpod Provider for Complete Profile Update
final class UpdateCompleteProfileProvider
    extends
        $FunctionalProvider<
          AsyncValue<UpdateResult<ProfileEntity>>,
          UpdateResult<ProfileEntity>,
          FutureOr<UpdateResult<ProfileEntity>>
        >
    with
        $FutureModifier<UpdateResult<ProfileEntity>>,
        $FutureProvider<UpdateResult<ProfileEntity>> {
  /// 🔧 Riverpod Provider for Complete Profile Update
  const UpdateCompleteProfileProvider._({
    required UpdateCompleteProfileFamily super.from,
    required (
      String, {
      ProfileEntity? profile,
      List<PromptEntity>? prompts,
      PollEntity? poll,
      List<MediaEntity>? media,
      List<InterestEntity>? interests,
      List<BadgeEntity>? badges,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'updateCompleteProfileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateCompleteProfileHash();

  @override
  String toString() {
    return r'updateCompleteProfileProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<UpdateResult<ProfileEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UpdateResult<ProfileEntity>> create(Ref ref) {
    final argument =
        this.argument
            as (
              String, {
              ProfileEntity? profile,
              List<PromptEntity>? prompts,
              PollEntity? poll,
              List<MediaEntity>? media,
              List<InterestEntity>? interests,
              List<BadgeEntity>? badges,
            });
    return updateCompleteProfile(
      ref,
      argument.$1,
      profile: argument.profile,
      prompts: argument.prompts,
      poll: argument.poll,
      media: argument.media,
      interests: argument.interests,
      badges: argument.badges,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCompleteProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateCompleteProfileHash() =>
    r'e0898cb8390c50ab6bd49e82a04104f669ed01e5';

/// 🔧 Riverpod Provider for Complete Profile Update
final class UpdateCompleteProfileFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<UpdateResult<ProfileEntity>>,
          (
            String, {
            ProfileEntity? profile,
            List<PromptEntity>? prompts,
            PollEntity? poll,
            List<MediaEntity>? media,
            List<InterestEntity>? interests,
            List<BadgeEntity>? badges,
          })
        > {
  const UpdateCompleteProfileFamily._()
    : super(
        retry: null,
        name: r'updateCompleteProfileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔧 Riverpod Provider for Complete Profile Update
  UpdateCompleteProfileProvider call(
    String profileId, {
    ProfileEntity? profile,
    List<PromptEntity>? prompts,
    PollEntity? poll,
    List<MediaEntity>? media,
    List<InterestEntity>? interests,
    List<BadgeEntity>? badges,
  }) => UpdateCompleteProfileProvider._(
    argument: (
      profileId,
      profile: profile,
      prompts: prompts,
      poll: poll,
      media: media,
      interests: interests,
      badges: badges,
    ),
    from: this,
  );

  @override
  String toString() => r'updateCompleteProfileProvider';
}

/// 🔧 Riverpod Provider for Profile Completeness
@ProviderFor(profileCompleteness)
const profileCompletenessProvider = ProfileCompletenessFamily._();

/// 🔧 Riverpod Provider for Profile Completeness
final class ProfileCompletenessProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  /// 🔧 Riverpod Provider for Profile Completeness
  const ProfileCompletenessProvider._({
    required ProfileCompletenessFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'profileCompletenessProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileCompletenessHash();

  @override
  String toString() {
    return r'profileCompletenessProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    final argument = this.argument as String;
    return profileCompleteness(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileCompletenessProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileCompletenessHash() =>
    r'50d6e90a6f8c046e55ceb89927897b776fbb7a6b';

/// 🔧 Riverpod Provider for Profile Completeness
final class ProfileCompletenessFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<double>, String> {
  const ProfileCompletenessFamily._()
    : super(
        retry: null,
        name: r'profileCompletenessProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔧 Riverpod Provider for Profile Completeness
  ProfileCompletenessProvider call(String profileId) =>
      ProfileCompletenessProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileCompletenessProvider';
}

/// 🔧 Riverpod Provider for Profile Statistics
@ProviderFor(updateProfileStatistics)
const updateProfileStatisticsProvider = UpdateProfileStatisticsFamily._();

/// 🔧 Riverpod Provider for Profile Statistics
final class UpdateProfileStatisticsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>>,
          Map<String, dynamic>,
          FutureOr<Map<String, dynamic>>
        >
    with
        $FutureModifier<Map<String, dynamic>>,
        $FutureProvider<Map<String, dynamic>> {
  /// 🔧 Riverpod Provider for Profile Statistics
  const UpdateProfileStatisticsProvider._({
    required UpdateProfileStatisticsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'updateProfileStatisticsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateProfileStatisticsHash();

  @override
  String toString() {
    return r'updateProfileStatisticsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<String, dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, dynamic>> create(Ref ref) {
    final argument = this.argument as String;
    return updateProfileStatistics(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateProfileStatisticsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateProfileStatisticsHash() =>
    r'b6155819a70621b7c47ffe6e0f1fe84a6fba621e';

/// 🔧 Riverpod Provider for Profile Statistics
final class UpdateProfileStatisticsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Map<String, dynamic>>, String> {
  const UpdateProfileStatisticsFamily._()
    : super(
        retry: null,
        name: r'updateProfileStatisticsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔧 Riverpod Provider for Profile Statistics
  UpdateProfileStatisticsProvider call(String profileId) =>
      UpdateProfileStatisticsProvider._(argument: profileId, from: this);

  @override
  String toString() => r'updateProfileStatisticsProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
