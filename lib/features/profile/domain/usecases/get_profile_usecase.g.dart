// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 🔍 Riverpod Provider for GetProfileUseCase
@ProviderFor(getProfileUseCase)
const getProfileUseCaseProvider = GetProfileUseCaseProvider._();

/// 🔍 Riverpod Provider for GetProfileUseCase
final class GetProfileUseCaseProvider
    extends
        $FunctionalProvider<
          GetProfileUseCase,
          GetProfileUseCase,
          GetProfileUseCase
        >
    with $Provider<GetProfileUseCase> {
  /// 🔍 Riverpod Provider for GetProfileUseCase
  const GetProfileUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProfileUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProfileUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProfileUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProfileUseCase create(Ref ref) {
    return getProfileUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProfileUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProfileUseCase>(value),
    );
  }
}

String _$getProfileUseCaseHash() => r'886601b22f30faeb978776f38b799785e804f96c';

/// 🔍 Riverpod Provider for Profile Data
@ProviderFor(profileData)
const profileDataProvider = ProfileDataFamily._();

/// 🔍 Riverpod Provider for Profile Data
final class ProfileDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProfileData?>,
          ProfileData?,
          FutureOr<ProfileData?>
        >
    with $FutureModifier<ProfileData?>, $FutureProvider<ProfileData?> {
  /// 🔍 Riverpod Provider for Profile Data
  const ProfileDataProvider._({
    required ProfileDataFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'profileDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileDataHash();

  @override
  String toString() {
    return r'profileDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProfileData?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProfileData?> create(Ref ref) {
    final argument = this.argument as String;
    return profileData(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileDataHash() => r'47d49dba8a62113f990fabcff3f01c0c545f42ae';

/// 🔍 Riverpod Provider for Profile Data
final class ProfileDataFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProfileData?>, String> {
  const ProfileDataFamily._()
    : super(
        retry: null,
        name: r'profileDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔍 Riverpod Provider for Profile Data
  ProfileDataProvider call(String profileId) =>
      ProfileDataProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileDataProvider';
}

/// 🔍 Riverpod Provider for Basic Profile
@ProviderFor(basicProfile)
const basicProfileProvider = BasicProfileFamily._();

/// 🔍 Riverpod Provider for Basic Profile
final class BasicProfileProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProfileEntity?>,
          ProfileEntity?,
          FutureOr<ProfileEntity?>
        >
    with $FutureModifier<ProfileEntity?>, $FutureProvider<ProfileEntity?> {
  /// 🔍 Riverpod Provider for Basic Profile
  const BasicProfileProvider._({
    required BasicProfileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'basicProfileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$basicProfileHash();

  @override
  String toString() {
    return r'basicProfileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProfileEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProfileEntity?> create(Ref ref) {
    final argument = this.argument as String;
    return basicProfile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BasicProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$basicProfileHash() => r'4da6247e38a0d49d7f4cdb814a82dc83b05bfe03';

/// 🔍 Riverpod Provider for Basic Profile
final class BasicProfileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProfileEntity?>, String> {
  const BasicProfileFamily._()
    : super(
        retry: null,
        name: r'basicProfileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔍 Riverpod Provider for Basic Profile
  BasicProfileProvider call(String profileId) =>
      BasicProfileProvider._(argument: profileId, from: this);

  @override
  String toString() => r'basicProfileProvider';
}

/// 🔍 Riverpod Provider for Profile Statistics
@ProviderFor(profileStatistics)
const profileStatisticsProvider = ProfileStatisticsFamily._();

/// 🔍 Riverpod Provider for Profile Statistics
final class ProfileStatisticsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>>,
          Map<String, dynamic>,
          FutureOr<Map<String, dynamic>>
        >
    with
        $FutureModifier<Map<String, dynamic>>,
        $FutureProvider<Map<String, dynamic>> {
  /// 🔍 Riverpod Provider for Profile Statistics
  const ProfileStatisticsProvider._({
    required ProfileStatisticsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'profileStatisticsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileStatisticsHash();

  @override
  String toString() {
    return r'profileStatisticsProvider'
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
    return profileStatistics(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileStatisticsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileStatisticsHash() => r'8a0e0747ce5fdc59cb177e16e0fc05de56db5c41';

/// 🔍 Riverpod Provider for Profile Statistics
final class ProfileStatisticsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Map<String, dynamic>>, String> {
  const ProfileStatisticsFamily._()
    : super(
        retry: null,
        name: r'profileStatisticsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔍 Riverpod Provider for Profile Statistics
  ProfileStatisticsProvider call(String profileId) =>
      ProfileStatisticsProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileStatisticsProvider';
}

/// 🔍 Riverpod Provider for Profile Existence Check
@ProviderFor(profileExists)
const profileExistsProvider = ProfileExistsFamily._();

/// 🔍 Riverpod Provider for Profile Existence Check
final class ProfileExistsProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// 🔍 Riverpod Provider for Profile Existence Check
  const ProfileExistsProvider._({
    required ProfileExistsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'profileExistsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileExistsHash();

  @override
  String toString() {
    return r'profileExistsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String;
    return profileExists(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileExistsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileExistsHash() => r'dca687be1949e9dbbd15c02946cd47e448afcfc0';

/// 🔍 Riverpod Provider for Profile Existence Check
final class ProfileExistsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  const ProfileExistsFamily._()
    : super(
        retry: null,
        name: r'profileExistsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔍 Riverpod Provider for Profile Existence Check
  ProfileExistsProvider call(String profileId) =>
      ProfileExistsProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileExistsProvider';
}

/// 🔍 Riverpod Provider for Multiple Profiles
@ProviderFor(multipleProfiles)
const multipleProfilesProvider = MultipleProfilesFamily._();

/// 🔍 Riverpod Provider for Multiple Profiles
final class MultipleProfilesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProfileData>>,
          List<ProfileData>,
          FutureOr<List<ProfileData>>
        >
    with
        $FutureModifier<List<ProfileData>>,
        $FutureProvider<List<ProfileData>> {
  /// 🔍 Riverpod Provider for Multiple Profiles
  const MultipleProfilesProvider._({
    required MultipleProfilesFamily super.from,
    required List<String> super.argument,
  }) : super(
         retry: null,
         name: r'multipleProfilesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$multipleProfilesHash();

  @override
  String toString() {
    return r'multipleProfilesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ProfileData>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProfileData>> create(Ref ref) {
    final argument = this.argument as List<String>;
    return multipleProfiles(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MultipleProfilesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$multipleProfilesHash() => r'184d91e31e0d45fa49167b65b0230b25f97d27cd';

/// 🔍 Riverpod Provider for Multiple Profiles
final class MultipleProfilesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ProfileData>>, List<String>> {
  const MultipleProfilesFamily._()
    : super(
        retry: null,
        name: r'multipleProfilesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🔍 Riverpod Provider for Multiple Profiles
  MultipleProfilesProvider call(List<String> profileIds) =>
      MultipleProfilesProvider._(argument: profileIds, from: this);

  @override
  String toString() => r'multipleProfilesProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
