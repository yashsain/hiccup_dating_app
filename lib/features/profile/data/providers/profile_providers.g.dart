// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 🔌 Profile Providers - Riverpod Integration for Complete Data Flow (2025)
///
/// This file contains all Riverpod providers for the profile feature, creating
/// a complete dependency injection system that's ready for easy backend swapping.
///
/// Provider Hierarchy:
/// ```
/// UI Widgets
///     ↓
/// Use Case Providers (Business Logic)
///     ↓
/// Repository Provider (Interface)
///     ↓
/// Repository Implementation (Local/API)
///     ↓
/// Datasource Provider (SQLite/HTTP)
///     ↓
/// Database Provider (SQLite)
/// ```
///
/// Backend Swap Strategy:
/// - For production: Just change repositoryProvider to use ApiRepositoryImpl
/// - All use cases and UI stay identical
/// - Zero code changes needed in business logic
///
/// Features:
/// - Automatic dependency injection
/// - Code generation for type safety
/// - Easy testing with provider overrides
/// - Clean separation of concerns
/// - Ready for production backend swap
// ============================================================================
// 📊 DATA LAYER PROVIDERS
// ============================================================================
/// Profile Local Datasource Provider
///
/// Provides the SQLite datasource for local development and testing.
/// For production: Create profileApiDatasourceProvider with HTTP client.
@ProviderFor(profileLocalDatasource)
const profileLocalDatasourceProvider = ProfileLocalDatasourceProvider._();

/// 🔌 Profile Providers - Riverpod Integration for Complete Data Flow (2025)
///
/// This file contains all Riverpod providers for the profile feature, creating
/// a complete dependency injection system that's ready for easy backend swapping.
///
/// Provider Hierarchy:
/// ```
/// UI Widgets
///     ↓
/// Use Case Providers (Business Logic)
///     ↓
/// Repository Provider (Interface)
///     ↓
/// Repository Implementation (Local/API)
///     ↓
/// Datasource Provider (SQLite/HTTP)
///     ↓
/// Database Provider (SQLite)
/// ```
///
/// Backend Swap Strategy:
/// - For production: Just change repositoryProvider to use ApiRepositoryImpl
/// - All use cases and UI stay identical
/// - Zero code changes needed in business logic
///
/// Features:
/// - Automatic dependency injection
/// - Code generation for type safety
/// - Easy testing with provider overrides
/// - Clean separation of concerns
/// - Ready for production backend swap
// ============================================================================
// 📊 DATA LAYER PROVIDERS
// ============================================================================
/// Profile Local Datasource Provider
///
/// Provides the SQLite datasource for local development and testing.
/// For production: Create profileApiDatasourceProvider with HTTP client.
final class ProfileLocalDatasourceProvider
    extends
        $FunctionalProvider<
          ProfileLocalDatasource,
          ProfileLocalDatasource,
          ProfileLocalDatasource
        >
    with $Provider<ProfileLocalDatasource> {
  /// 🔌 Profile Providers - Riverpod Integration for Complete Data Flow (2025)
  ///
  /// This file contains all Riverpod providers for the profile feature, creating
  /// a complete dependency injection system that's ready for easy backend swapping.
  ///
  /// Provider Hierarchy:
  /// ```
  /// UI Widgets
  ///     ↓
  /// Use Case Providers (Business Logic)
  ///     ↓
  /// Repository Provider (Interface)
  ///     ↓
  /// Repository Implementation (Local/API)
  ///     ↓
  /// Datasource Provider (SQLite/HTTP)
  ///     ↓
  /// Database Provider (SQLite)
  /// ```
  ///
  /// Backend Swap Strategy:
  /// - For production: Just change repositoryProvider to use ApiRepositoryImpl
  /// - All use cases and UI stay identical
  /// - Zero code changes needed in business logic
  ///
  /// Features:
  /// - Automatic dependency injection
  /// - Code generation for type safety
  /// - Easy testing with provider overrides
  /// - Clean separation of concerns
  /// - Ready for production backend swap
  // ============================================================================
  // 📊 DATA LAYER PROVIDERS
  // ============================================================================
  /// Profile Local Datasource Provider
  ///
  /// Provides the SQLite datasource for local development and testing.
  /// For production: Create profileApiDatasourceProvider with HTTP client.
  const ProfileLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileLocalDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<ProfileLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProfileLocalDatasource create(Ref ref) {
    return profileLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileLocalDatasource>(value),
    );
  }
}

String _$profileLocalDatasourceHash() =>
    r'0068b235d8c79b466c612a90a8d34345f5ee8c75';

/// Profile Repository Provider
///
/// **🎯 KEY PROVIDER FOR BACKEND SWAP**
/// This is where you'll change from local to API implementation.
///
/// Current: Uses ProfileRepositoryImpl + ProfileLocalDatasource (SQLite)
/// Production: Use ProfileRepositoryImpl + ProfileApiDatasource (HTTP)
@ProviderFor(profileRepository)
const profileRepositoryProvider = ProfileRepositoryProvider._();

/// Profile Repository Provider
///
/// **🎯 KEY PROVIDER FOR BACKEND SWAP**
/// This is where you'll change from local to API implementation.
///
/// Current: Uses ProfileRepositoryImpl + ProfileLocalDatasource (SQLite)
/// Production: Use ProfileRepositoryImpl + ProfileApiDatasource (HTTP)
final class ProfileRepositoryProvider
    extends
        $FunctionalProvider<
          ProfileRepository,
          ProfileRepository,
          ProfileRepository
        >
    with $Provider<ProfileRepository> {
  /// Profile Repository Provider
  ///
  /// **🎯 KEY PROVIDER FOR BACKEND SWAP**
  /// This is where you'll change from local to API implementation.
  ///
  /// Current: Uses ProfileRepositoryImpl + ProfileLocalDatasource (SQLite)
  /// Production: Use ProfileRepositoryImpl + ProfileApiDatasource (HTTP)
  const ProfileRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProfileRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProfileRepository create(Ref ref) {
    return profileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileRepository>(value),
    );
  }
}

String _$profileRepositoryHash() => r'aeb2e021ab76aaa491a11d491ebde5f5a3d7eb83';

/// Demo Data Manager Provider
///
/// Manages demo data lifecycle for development and testing.
/// Will be removed in production.
@ProviderFor(demoDataManager)
const demoDataManagerProvider = DemoDataManagerProvider._();

/// Demo Data Manager Provider
///
/// Manages demo data lifecycle for development and testing.
/// Will be removed in production.
final class DemoDataManagerProvider
    extends
        $FunctionalProvider<DemoDataManager, DemoDataManager, DemoDataManager>
    with $Provider<DemoDataManager> {
  /// Demo Data Manager Provider
  ///
  /// Manages demo data lifecycle for development and testing.
  /// Will be removed in production.
  const DemoDataManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'demoDataManagerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$demoDataManagerHash();

  @$internal
  @override
  $ProviderElement<DemoDataManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DemoDataManager create(Ref ref) {
    return demoDataManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DemoDataManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DemoDataManager>(value),
    );
  }
}

String _$demoDataManagerHash() => r'aa5904c8ffd703208743dfad5c14584ac7a2a85e';

/// Get Profile Use Case Provider
///
/// Handles profile retrieval with business logic validation.
/// Works with both local and API data sources.
@ProviderFor(getProfileUseCase)
const getProfileUseCaseProvider = GetProfileUseCaseProvider._();

/// Get Profile Use Case Provider
///
/// Handles profile retrieval with business logic validation.
/// Works with both local and API data sources.
final class GetProfileUseCaseProvider
    extends
        $FunctionalProvider<
          GetProfileUseCase,
          GetProfileUseCase,
          GetProfileUseCase
        >
    with $Provider<GetProfileUseCase> {
  /// Get Profile Use Case Provider
  ///
  /// Handles profile retrieval with business logic validation.
  /// Works with both local and API data sources.
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

String _$getProfileUseCaseHash() => r'431ce544474f8861b3bf4d001c7b80c7d21ad555';

/// Update Profile Use Case Provider
///
/// Handles profile updates with validation and business rules.
/// Works with both local and API data sources.
@ProviderFor(updateProfileUseCase)
const updateProfileUseCaseProvider = UpdateProfileUseCaseProvider._();

/// Update Profile Use Case Provider
///
/// Handles profile updates with validation and business rules.
/// Works with both local and API data sources.
final class UpdateProfileUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateProfileUseCase,
          UpdateProfileUseCase,
          UpdateProfileUseCase
        >
    with $Provider<UpdateProfileUseCase> {
  /// Update Profile Use Case Provider
  ///
  /// Handles profile updates with validation and business rules.
  /// Works with both local and API data sources.
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
    r'4d525ab88fbc7c195b90c2f76e955360dd1acd3b';

/// Initialize Demo Data Provider
///
/// Automatically sets up demo data for development.
/// This provider runs once and ensures demo data exists.
@ProviderFor(initializeDemoData)
const initializeDemoDataProvider = InitializeDemoDataProvider._();

/// Initialize Demo Data Provider
///
/// Automatically sets up demo data for development.
/// This provider runs once and ensures demo data exists.
final class InitializeDemoDataProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Initialize Demo Data Provider
  ///
  /// Automatically sets up demo data for development.
  /// This provider runs once and ensures demo data exists.
  const InitializeDemoDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initializeDemoDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initializeDemoDataHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return initializeDemoData(ref);
  }
}

String _$initializeDemoDataHash() =>
    r'cb701cebf28e4d229a1faeaf4e755a722052d2e6';

/// All Demo Profiles Provider
///
/// Provides all demo profiles for discovery, testing, and UI development.
/// Automatically initializes demo data if needed.
@ProviderFor(allDemoProfiles)
const allDemoProfilesProvider = AllDemoProfilesProvider._();

/// All Demo Profiles Provider
///
/// Provides all demo profiles for discovery, testing, and UI development.
/// Automatically initializes demo data if needed.
final class AllDemoProfilesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Map<String, dynamic>>>,
          List<Map<String, dynamic>>,
          FutureOr<List<Map<String, dynamic>>>
        >
    with
        $FutureModifier<List<Map<String, dynamic>>>,
        $FutureProvider<List<Map<String, dynamic>>> {
  /// All Demo Profiles Provider
  ///
  /// Provides all demo profiles for discovery, testing, and UI development.
  /// Automatically initializes demo data if needed.
  const AllDemoProfilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allDemoProfilesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allDemoProfilesHash();

  @$internal
  @override
  $FutureProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Map<String, dynamic>>> create(Ref ref) {
    return allDemoProfiles(ref);
  }
}

String _$allDemoProfilesHash() => r'f1755f61b4910e2d595fb254411e4bb3db7cf523';

/// Random Demo Profile Provider
///
/// Provides a random demo profile for testing and development.
/// Useful for testing different profile scenarios.
@ProviderFor(randomDemoProfile)
const randomDemoProfileProvider = RandomDemoProfileProvider._();

/// Random Demo Profile Provider
///
/// Provides a random demo profile for testing and development.
/// Useful for testing different profile scenarios.
final class RandomDemoProfileProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>?>,
          Map<String, dynamic>?,
          FutureOr<Map<String, dynamic>?>
        >
    with
        $FutureModifier<Map<String, dynamic>?>,
        $FutureProvider<Map<String, dynamic>?> {
  /// Random Demo Profile Provider
  ///
  /// Provides a random demo profile for testing and development.
  /// Useful for testing different profile scenarios.
  const RandomDemoProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'randomDemoProfileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$randomDemoProfileHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, dynamic>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, dynamic>?> create(Ref ref) {
    return randomDemoProfile(ref);
  }
}

String _$randomDemoProfileHash() => r'4112718abf03c625883d52d3725e696689abbd26';

/// Demo Profiles by Verification Provider
///
/// Provides demo profiles filtered by verification status.
/// Useful for testing different user flows.
@ProviderFor(demoProfilesByVerification)
const demoProfilesByVerificationProvider = DemoProfilesByVerificationFamily._();

/// Demo Profiles by Verification Provider
///
/// Provides demo profiles filtered by verification status.
/// Useful for testing different user flows.
final class DemoProfilesByVerificationProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Map<String, dynamic>>>,
          List<Map<String, dynamic>>,
          FutureOr<List<Map<String, dynamic>>>
        >
    with
        $FutureModifier<List<Map<String, dynamic>>>,
        $FutureProvider<List<Map<String, dynamic>>> {
  /// Demo Profiles by Verification Provider
  ///
  /// Provides demo profiles filtered by verification status.
  /// Useful for testing different user flows.
  const DemoProfilesByVerificationProvider._({
    required DemoProfilesByVerificationFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'demoProfilesByVerificationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$demoProfilesByVerificationHash();

  @override
  String toString() {
    return r'demoProfilesByVerificationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Map<String, dynamic>>> create(Ref ref) {
    final argument = this.argument as bool;
    return demoProfilesByVerification(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DemoProfilesByVerificationProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$demoProfilesByVerificationHash() =>
    r'895aea677aedbaf7c66e471912b56c02276362db';

/// Demo Profiles by Verification Provider
///
/// Provides demo profiles filtered by verification status.
/// Useful for testing different user flows.
final class DemoProfilesByVerificationFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Map<String, dynamic>>>, bool> {
  const DemoProfilesByVerificationFamily._()
    : super(
        retry: null,
        name: r'demoProfilesByVerificationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Demo Profiles by Verification Provider
  ///
  /// Provides demo profiles filtered by verification status.
  /// Useful for testing different user flows.
  DemoProfilesByVerificationProvider call(bool verified) =>
      DemoProfilesByVerificationProvider._(argument: verified, from: this);

  @override
  String toString() => r'demoProfilesByVerificationProvider';
}

/// Premium Demo Profiles Provider
///
/// Provides demo profiles with premium status for testing premium features.
@ProviderFor(premiumDemoProfiles)
const premiumDemoProfilesProvider = PremiumDemoProfilesProvider._();

/// Premium Demo Profiles Provider
///
/// Provides demo profiles with premium status for testing premium features.
final class PremiumDemoProfilesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Map<String, dynamic>>>,
          List<Map<String, dynamic>>,
          FutureOr<List<Map<String, dynamic>>>
        >
    with
        $FutureModifier<List<Map<String, dynamic>>>,
        $FutureProvider<List<Map<String, dynamic>>> {
  /// Premium Demo Profiles Provider
  ///
  /// Provides demo profiles with premium status for testing premium features.
  const PremiumDemoProfilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'premiumDemoProfilesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$premiumDemoProfilesHash();

  @$internal
  @override
  $FutureProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Map<String, dynamic>>> create(Ref ref) {
    return premiumDemoProfiles(ref);
  }
}

String _$premiumDemoProfilesHash() =>
    r'4848758958f5e1a73c8ecaee2778d4e182bb2183';

/// Single Profile Provider
///
/// Provides a complete profile by ID with all related data.
/// Uses GetProfileUseCase for business logic validation.
@ProviderFor(profile)
const profileProvider = ProfileFamily._();

/// Single Profile Provider
///
/// Provides a complete profile by ID with all related data.
/// Uses GetProfileUseCase for business logic validation.
final class ProfileProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProfileData?>,
          ProfileData?,
          FutureOr<ProfileData?>
        >
    with $FutureModifier<ProfileData?>, $FutureProvider<ProfileData?> {
  /// Single Profile Provider
  ///
  /// Provides a complete profile by ID with all related data.
  /// Uses GetProfileUseCase for business logic validation.
  const ProfileProvider._({
    required ProfileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'profileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileHash();

  @override
  String toString() {
    return r'profileProvider'
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
    return profile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileHash() => r'22f309882c313ff85e55249aa0f945fdac4b35ca';

/// Single Profile Provider
///
/// Provides a complete profile by ID with all related data.
/// Uses GetProfileUseCase for business logic validation.
final class ProfileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProfileData?>, String> {
  const ProfileFamily._()
    : super(
        retry: null,
        name: r'profileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Single Profile Provider
  ///
  /// Provides a complete profile by ID with all related data.
  /// Uses GetProfileUseCase for business logic validation.
  ProfileProvider call(String profileId) =>
      ProfileProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileProvider';
}

/// Profile Statistics Provider
///
/// Provides profile statistics for analytics and completeness tracking.
@ProviderFor(profileStatistics)
const profileStatisticsProvider = ProfileStatisticsFamily._();

/// Profile Statistics Provider
///
/// Provides profile statistics for analytics and completeness tracking.
final class ProfileStatisticsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>?>,
          Map<String, dynamic>?,
          FutureOr<Map<String, dynamic>?>
        >
    with
        $FutureModifier<Map<String, dynamic>?>,
        $FutureProvider<Map<String, dynamic>?> {
  /// Profile Statistics Provider
  ///
  /// Provides profile statistics for analytics and completeness tracking.
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
  $FutureProviderElement<Map<String, dynamic>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, dynamic>?> create(Ref ref) {
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

String _$profileStatisticsHash() => r'a9be31fce2d4a939abf6706e06970fa68a0713b6';

/// Profile Statistics Provider
///
/// Provides profile statistics for analytics and completeness tracking.
final class ProfileStatisticsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Map<String, dynamic>?>, String> {
  const ProfileStatisticsFamily._()
    : super(
        retry: null,
        name: r'profileStatisticsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Profile Statistics Provider
  ///
  /// Provides profile statistics for analytics and completeness tracking.
  ProfileStatisticsProvider call(String profileId) =>
      ProfileStatisticsProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileStatisticsProvider';
}

/// All Profiles Provider
///
/// Provides all profiles for discovery and matching.
/// In production, this would be paginated.
@ProviderFor(allProfiles)
const allProfilesProvider = AllProfilesProvider._();

/// All Profiles Provider
///
/// Provides all profiles for discovery and matching.
/// In production, this would be paginated.
final class AllProfilesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProfileEntity>>,
          List<ProfileEntity>,
          FutureOr<List<ProfileEntity>>
        >
    with
        $FutureModifier<List<ProfileEntity>>,
        $FutureProvider<List<ProfileEntity>> {
  /// All Profiles Provider
  ///
  /// Provides all profiles for discovery and matching.
  /// In production, this would be paginated.
  const AllProfilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allProfilesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allProfilesHash();

  @$internal
  @override
  $FutureProviderElement<List<ProfileEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProfileEntity>> create(Ref ref) {
    return allProfiles(ref);
  }
}

String _$allProfilesHash() => r'32d278ca06edecc18a965774dd5a3409afacc9fd';

/// Verified Profiles Provider
///
/// Provides only verified profiles for enhanced matching.
@ProviderFor(verifiedProfiles)
const verifiedProfilesProvider = VerifiedProfilesProvider._();

/// Verified Profiles Provider
///
/// Provides only verified profiles for enhanced matching.
final class VerifiedProfilesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProfileEntity>>,
          List<ProfileEntity>,
          FutureOr<List<ProfileEntity>>
        >
    with
        $FutureModifier<List<ProfileEntity>>,
        $FutureProvider<List<ProfileEntity>> {
  /// Verified Profiles Provider
  ///
  /// Provides only verified profiles for enhanced matching.
  const VerifiedProfilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verifiedProfilesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verifiedProfilesHash();

  @$internal
  @override
  $FutureProviderElement<List<ProfileEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProfileEntity>> create(Ref ref) {
    return verifiedProfiles(ref);
  }
}

String _$verifiedProfilesHash() => r'ac041473dec23bdcb3e9be0afedafbb6d89aae5f';

/// Premium Profiles Provider
///
/// Provides premium profiles for premium feature testing.
@ProviderFor(premiumProfiles)
const premiumProfilesProvider = PremiumProfilesProvider._();

/// Premium Profiles Provider
///
/// Provides premium profiles for premium feature testing.
final class PremiumProfilesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProfileEntity>>,
          List<ProfileEntity>,
          FutureOr<List<ProfileEntity>>
        >
    with
        $FutureModifier<List<ProfileEntity>>,
        $FutureProvider<List<ProfileEntity>> {
  /// Premium Profiles Provider
  ///
  /// Provides premium profiles for premium feature testing.
  const PremiumProfilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'premiumProfilesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$premiumProfilesHash();

  @$internal
  @override
  $FutureProviderElement<List<ProfileEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProfileEntity>> create(Ref ref) {
    return premiumProfiles(ref);
  }
}

String _$premiumProfilesHash() => r'b782eb92775cb0d12cb9310dc4950ea0349a38d5';

/// Profile Prompts Provider
///
/// Provides all prompts for a specific profile.
@ProviderFor(profilePrompts)
const profilePromptsProvider = ProfilePromptsFamily._();

/// Profile Prompts Provider
///
/// Provides all prompts for a specific profile.
final class ProfilePromptsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PromptEntity>>,
          List<PromptEntity>,
          FutureOr<List<PromptEntity>>
        >
    with
        $FutureModifier<List<PromptEntity>>,
        $FutureProvider<List<PromptEntity>> {
  /// Profile Prompts Provider
  ///
  /// Provides all prompts for a specific profile.
  const ProfilePromptsProvider._({
    required ProfilePromptsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'profilePromptsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profilePromptsHash();

  @override
  String toString() {
    return r'profilePromptsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<PromptEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PromptEntity>> create(Ref ref) {
    final argument = this.argument as String;
    return profilePrompts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfilePromptsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profilePromptsHash() => r'd16bb185898948a081e9dba66b97dbfd95195319';

/// Profile Prompts Provider
///
/// Provides all prompts for a specific profile.
final class ProfilePromptsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<PromptEntity>>, String> {
  const ProfilePromptsFamily._()
    : super(
        retry: null,
        name: r'profilePromptsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Profile Prompts Provider
  ///
  /// Provides all prompts for a specific profile.
  ProfilePromptsProvider call(String profileId) =>
      ProfilePromptsProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profilePromptsProvider';
}

/// Profile Active Poll Provider
///
/// Provides the active poll for a specific profile.
@ProviderFor(profileActivePoll)
const profileActivePollProvider = ProfileActivePollFamily._();

/// Profile Active Poll Provider
///
/// Provides the active poll for a specific profile.
final class ProfileActivePollProvider
    extends
        $FunctionalProvider<
          AsyncValue<PollEntity?>,
          PollEntity?,
          FutureOr<PollEntity?>
        >
    with $FutureModifier<PollEntity?>, $FutureProvider<PollEntity?> {
  /// Profile Active Poll Provider
  ///
  /// Provides the active poll for a specific profile.
  const ProfileActivePollProvider._({
    required ProfileActivePollFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'profileActivePollProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileActivePollHash();

  @override
  String toString() {
    return r'profileActivePollProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PollEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PollEntity?> create(Ref ref) {
    final argument = this.argument as String;
    return profileActivePoll(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileActivePollProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileActivePollHash() => r'9ca0e0faecd03d3197313e71e05ba77f9f5704e0';

/// Profile Active Poll Provider
///
/// Provides the active poll for a specific profile.
final class ProfileActivePollFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PollEntity?>, String> {
  const ProfileActivePollFamily._()
    : super(
        retry: null,
        name: r'profileActivePollProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Profile Active Poll Provider
  ///
  /// Provides the active poll for a specific profile.
  ProfileActivePollProvider call(String profileId) =>
      ProfileActivePollProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileActivePollProvider';
}

/// Profile Media Provider
///
/// Provides all media for a specific profile.
@ProviderFor(profileMedia)
const profileMediaProvider = ProfileMediaFamily._();

/// Profile Media Provider
///
/// Provides all media for a specific profile.
final class ProfileMediaProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MediaEntity>>,
          List<MediaEntity>,
          FutureOr<List<MediaEntity>>
        >
    with
        $FutureModifier<List<MediaEntity>>,
        $FutureProvider<List<MediaEntity>> {
  /// Profile Media Provider
  ///
  /// Provides all media for a specific profile.
  const ProfileMediaProvider._({
    required ProfileMediaFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'profileMediaProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileMediaHash();

  @override
  String toString() {
    return r'profileMediaProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<MediaEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MediaEntity>> create(Ref ref) {
    final argument = this.argument as String;
    return profileMedia(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileMediaProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileMediaHash() => r'af9e40654155b0285fdaa8bc6f4a28cd9389de3e';

/// Profile Media Provider
///
/// Provides all media for a specific profile.
final class ProfileMediaFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<MediaEntity>>, String> {
  const ProfileMediaFamily._()
    : super(
        retry: null,
        name: r'profileMediaProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Profile Media Provider
  ///
  /// Provides all media for a specific profile.
  ProfileMediaProvider call(String profileId) =>
      ProfileMediaProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileMediaProvider';
}

/// Profile Media by Type Provider
///
/// Provides media filtered by type for a specific profile.
@ProviderFor(profileMediaByType)
const profileMediaByTypeProvider = ProfileMediaByTypeFamily._();

/// Profile Media by Type Provider
///
/// Provides media filtered by type for a specific profile.
final class ProfileMediaByTypeProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MediaEntity>>,
          List<MediaEntity>,
          FutureOr<List<MediaEntity>>
        >
    with
        $FutureModifier<List<MediaEntity>>,
        $FutureProvider<List<MediaEntity>> {
  /// Profile Media by Type Provider
  ///
  /// Provides media filtered by type for a specific profile.
  const ProfileMediaByTypeProvider._({
    required ProfileMediaByTypeFamily super.from,
    required (String, MediaType) super.argument,
  }) : super(
         retry: null,
         name: r'profileMediaByTypeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileMediaByTypeHash();

  @override
  String toString() {
    return r'profileMediaByTypeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<MediaEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MediaEntity>> create(Ref ref) {
    final argument = this.argument as (String, MediaType);
    return profileMediaByType(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileMediaByTypeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileMediaByTypeHash() =>
    r'531296e63e210c93642ae6addc5d2a966a1dbc89';

/// Profile Media by Type Provider
///
/// Provides media filtered by type for a specific profile.
final class ProfileMediaByTypeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<MediaEntity>>,
          (String, MediaType)
        > {
  const ProfileMediaByTypeFamily._()
    : super(
        retry: null,
        name: r'profileMediaByTypeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Profile Media by Type Provider
  ///
  /// Provides media filtered by type for a specific profile.
  ProfileMediaByTypeProvider call(String profileId, MediaType mediaType) =>
      ProfileMediaByTypeProvider._(
        argument: (profileId, mediaType),
        from: this,
      );

  @override
  String toString() => r'profileMediaByTypeProvider';
}

/// Profile Interests Provider
///
/// Provides all interests for a specific profile.
@ProviderFor(profileInterests)
const profileInterestsProvider = ProfileInterestsFamily._();

/// Profile Interests Provider
///
/// Provides all interests for a specific profile.
final class ProfileInterestsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<InterestEntity>>,
          List<InterestEntity>,
          FutureOr<List<InterestEntity>>
        >
    with
        $FutureModifier<List<InterestEntity>>,
        $FutureProvider<List<InterestEntity>> {
  /// Profile Interests Provider
  ///
  /// Provides all interests for a specific profile.
  const ProfileInterestsProvider._({
    required ProfileInterestsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'profileInterestsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileInterestsHash();

  @override
  String toString() {
    return r'profileInterestsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<InterestEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<InterestEntity>> create(Ref ref) {
    final argument = this.argument as String;
    return profileInterests(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileInterestsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileInterestsHash() => r'bd8477372fa18c568e8d7648b7d388759661e317';

/// Profile Interests Provider
///
/// Provides all interests for a specific profile.
final class ProfileInterestsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<InterestEntity>>, String> {
  const ProfileInterestsFamily._()
    : super(
        retry: null,
        name: r'profileInterestsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Profile Interests Provider
  ///
  /// Provides all interests for a specific profile.
  ProfileInterestsProvider call(String profileId) =>
      ProfileInterestsProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileInterestsProvider';
}

/// Profile Visible Badges Provider
///
/// Provides visible badges for a specific profile.
@ProviderFor(profileVisibleBadges)
const profileVisibleBadgesProvider = ProfileVisibleBadgesFamily._();

/// Profile Visible Badges Provider
///
/// Provides visible badges for a specific profile.
final class ProfileVisibleBadgesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BadgeEntity>>,
          List<BadgeEntity>,
          FutureOr<List<BadgeEntity>>
        >
    with
        $FutureModifier<List<BadgeEntity>>,
        $FutureProvider<List<BadgeEntity>> {
  /// Profile Visible Badges Provider
  ///
  /// Provides visible badges for a specific profile.
  const ProfileVisibleBadgesProvider._({
    required ProfileVisibleBadgesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'profileVisibleBadgesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileVisibleBadgesHash();

  @override
  String toString() {
    return r'profileVisibleBadgesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<BadgeEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BadgeEntity>> create(Ref ref) {
    final argument = this.argument as String;
    return profileVisibleBadges(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileVisibleBadgesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileVisibleBadgesHash() =>
    r'e6a522b52f751b943d7ef30d6ec8193748c9e5c9';

/// Profile Visible Badges Provider
///
/// Provides visible badges for a specific profile.
final class ProfileVisibleBadgesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<BadgeEntity>>, String> {
  const ProfileVisibleBadgesFamily._()
    : super(
        retry: null,
        name: r'profileVisibleBadgesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Profile Visible Badges Provider
  ///
  /// Provides visible badges for a specific profile.
  ProfileVisibleBadgesProvider call(String profileId) =>
      ProfileVisibleBadgesProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileVisibleBadgesProvider';
}

/// Demo Data Health Check Provider
///
/// Provides health check status for demo data.
/// Useful for debugging and ensuring data integrity.
@ProviderFor(demoDataHealthCheck)
const demoDataHealthCheckProvider = DemoDataHealthCheckProvider._();

/// Demo Data Health Check Provider
///
/// Provides health check status for demo data.
/// Useful for debugging and ensuring data integrity.
final class DemoDataHealthCheckProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Demo Data Health Check Provider
  ///
  /// Provides health check status for demo data.
  /// Useful for debugging and ensuring data integrity.
  const DemoDataHealthCheckProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'demoDataHealthCheckProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$demoDataHealthCheckHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return demoDataHealthCheck(ref);
  }
}

String _$demoDataHealthCheckHash() =>
    r'394f23a2674bbe87dd769a9507e429e64b520707';

/// Database Statistics Provider
///
/// Provides current database statistics for debugging and monitoring.
@ProviderFor(databaseStatistics)
const databaseStatisticsProvider = DatabaseStatisticsProvider._();

/// Database Statistics Provider
///
/// Provides current database statistics for debugging and monitoring.
final class DatabaseStatisticsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, int>>,
          Map<String, int>,
          FutureOr<Map<String, int>>
        >
    with $FutureModifier<Map<String, int>>, $FutureProvider<Map<String, int>> {
  /// Database Statistics Provider
  ///
  /// Provides current database statistics for debugging and monitoring.
  const DatabaseStatisticsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseStatisticsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseStatisticsHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, int>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, int>> create(Ref ref) {
    return databaseStatistics(ref);
  }
}

String _$databaseStatisticsHash() =>
    r'848efa196acb576e8e1154b68c5402621cedc1d5';

/// Popular Interests Provider
///
/// Provides popular interests across all profiles for suggestions.
@ProviderFor(popularInterests)
const popularInterestsProvider = PopularInterestsProvider._();

/// Popular Interests Provider
///
/// Provides popular interests across all profiles for suggestions.
final class PopularInterestsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  /// Popular Interests Provider
  ///
  /// Provides popular interests across all profiles for suggestions.
  const PopularInterestsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'popularInterestsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$popularInterestsHash();

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    return popularInterests(ref);
  }
}

String _$popularInterestsHash() => r'f13d38a95ca3100ca2db647908e3fe05c7f52f72';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
