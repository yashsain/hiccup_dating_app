// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 🗄️ Database Provider - Riverpod Provider for Database Access (2025)
///
/// This provider manages the database instance using the modern @riverpod annotation.
/// It provides a singleton database instance throughout the app.
///
/// Usage:
/// ```dart
/// final db = ref.watch(databaseProvider);
/// ```
@ProviderFor(database)
const databaseProvider = DatabaseProvider._();

/// 🗄️ Database Provider - Riverpod Provider for Database Access (2025)
///
/// This provider manages the database instance using the modern @riverpod annotation.
/// It provides a singleton database instance throughout the app.
///
/// Usage:
/// ```dart
/// final db = ref.watch(databaseProvider);
/// ```
final class DatabaseProvider
    extends
        $FunctionalProvider<AsyncValue<Database>, Database, FutureOr<Database>>
    with $FutureModifier<Database>, $FutureProvider<Database> {
  /// 🗄️ Database Provider - Riverpod Provider for Database Access (2025)
  ///
  /// This provider manages the database instance using the modern @riverpod annotation.
  /// It provides a singleton database instance throughout the app.
  ///
  /// Usage:
  /// ```dart
  /// final db = ref.watch(databaseProvider);
  /// ```
  const DatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $FutureProviderElement<Database> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Database> create(Ref ref) {
    return database(ref);
  }
}

String _$databaseHash() => r'3edd1988d1eb4a1c8a83a03eff574fbde66ce58c';

/// 🔍 Database Helper Provider - Access to DatabaseHelper instance
@ProviderFor(databaseHelper)
const databaseHelperProvider = DatabaseHelperProvider._();

/// 🔍 Database Helper Provider - Access to DatabaseHelper instance
final class DatabaseHelperProvider
    extends $FunctionalProvider<DatabaseHelper, DatabaseHelper, DatabaseHelper>
    with $Provider<DatabaseHelper> {
  /// 🔍 Database Helper Provider - Access to DatabaseHelper instance
  const DatabaseHelperProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseHelperProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHelperHash();

  @$internal
  @override
  $ProviderElement<DatabaseHelper> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DatabaseHelper create(Ref ref) {
    return databaseHelper(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DatabaseHelper value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DatabaseHelper>(value),
    );
  }
}

String _$databaseHelperHash() => r'8756a78fed012308a421b0f2a0f1b586cae71baf';

/// 📊 Database Statistics Provider - For debugging and monitoring
@ProviderFor(databaseStatistics)
const databaseStatisticsProvider = DatabaseStatisticsProvider._();

/// 📊 Database Statistics Provider - For debugging and monitoring
final class DatabaseStatisticsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>>,
          Map<String, dynamic>,
          FutureOr<Map<String, dynamic>>
        >
    with
        $FutureModifier<Map<String, dynamic>>,
        $FutureProvider<Map<String, dynamic>> {
  /// 📊 Database Statistics Provider - For debugging and monitoring
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
  $FutureProviderElement<Map<String, dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, dynamic>> create(Ref ref) {
    return databaseStatistics(ref);
  }
}

String _$databaseStatisticsHash() =>
    r'40d2464844c0c60033da6a68b58f9856495dec7c';

/// 🔍 Database Health Provider - Check database health
@ProviderFor(databaseHealth)
const databaseHealthProvider = DatabaseHealthProvider._();

/// 🔍 Database Health Provider - Check database health
final class DatabaseHealthProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// 🔍 Database Health Provider - Check database health
  const DatabaseHealthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseHealthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHealthHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return databaseHealth(ref);
  }
}

String _$databaseHealthHash() => r'0e382542b7942832eef99d2a634ec076effe2304';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
