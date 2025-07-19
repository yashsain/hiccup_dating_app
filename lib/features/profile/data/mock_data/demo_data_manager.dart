import '../datasources/profile_local_datasource.dart';
import 'database_seeder.dart';
import 'sample_profiles.dart';

/// 🎛️ Demo Data Manager - Simple Interface for Demo Data Lifecycle (2025)
///
/// This manager provides a clean, simple interface for managing demo data
/// throughout the development process. It handles initialization, refresh,
/// and provides easy access to demo profiles for testing.
///
/// Key Features:
/// - One-command demo data setup
/// - Easy refresh and reset capabilities
/// - Health checks and validation
/// - Profile access for UI testing
/// - Development utilities
/// - Progress tracking and logging
///
/// Perfect for:
/// - App startup demo data initialization
/// - Development workflow integration
/// - Testing different data scenarios
/// - Demo presentations
/// - Easy backend swap preparation
///
/// Usage:
/// ```dart
/// final manager = DemoDataManager(datasource);
/// await manager.initializeDemoData();
/// final profiles = await manager.getAllProfiles();
/// ```
class DemoDataManager {
  final ProfileLocalDatasource _datasource;
  late final DatabaseSeeder _seeder;

  bool _isInitialized = false;

  DemoDataManager(this._datasource) {
    _seeder = DatabaseSeeder(_datasource);
  }

  /// Whether demo data has been initialized
  bool get isInitialized => _isInitialized;

  // ============================================================================
  // 🚀 INITIALIZATION & SETUP
  // ============================================================================

  /// Initialize demo data (one-time setup for development)
  Future<InitializationResult> initializeDemoData({
    bool forceRefresh = false,
  }) async {
    print('🚀 Initializing demo data...');
    final startTime = DateTime.now();

    try {
      // Check if data already exists
      if (!forceRefresh) {
        final existingStats = await _datasource.getDatabaseStats();
        final hasData = existingStats.values.any((count) => count > 0);

        if (hasData) {
          print('📊 Demo data already exists, validating...');
          final validation = await _seeder.validateSeededData();

          if (validation.success) {
            _isInitialized = true;
            final duration = DateTime.now().difference(startTime);

            print('✅ Demo data validation passed');
            return InitializationResult(
              success: true,
              duration: duration,
              action: 'validated',
              stats: existingStats,
              message: 'Demo data already exists and is valid',
            );
          } else {
            print('⚠️ Existing data validation failed, refreshing...');
            forceRefresh = true;
          }
        }
      }

      // Seed fresh demo data
      print('🌱 Seeding fresh demo data...');
      final seedResult = await _seeder.seedAllData(clearExisting: forceRefresh);

      if (!seedResult.success) {
        throw DemoDataException('Seeding failed: ${seedResult.message}');
      }

      // Validate seeded data
      print('🔍 Validating seeded data...');
      final validation = await _seeder.validateSeededData();

      if (!validation.success) {
        throw DemoDataException('Validation failed: ${validation.message}');
      }

      _isInitialized = true;
      final duration = DateTime.now().difference(startTime);
      final stats = await _datasource.getDatabaseStats();

      print('🎉 Demo data initialization completed successfully!');
      print('📊 Total entities: ${seedResult.totalEntities}');
      print('⏱️ Duration: ${duration.inMilliseconds}ms');

      return InitializationResult(
        success: true,
        duration: duration,
        action: forceRefresh ? 'refreshed' : 'seeded',
        stats: stats,
        totalEntities: seedResult.totalEntities,
        message: 'Demo data initialized successfully',
      );
    } catch (e) {
      final duration = DateTime.now().difference(startTime);
      print('❌ Demo data initialization failed: $e');

      return InitializationResult(
        success: false,
        duration: duration,
        action: 'failed',
        message: 'Initialization failed: ${e.toString()}',
      );
    }
  }

  /// Quick setup for development (ensures demo data exists)
  Future<bool> ensureDemoData() async {
    if (_isInitialized) return true;

    final result = await initializeDemoData();
    return result.success;
  }

  /// Refresh all demo data (clear and re-seed)
  Future<InitializationResult> refreshDemoData() async {
    print('🔄 Refreshing demo data...');
    _isInitialized = false;
    return await initializeDemoData(forceRefresh: true);
  }

  /// Reset to clean state (clear all data)
  Future<void> resetDatabase() async {
    print('🧹 Resetting database to clean state...');
    await _seeder.clearAllData();
    _isInitialized = false;
    print('✅ Database reset completed');
  }

  // ============================================================================
  // 📊 DATA ACCESS & RETRIEVAL
  // ============================================================================

  /// Get all demo profiles for UI testing
  Future<List<Map<String, dynamic>>> getAllProfiles() async {
    await ensureDemoData();
    return await _seeder.getDemoProfilesForUI();
  }

  /// Get specific profile by ID
  Future<Map<String, dynamic>?> getProfile(String profileId) async {
    await ensureDemoData();
    return await _datasource.getCompleteProfile(profileId);
  }

  /// Get profile IDs for iteration/testing
  Future<List<String>> getProfileIds() async {
    await ensureDemoData();
    return SampleProfiles.allProfiles.map((p) => p.id).toList();
  }

  /// Get random profile for testing
  Future<Map<String, dynamic>?> getRandomProfile() async {
    await ensureDemoData();
    final randomProfile = SampleProfiles.getRandomProfile();
    return await getProfile(randomProfile.id);
  }

  /// Get profiles for matching testing (profiles with common interests)
  Future<List<Map<String, dynamic>>> getMatchingProfiles(
    String profileId,
  ) async {
    await ensureDemoData();

    final commonProfiles = SampleProfiles.getProfilesWithCommonInterests(
      profileId,
    );
    final profiles = <Map<String, dynamic>>[];

    for (final profile in commonProfiles) {
      final data = await getProfile(profile.id);
      if (data != null) {
        profiles.add(data);
      }
    }

    return profiles;
  }

  /// Get profiles by verification status (for testing different flows)
  Future<List<Map<String, dynamic>>> getProfilesByVerification({
    bool verified = true,
  }) async {
    await ensureDemoData();

    final filteredProfiles = SampleProfiles.allProfiles
        .where((p) => p.photoVerification == verified)
        .toList();

    final profiles = <Map<String, dynamic>>[];
    for (final profile in filteredProfiles) {
      final data = await getProfile(profile.id);
      if (data != null) {
        profiles.add(data);
      }
    }

    return profiles;
  }

  /// Get premium profiles (for testing premium features)
  Future<List<Map<String, dynamic>>> getPremiumProfiles() async {
    await ensureDemoData();

    final premiumProfiles = SampleProfiles.allProfiles
        .where((p) => p.premium != null)
        .toList();

    final profiles = <Map<String, dynamic>>[];
    for (final profile in premiumProfiles) {
      final data = await getProfile(profile.id);
      if (data != null) {
        profiles.add(data);
      }
    }

    return profiles;
  }

  // ============================================================================
  // 🔍 HEALTH CHECKS & VALIDATION
  // ============================================================================

  /// Perform health check on demo data
  Future<HealthCheckResult> performHealthCheck() async {
    print('🔍 Performing demo data health check...');

    try {
      // Check if data exists
      final stats = await _datasource.getDatabaseStats();
      final hasData = stats.values.any((count) => count > 0);

      if (!hasData) {
        return HealthCheckResult(
          success: false,
          message: 'No data found in database',
          suggestion: 'Run initializeDemoData() to set up demo data',
        );
      }

      // Validate data integrity
      final validation = await _seeder.validateSeededData();

      if (!validation.success) {
        return HealthCheckResult(
          success: false,
          message: 'Data validation failed',
          details: validation.issues,
          suggestion: 'Run refreshDemoData() to fix data issues',
        );
      }

      // Check profile accessibility
      final profileIds = SampleProfiles.allProfiles.map((p) => p.id).toList();
      final accessibleProfiles = <String>[];

      for (final id in profileIds) {
        if (await _seeder.verifyProfile(id)) {
          accessibleProfiles.add(id);
        }
      }

      if (accessibleProfiles.length != profileIds.length) {
        return HealthCheckResult(
          success: false,
          message: 'Some profiles are not accessible',
          details: [
            'Accessible: ${accessibleProfiles.length}/${profileIds.length}',
          ],
          suggestion: 'Run refreshDemoData() to restore missing profiles',
        );
      }

      print('✅ Health check passed');
      return HealthCheckResult(
        success: true,
        message: 'All demo data health checks passed',
        stats: stats,
      );
    } catch (e) {
      print('❌ Health check failed: $e');
      return HealthCheckResult(
        success: false,
        message: 'Health check failed: ${e.toString()}',
        suggestion: 'Check database connection and try refreshDemoData()',
      );
    }
  }

  /// Get current database statistics
  Future<Map<String, int>> getStats() async {
    return await _datasource.getDatabaseStats();
  }

  /// Get detailed demo data information
  Future<DemoDataInfo> getDemoDataInfo() async {
    await ensureDemoData();

    final stats = await getStats();
    final expectedStats = SampleProfiles.demoDataStats;

    return DemoDataInfo(
      isInitialized: _isInitialized,
      currentStats: stats,
      expectedStats: expectedStats,
      profileCount: SampleProfiles.allProfiles.length,
      verifiedProfiles: SampleProfiles.allProfiles
          .where((p) => p.photoVerification)
          .length,
      premiumProfiles: SampleProfiles.allProfiles
          .where((p) => p.premium != null)
          .length,
      totalInterests: SampleProfiles.allInterests.length,
      totalMedia: SampleProfiles.allMedia.length,
    );
  }

  // ============================================================================
  // 🧪 DEVELOPMENT UTILITIES
  // ============================================================================

  /// Create test profile for development
  Future<String> createTestProfile({String? name, int? age}) async {
    final result = await _seeder.seedTestProfile(name: name, age: age);
    if (result.success) {
      final id =
          name?.toLowerCase().replaceAll(' ', '_') ??
          'test_${DateTime.now().millisecondsSinceEpoch}';
      print('✅ Test profile created: $id');
      return id;
    } else {
      throw DemoDataException(
        'Failed to create test profile: ${result.message}',
      );
    }
  }

  /// Log current demo data status
  void logStatus() {
    print('📊 Demo Data Manager Status:');
    print('  Initialized: $_isInitialized');
    print('  Expected Profiles: ${SampleProfiles.allProfiles.length}');
    print(
      '  Total Expected Entities: ${SampleProfiles.demoDataStats.values.fold(0, (a, b) => a + b)}',
    );
  }

  /// Quick demo data summary for debugging
  Future<void> printSummary() async {
    print('\n📊 DEMO DATA SUMMARY');
    print('=' * 50);

    final info = await getDemoDataInfo();

    print(
      'Status: ${info.isInitialized ? "✅ Initialized" : "❌ Not Initialized"}',
    );
    print(
      'Profiles: ${info.profileCount} (${info.verifiedProfiles} verified, ${info.premiumProfiles} premium)',
    );
    print('Total Media: ${info.totalMedia}');
    print('Total Interests: ${info.totalInterests}');

    print('\nEntity Counts:');
    for (final entry in info.currentStats.entries) {
      final expected = info.expectedStats[entry.key] ?? 0;
      final status = entry.value == expected ? '✅' : '⚠️';
      print(
        '  $status ${entry.key}: ${entry.value}${expected > 0 ? '/$expected' : ''}',
      );
    }

    print('=' * 50);
  }
}

// ============================================================================
// 📊 RESULT CLASSES
// ============================================================================

/// 🚀 Initialization Result - Results from demo data initialization
class InitializationResult {
  final bool success;
  final Duration duration;
  final String action;
  final Map<String, int>? stats;
  final int? totalEntities;
  final String message;

  const InitializationResult({
    required this.success,
    required this.duration,
    required this.action,
    this.stats,
    this.totalEntities,
    required this.message,
  });

  @override
  String toString() {
    return 'InitializationResult(success: $success, action: $action, '
        'duration: ${duration.inMilliseconds}ms, entities: $totalEntities, message: $message)';
  }
}

/// 🔍 Health Check Result - Results from health check operations
class HealthCheckResult {
  final bool success;
  final String message;
  final List<String>? details;
  final String? suggestion;
  final Map<String, int>? stats;

  const HealthCheckResult({
    required this.success,
    required this.message,
    this.details,
    this.suggestion,
    this.stats,
  });

  @override
  String toString() {
    return 'HealthCheckResult(success: $success, message: $message${suggestion != null ? ', suggestion: $suggestion' : ''})';
  }
}

/// 📊 Demo Data Info - Comprehensive information about demo data state
class DemoDataInfo {
  final bool isInitialized;
  final Map<String, int> currentStats;
  final Map<String, int> expectedStats;
  final int profileCount;
  final int verifiedProfiles;
  final int premiumProfiles;
  final int totalInterests;
  final int totalMedia;

  const DemoDataInfo({
    required this.isInitialized,
    required this.currentStats,
    required this.expectedStats,
    required this.profileCount,
    required this.verifiedProfiles,
    required this.premiumProfiles,
    required this.totalInterests,
    required this.totalMedia,
  });

  /// Check if current stats match expected stats
  bool get isDataComplete {
    for (final entry in expectedStats.entries) {
      if (currentStats[entry.key] != entry.value) {
        return false;
      }
    }
    return true;
  }

  /// Get missing entity counts
  Map<String, int> get missingEntities {
    final missing = <String, int>{};
    for (final entry in expectedStats.entries) {
      final current = currentStats[entry.key] ?? 0;
      final expected = entry.value;
      if (current < expected) {
        missing[entry.key] = expected - current;
      }
    }
    return missing;
  }

  @override
  String toString() {
    return 'DemoDataInfo(initialized: $isInitialized, profiles: $profileCount, '
        'verified: $verifiedProfiles, premium: $premiumProfiles, complete: $isDataComplete)';
  }
}

/// 🚨 Demo Data Exception - Custom error for demo data operations
class DemoDataException implements Exception {
  final String message;
  final DateTime timestamp;

  DemoDataException(this.message) : timestamp = DateTime.now();

  @override
  String toString() {
    return 'DemoDataException: $message [${timestamp.toIso8601String()}]';
  }
}
