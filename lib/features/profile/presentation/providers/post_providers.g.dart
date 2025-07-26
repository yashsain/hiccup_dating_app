// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 🎛️ Post Providers - Production Architecture (2025)
///
/// These providers use the production PostEntity structure with proper
/// Riverpod 2.x patterns. The architecture is production-ready - only
/// the data source is mocked for rapid UI development.
///
/// Provider Hierarchy:
/// - userPosts: Async provider for loading user posts
/// - userPostsNotifier: Stateful notifier for post CRUD operations
/// - postStatistics: Computed statistics for UI display
///
/// Features:
/// - Production PostEntity with full media metadata
/// - Complete CRUD operations with business rule enforcement
/// - Realistic network delays for UX testing
/// - Comprehensive error handling
/// - Easy replacement with real API calls
/// 📊 Get User Posts Provider
///
/// Loads posts for a specific profile with realistic loading delay.
@ProviderFor(userPosts)
const userPostsProvider = UserPostsFamily._();

/// 🎛️ Post Providers - Production Architecture (2025)
///
/// These providers use the production PostEntity structure with proper
/// Riverpod 2.x patterns. The architecture is production-ready - only
/// the data source is mocked for rapid UI development.
///
/// Provider Hierarchy:
/// - userPosts: Async provider for loading user posts
/// - userPostsNotifier: Stateful notifier for post CRUD operations
/// - postStatistics: Computed statistics for UI display
///
/// Features:
/// - Production PostEntity with full media metadata
/// - Complete CRUD operations with business rule enforcement
/// - Realistic network delays for UX testing
/// - Comprehensive error handling
/// - Easy replacement with real API calls
/// 📊 Get User Posts Provider
///
/// Loads posts for a specific profile with realistic loading delay.
final class UserPostsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PostEntity>>,
          List<PostEntity>,
          FutureOr<List<PostEntity>>
        >
    with $FutureModifier<List<PostEntity>>, $FutureProvider<List<PostEntity>> {
  /// 🎛️ Post Providers - Production Architecture (2025)
  ///
  /// These providers use the production PostEntity structure with proper
  /// Riverpod 2.x patterns. The architecture is production-ready - only
  /// the data source is mocked for rapid UI development.
  ///
  /// Provider Hierarchy:
  /// - userPosts: Async provider for loading user posts
  /// - userPostsNotifier: Stateful notifier for post CRUD operations
  /// - postStatistics: Computed statistics for UI display
  ///
  /// Features:
  /// - Production PostEntity with full media metadata
  /// - Complete CRUD operations with business rule enforcement
  /// - Realistic network delays for UX testing
  /// - Comprehensive error handling
  /// - Easy replacement with real API calls
  /// 📊 Get User Posts Provider
  ///
  /// Loads posts for a specific profile with realistic loading delay.
  const UserPostsProvider._({
    required UserPostsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userPostsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userPostsHash();

  @override
  String toString() {
    return r'userPostsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<PostEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PostEntity>> create(Ref ref) {
    final argument = this.argument as String;
    return userPosts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserPostsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userPostsHash() => r'4ca813934e355aec7a951ef9ccd92bbdd7443afe';

/// 🎛️ Post Providers - Production Architecture (2025)
///
/// These providers use the production PostEntity structure with proper
/// Riverpod 2.x patterns. The architecture is production-ready - only
/// the data source is mocked for rapid UI development.
///
/// Provider Hierarchy:
/// - userPosts: Async provider for loading user posts
/// - userPostsNotifier: Stateful notifier for post CRUD operations
/// - postStatistics: Computed statistics for UI display
///
/// Features:
/// - Production PostEntity with full media metadata
/// - Complete CRUD operations with business rule enforcement
/// - Realistic network delays for UX testing
/// - Comprehensive error handling
/// - Easy replacement with real API calls
/// 📊 Get User Posts Provider
///
/// Loads posts for a specific profile with realistic loading delay.
final class UserPostsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<PostEntity>>, String> {
  const UserPostsFamily._()
    : super(
        retry: null,
        name: r'userPostsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🎛️ Post Providers - Production Architecture (2025)
  ///
  /// These providers use the production PostEntity structure with proper
  /// Riverpod 2.x patterns. The architecture is production-ready - only
  /// the data source is mocked for rapid UI development.
  ///
  /// Provider Hierarchy:
  /// - userPosts: Async provider for loading user posts
  /// - userPostsNotifier: Stateful notifier for post CRUD operations
  /// - postStatistics: Computed statistics for UI display
  ///
  /// Features:
  /// - Production PostEntity with full media metadata
  /// - Complete CRUD operations with business rule enforcement
  /// - Realistic network delays for UX testing
  /// - Comprehensive error handling
  /// - Easy replacement with real API calls
  /// 📊 Get User Posts Provider
  ///
  /// Loads posts for a specific profile with realistic loading delay.
  UserPostsProvider call(String profileId) =>
      UserPostsProvider._(argument: profileId, from: this);

  @override
  String toString() => r'userPostsProvider';
}

/// 🎛️ User Posts Notifier - Complete Post Management
///
/// Handles all post CRUD operations with proper state management.
/// Enforces business rules and provides optimistic updates.
@ProviderFor(UserPostsNotifier)
const userPostsNotifierProvider = UserPostsNotifierFamily._();

/// 🎛️ User Posts Notifier - Complete Post Management
///
/// Handles all post CRUD operations with proper state management.
/// Enforces business rules and provides optimistic updates.
final class UserPostsNotifierProvider
    extends $AsyncNotifierProvider<UserPostsNotifier, List<PostEntity>> {
  /// 🎛️ User Posts Notifier - Complete Post Management
  ///
  /// Handles all post CRUD operations with proper state management.
  /// Enforces business rules and provides optimistic updates.
  const UserPostsNotifierProvider._({
    required UserPostsNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userPostsNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userPostsNotifierHash();

  @override
  String toString() {
    return r'userPostsNotifierProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserPostsNotifier create() => UserPostsNotifier();

  @override
  bool operator ==(Object other) {
    return other is UserPostsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userPostsNotifierHash() => r'8a0955ddfb91d0e21dbd7171a6007e704a193f51';

/// 🎛️ User Posts Notifier - Complete Post Management
///
/// Handles all post CRUD operations with proper state management.
/// Enforces business rules and provides optimistic updates.
final class UserPostsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          UserPostsNotifier,
          AsyncValue<List<PostEntity>>,
          List<PostEntity>,
          FutureOr<List<PostEntity>>,
          String
        > {
  const UserPostsNotifierFamily._()
    : super(
        retry: null,
        name: r'userPostsNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 🎛️ User Posts Notifier - Complete Post Management
  ///
  /// Handles all post CRUD operations with proper state management.
  /// Enforces business rules and provides optimistic updates.
  UserPostsNotifierProvider call(String profileId) =>
      UserPostsNotifierProvider._(argument: profileId, from: this);

  @override
  String toString() => r'userPostsNotifierProvider';
}

abstract class _$UserPostsNotifier extends $AsyncNotifier<List<PostEntity>> {
  late final _$args = ref.$arg as String;
  String get profileId => _$args;

  FutureOr<List<PostEntity>> build(String profileId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<PostEntity>>, List<PostEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PostEntity>>, List<PostEntity>>,
              AsyncValue<List<PostEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 📈 Post Statistics Provider
@ProviderFor(postStatistics)
const postStatisticsProvider = PostStatisticsFamily._();

/// 📈 Post Statistics Provider
final class PostStatisticsProvider
    extends $FunctionalProvider<PostStatistics, PostStatistics, PostStatistics>
    with $Provider<PostStatistics> {
  /// 📈 Post Statistics Provider
  const PostStatisticsProvider._({
    required PostStatisticsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'postStatisticsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postStatisticsHash();

  @override
  String toString() {
    return r'postStatisticsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<PostStatistics> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostStatistics create(Ref ref) {
    final argument = this.argument as String;
    return postStatistics(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostStatistics value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostStatistics>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PostStatisticsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postStatisticsHash() => r'b272fc4505b40521e77a4ccc2069f264004d1c0f';

/// 📈 Post Statistics Provider
final class PostStatisticsFamily extends $Family
    with $FunctionalFamilyOverride<PostStatistics, String> {
  const PostStatisticsFamily._()
    : super(
        retry: null,
        name: r'postStatisticsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 📈 Post Statistics Provider
  PostStatisticsProvider call(String profileId) =>
      PostStatisticsProvider._(argument: profileId, from: this);

  @override
  String toString() => r'postStatisticsProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
