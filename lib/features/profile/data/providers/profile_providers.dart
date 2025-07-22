import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/database/database_provider.dart';
import '../../data/datasources/profile_local_datasource.dart';
import '../../data/mock_data/demo_data_manager.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/entities/badge_entity.dart';
import '../../domain/entities/interest_entity.dart';
import '../../domain/entities/media_entity.dart';
import '../../domain/entities/poll_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/entities/prompt_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';

// This will generate providers automatically when you run build_runner
part 'profile_providers.g.dart';

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
@riverpod
ProfileLocalDatasource profileLocalDatasource(Ref ref) {
  final databaseHelper = ref.watch(databaseHelperProvider);
  return ProfileLocalDatasource(databaseHelper);
}

/// Profile Repository Provider
///
/// **🎯 KEY PROVIDER FOR BACKEND SWAP**
/// This is where you'll change from local to API implementation.
///
/// Current: Uses ProfileRepositoryImpl + ProfileLocalDatasource (SQLite)
/// Production: Use ProfileRepositoryImpl + ProfileApiDatasource (HTTP)
@riverpod
ProfileRepository profileRepository(Ref ref) {
  final datasource = ref.watch(profileLocalDatasourceProvider);
  return ProfileRepositoryImpl(datasource);
}

/// Demo Data Manager Provider
///
/// Manages demo data lifecycle for development and testing.
/// Will be removed in production.
@riverpod
DemoDataManager demoDataManager(Ref ref) {
  final datasource = ref.watch(profileLocalDatasourceProvider);
  return DemoDataManager(datasource);
}

// ============================================================================
// 🎯 USE CASE PROVIDERS (BUSINESS LOGIC)
// ============================================================================

/// Get Profile Use Case Provider
///
/// Handles profile retrieval with business logic validation.
/// Works with both local and API data sources.
@riverpod
GetProfileUseCase getProfileUseCase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return GetProfileUseCase(repository);
}

/// Update Profile Use Case Provider
///
/// Handles profile updates with validation and business rules.
/// Works with both local and API data sources.
@riverpod
UpdateProfileUseCase updateProfileUseCase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return UpdateProfileUseCase(repository);
}

// ============================================================================
// 🎭 DEMO DATA PROVIDERS (DEVELOPMENT ONLY)
// ============================================================================

/// Initialize Demo Data Provider
///
/// Automatically sets up demo data for development.
/// This provider runs once and ensures demo data exists.
@riverpod
Future<bool> initializeDemoData(Ref ref) async {
  final manager = ref.watch(demoDataManagerProvider);
  final result = await manager.initializeDemoData();
  return result.success;
}

/// All Demo Profiles Provider
///
/// Provides all demo profiles for discovery, testing, and UI development.
/// Automatically initializes demo data if needed.
@riverpod
Future<List<Map<String, dynamic>>> allDemoProfiles(Ref ref) async {
  // Ensure demo data is initialized
  await ref.watch(initializeDemoDataProvider.future);

  final manager = ref.watch(demoDataManagerProvider);
  return await manager.getAllProfiles();
}

/// Random Demo Profile Provider
///
/// Provides a random demo profile for testing and development.
/// Useful for testing different profile scenarios.
@riverpod
Future<Map<String, dynamic>?> randomDemoProfile(Ref ref) async {
  // Ensure demo data is initialized
  await ref.watch(initializeDemoDataProvider.future);

  final manager = ref.watch(demoDataManagerProvider);
  return await manager.getRandomProfile();
}

/// Demo Profiles by Verification Provider
///
/// Provides demo profiles filtered by verification status.
/// Useful for testing different user flows.
@riverpod
Future<List<Map<String, dynamic>>> demoProfilesByVerification(
  Ref ref,
  bool verified,
) async {
  // Ensure demo data is initialized
  await ref.watch(initializeDemoDataProvider.future);

  final manager = ref.watch(demoDataManagerProvider);
  return await manager.getProfilesByVerification(verified: verified);
}

/// Premium Demo Profiles Provider
///
/// Provides demo profiles with premium status for testing premium features.
@riverpod
Future<List<Map<String, dynamic>>> premiumDemoProfiles(Ref ref) async {
  // Ensure demo data is initialized
  await ref.watch(initializeDemoDataProvider.future);

  final manager = ref.watch(demoDataManagerProvider);
  return await manager.getPremiumProfiles();
}

// ============================================================================
// 🔍 PROFILE QUERY PROVIDERS
// ============================================================================

/// Single Profile Provider
///
/// Provides a complete profile by ID with all related data.
/// Uses GetProfileUseCase for business logic validation.
@riverpod
Future<ProfileData?> profile(Ref ref, String profileId) async {
  final useCase = ref.watch(getProfileUseCaseProvider);
  final result = await useCase.execute(profileId);

  return result;
}

/// Profile Statistics Provider
///
/// Provides profile statistics for analytics and completeness tracking.
@riverpod
Future<Map<String, dynamic>?> profileStatistics(
  Ref ref,
  String profileId,
) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    return await repository.getProfileStatistics(profileId);
  } catch (e) {
    print('Error getting profile statistics for $profileId: $e');
    return null;
  }
}

/// All Profiles Provider
///
/// Provides all profiles for discovery and matching.
/// In production, this would be paginated.
@riverpod
Future<List<ProfileEntity>> allProfiles(Ref ref) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    return await repository.getAllProfiles();
  } catch (e) {
    print('Error getting all profiles: $e');
    return [];
  }
}

/// Verified Profiles Provider
///
/// Provides only verified profiles for enhanced matching.
@riverpod
Future<List<ProfileEntity>> verifiedProfiles(Ref ref) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    final allProfiles = await repository.getAllProfiles();
    return allProfiles.where((p) => p.photoVerification).toList();
  } catch (e) {
    print('Error getting verified profiles: $e');
    return [];
  }
}

/// Premium Profiles Provider
///
/// Provides premium profiles for premium feature testing.
@riverpod
Future<List<ProfileEntity>> premiumProfiles(Ref ref) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    final allProfiles = await repository.getAllProfiles();
    return allProfiles.where((p) => p.premium != null).toList();
  } catch (e) {
    print('Error getting premium profiles: $e');
    return [];
  }
}

// ============================================================================
// 📊 PROFILE CONTENT PROVIDERS
// ============================================================================

/// Profile Prompts Provider
///
/// Provides all prompts for a specific profile.
@riverpod
Future<List<PromptEntity>> profilePrompts(Ref ref, String profileId) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    return await repository.getPrompts(profileId);
  } catch (e) {
    print('Error getting prompts for profile $profileId: $e');
    return [];
  }
}

/// Profile Active Poll Provider
///
/// Provides the active poll for a specific profile.
@riverpod
Future<PollEntity?> profileActivePoll(Ref ref, String profileId) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    return await repository.getActivePoll(profileId);
  } catch (e) {
    print('Error getting active poll for profile $profileId: $e');
    return null;
  }
}

/// Profile Media Provider
///
/// Provides all media for a specific profile.
@riverpod
Future<List<MediaEntity>> profileMedia(Ref ref, String profileId) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    return await repository.getMedia(profileId);
  } catch (e) {
    print('Error getting media for profile $profileId: $e');
    return [];
  }
}

/// Profile Media by Type Provider
///
/// Provides media filtered by type for a specific profile.
@riverpod
Future<List<MediaEntity>> profileMediaByType(
  Ref ref,
  String profileId,
  MediaType mediaType,
) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    return await repository.getMediaByType(profileId, mediaType);
  } catch (e) {
    print('Error getting $mediaType media for profile $profileId: $e');
    return [];
  }
}

/// Profile Interests Provider
///
/// Provides all interests for a specific profile.
@riverpod
Future<List<InterestEntity>> profileInterests(Ref ref, String profileId) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    return await repository.getInterests(profileId);
  } catch (e) {
    print('Error getting interests for profile $profileId: $e');
    return [];
  }
}

/// Profile Visible Badges Provider
///
/// Provides visible badges for a specific profile.
@riverpod
Future<List<BadgeEntity>> profileVisibleBadges(
  Ref ref,
  String profileId,
) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    return await repository.getVisibleBadges(profileId);
  } catch (e) {
    print('Error getting visible badges for profile $profileId: $e');
    return [];
  }
}

// ============================================================================
// 🧪 DEVELOPMENT UTILITIES
// ============================================================================

/// Demo Data Health Check Provider
///
/// Provides health check status for demo data.
/// Useful for debugging and ensuring data integrity.
@riverpod
Future<bool> demoDataHealthCheck(Ref ref) async {
  final manager = ref.watch(demoDataManagerProvider);
  final result = await manager.performHealthCheck();
  return result.success;
}

/// Database Statistics Provider
///
/// Provides current database statistics for debugging and monitoring.
@riverpod
Future<Map<String, int>> databaseStatistics(Ref ref) async {
  final manager = ref.watch(demoDataManagerProvider);
  return await manager.getStats();
}

/// Popular Interests Provider
///
/// Provides popular interests across all profiles for suggestions.
@riverpod
Future<List<String>> popularInterests(Ref ref) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    return await repository.getPopularInterests();
  } catch (e) {
    print('Error getting popular interests: $e');
    return [];
  }
}

// ============================================================================
// 🎯 BACKEND SWAP UTILITIES
// ============================================================================

/// API Ready Repository Provider (Future Implementation)
///
/// This is where you'll implement the API version for production.
/// Currently commented out - implement when backend is ready.
/*
@riverpod  
ProfileRepository profileApiRepository(ProfileApiRepositoryRef ref) {
  final httpClient = ref.watch(httpClientProvider);
  final apiDatasource = ProfileApiDatasource(httpClient);
  return ProfileRepositoryImpl(apiDatasource);
}

// To swap to API in production, just change profileRepository provider:
// return ref.watch(profileApiRepositoryProvider);
*/

/// Environment-based Repository Provider (Future Implementation)
///
/// This provider will automatically choose local or API based on environment.
/// Currently uses local for all environments.
/*
@riverpod
ProfileRepository environmentRepository(EnvironmentRepositoryRef ref) {
  final environment = ref.watch(environmentProvider);
  
  switch (environment) {
    case Environment.development:
    case Environment.testing:
      return ref.watch(profileRepositoryProvider); // Local SQLite
    case Environment.production:
      return ref.watch(profileApiRepositoryProvider); // API calls
  }
}
*/

// ============================================================================
// 📝 PROVIDER DOCUMENTATION
// ============================================================================

/// **🎯 Backend Swap Instructions:**
/// 
/// **Current Setup (Development):**
/// ```dart
/// profileRepository → ProfileRepositoryImpl → ProfileLocalDatasource → SQLite
/// ```
/// 
/// **Production Setup (Future):**
/// ```dart
/// profileRepository → ProfileRepositoryImpl → ProfileApiDatasource → HTTP API
/// ```
/// 
/// **To Swap Backends:**
/// 1. Create `ProfileApiDatasource` with HTTP client
/// 2. Update `profileRepository` provider to use API datasource
/// 3. All use cases and UI automatically work with API
/// 4. Remove demo data providers and SQLite dependencies
/// 
/// **Zero changes needed in:**
/// - Use cases (business logic)
/// - UI widgets and screens
/// - Entity models
/// - Repository interface
/// 
/// **Key Providers for Production:**
/// - `profileRepository` - Change this to swap backends
/// - `getProfileUseCase` - Works with any repository implementation
/// - `updateProfileUseCase` - Works with any repository implementation
/// 
/// **Development-Only Providers (Remove in Production):**
/// - `demoDataManager`
/// - `initializeDemoData`
/// - All `*DemoProfile*` providers
/// - `demoDataHealthCheck`