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
    r'5385c3a961d912dd0be37fd7709d1f73c17b2b15';

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

String _$profileRepositoryHash() => r'8793023ff6a77c56daeea0bbac41581b6ebab5a6';

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

String _$demoDataManagerHash() => r'b7224ebd3ba8f7847e37384f34056c70dc5f8d8e';

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

String _$getProfileUseCaseHash() => r'3dc53432c8b476e9520cb695693e9f15b1dd0bed';

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
    r'23b9454718c5abd5c4c7aadf6c402a4285d2d94a';

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
    r'0316946f637df1f350ba4af22a4c7ea0645fb170';

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

String _$allDemoProfilesHash() => r'0dda12acd8e35173f6425158cfa99fbe31974994';

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

String _$randomDemoProfileHash() => r'6660809887e7e2c1a1b805d8db32d2265c7e38a2';

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
    r'c9fa79cea8caefafec262345261e0b7edb4a725f';

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
    r'e1a927b3e3b91abd3904e90c19b130d3b74245a3';

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

String _$profileHash() => r'f9e27f0dbfe6422bda8f067f288f4edb7e6bcd60';

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

String _$profileStatisticsHash() => r'd5f01ffad09803764c99cd44f2eec94d00f2b02c';

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

String _$allProfilesHash() => r'7e4a128723f6e6523b000324875db5efbade4b0c';

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

String _$verifiedProfilesHash() => r'96b7a84ffce4fa0cff9fc67d320bf36f76e98077';

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

String _$premiumProfilesHash() => r'c8089d4627fae972f599de9c1c4f7f31d2010936';

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

String _$profilePromptsHash() => r'875c88d97af0c9c71202adaabd6d6f0b71a30cd0';

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

String _$profileActivePollHash() => r'd7edfa6bd1ba744a51c84b4308d135de0cbee632';

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

String _$profileMediaHash() => r'5fbad104e8ec1f9099d3d29b686db4dc17d2c0ae';

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
    r'9401c9be7a09c0c1e955fe5b14d4b7a0a8eb486e';

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

String _$profileInterestsHash() => r'90b472c3fa0b4f09aa9bcb540833cacd73ede647';

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
    r'b13943b50e919ab3914b02fe0010e0c3d8b456d8';

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
    r'ca3fc1dde035474ddd5da95efc7c10310a1cd263';

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
    r'3b142744a237f8044cf42c9a144583c48744fe14';

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

String _$popularInterestsHash() => r'e6de29e64063020ca3170d1d7e0aa0705cb3090a';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
