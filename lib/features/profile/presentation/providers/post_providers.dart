import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/post_entity.dart';

part 'post_providers.g.dart';

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
@riverpod
Future<List<PostEntity>> userPosts(Ref ref, String profileId) async {
  // Simulate realistic network delay
  await Future.delayed(const Duration(milliseconds: 800));

  return _generateMockPosts(profileId);
}

/// 🎛️ User Posts Notifier - Complete Post Management
///
/// Handles all post CRUD operations with proper state management.
/// Enforces business rules and provides optimistic updates.
@riverpod
class UserPostsNotifier extends _$UserPostsNotifier {
  @override
  Future<List<PostEntity>> build(String profileId) async {
    // Simulate initial load delay
    await Future.delayed(const Duration(milliseconds: 600));
    return _generateMockPosts(profileId);
  }

  /// ✨ Add New Post
  Future<void> addPost(PostEntity post) async {
    final currentPosts = await future;

    // Validate business rules
    if (currentPosts.length >= 6) {
      throw PostLimitExceededException('Maximum 6 posts allowed per profile');
    }

    if (!post.isValid) {
      throw InvalidPostException('Post data is invalid');
    }

    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));

    // Add post with proper ordering
    final updatedPosts = [
      ...currentPosts,
      post.copyWith(displayOrder: currentPosts.length),
    ];

    state = AsyncData(updatedPosts);
  }

  /// 🗑️ Remove Post
  Future<void> removePost(String postId) async {
    final currentPosts = await future;

    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 400));

    // Remove and reorder
    final updatedPosts = currentPosts
        .where((post) => post.id != postId)
        .toList()
        .asMap()
        .entries
        .map((entry) => entry.value.copyWith(displayOrder: entry.key))
        .toList();

    state = AsyncData(updatedPosts);
  }

  /// 👁️ Toggle Post Visibility
  Future<void> toggleVisibility(String postId) async {
    final currentPosts = await future;

    await Future.delayed(const Duration(milliseconds: 300));

    final updatedPosts = currentPosts.map((post) {
      if (post.id == postId) {
        return post.copyWith(isVisible: !post.isVisible);
      }
      return post;
    }).toList();

    state = AsyncData(updatedPosts);
  }

  /// ✏️ Update Post
  Future<void> updatePost(
    String postId, {
    String? caption,
    List<PostMediaItem>? mediaItems,
    bool? isVisible,
  }) async {
    final currentPosts = await future;

    await Future.delayed(const Duration(milliseconds: 500));

    final updatedPosts = currentPosts.map((post) {
      if (post.id == postId) {
        return post.copyWith(
          caption: caption ?? post.caption,
          mediaItems: mediaItems ?? post.mediaItems,
          isVisible: isVisible ?? post.isVisible,
          updatedAt: DateTime.now(),
        );
      }
      return post;
    }).toList();

    state = AsyncData(updatedPosts);
  }

  /// 🔄 Reorder Posts
  Future<void> reorderPosts(List<String> orderedPostIds) async {
    final currentPosts = await future;

    await Future.delayed(const Duration(milliseconds: 400));

    final postMap = {for (var post in currentPosts) post.id: post};

    final reorderedPosts = orderedPostIds
        .asMap()
        .entries
        .where((entry) => postMap.containsKey(entry.value))
        .map((entry) => postMap[entry.value]!.copyWith(displayOrder: entry.key))
        .toList();

    state = AsyncData(reorderedPosts);
  }

  /// 🔄 Refresh Posts
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build(profileId));
  }
}

/// 📈 Post Statistics Provider
@riverpod
PostStatistics postStatistics(Ref ref, String profileId) {
  final postsAsync = ref.watch(userPostsProvider(profileId));

  return postsAsync.when(
    data: (posts) {
      final visiblePosts = posts.where((post) => post.isVisible).toList();
      return PostStatistics(
        totalPosts: posts.length,
        visiblePosts: visiblePosts.length,
        hiddenPosts: posts.length - visiblePosts.length,
        remainingSlots: 6 - posts.length,
        canAddMore: posts.length < 6,
        recentPosts: posts.where((post) => post.isRecent).length,
        totalMediaItems: posts.fold(
          0,
          (total, post) => total + post.mediaCount,
        ),
        totalFileSizeMB: posts.fold(
          0.0,
          (total, post) => total + post.totalFileSizeMB,
        ),
      );
    },
    loading: () => const PostStatistics.empty(),
    error: (_, __) => const PostStatistics.empty(),
  );
}

/// 📊 Post Statistics Data Class
class PostStatistics {
  final int totalPosts;
  final int visiblePosts;
  final int hiddenPosts;
  final int remainingSlots;
  final bool canAddMore;
  final int recentPosts;
  final int totalMediaItems;
  final double totalFileSizeMB;

  const PostStatistics({
    required this.totalPosts,
    required this.visiblePosts,
    required this.hiddenPosts,
    required this.remainingSlots,
    required this.canAddMore,
    required this.recentPosts,
    required this.totalMediaItems,
    required this.totalFileSizeMB,
  });

  const PostStatistics.empty()
    : totalPosts = 0,
      visiblePosts = 0,
      hiddenPosts = 0,
      remainingSlots = 6,
      canAddMore = true,
      recentPosts = 0,
      totalMediaItems = 0,
      totalFileSizeMB = 0.0;

  /// Get formatted total file size
  String get fileSizeDisplay {
    if (totalFileSizeMB >= 1000) {
      return '${(totalFileSizeMB / 1000).toStringAsFixed(1)} GB';
    }
    return '${totalFileSizeMB.toStringAsFixed(1)} MB';
  }
}

/// 🎭 Custom Exceptions
class PostLimitExceededException implements Exception {
  final String message;
  PostLimitExceededException(this.message);

  @override
  String toString() => 'PostLimitExceededException: $message';
}

class InvalidPostException implements Exception {
  final String message;
  InvalidPostException(this.message);

  @override
  String toString() => 'InvalidPostException: $message';
}

/// 🎨 Mock Data Generator - Production PostEntity Structure
///
/// Generates realistic posts using the full PostEntity structure.
/// This function will be replaced with API calls in production.
List<PostEntity> _generateMockPosts(String profileId) {
  return [
    PostEntity(
      id: 'post_001',
      profileId: profileId,
      caption:
          'Coffee lover ☕ Always exploring new cafes in the city! This one has the perfect ambiance for a morning date.',
      mediaItems: [
        PostMediaItem(
          id: 'media_001',
          filePath: 'assets/temp_images/coffee1.jpg',
          type: MediaType.photo,
          orderInPost: 0,
          fileSizeBytes: 2048000, // 2MB
          width: 1080,
          height: 1350, // Portrait
        ),
        PostMediaItem(
          id: 'media_002',
          filePath: 'assets/temp_images/coffee2.jpg',
          type: MediaType.photo,
          orderInPost: 1,
          fileSizeBytes: 1894400, // 1.8MB
          width: 1080,
          height: 1080, // Square
        ),
      ],
      type: PostType.photo,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      displayOrder: 0,
      isVisible: true,
    ),

    PostEntity(
      id: 'post_002',
      profileId: profileId,
      caption:
          'Hiking adventures 🏔️ Nothing beats a mountain sunrise and the feeling of accomplishment at the peak!',
      mediaItems: [
        PostMediaItem(
          id: 'media_003',
          filePath: 'assets/temp_images/hiking1.jpg',
          type: MediaType.photo,
          orderInPost: 0,
          fileSizeBytes: 3145728, // 3MB
          width: 1920,
          height: 1080, // Landscape
        ),
        PostMediaItem(
          id: 'media_004',
          filePath: 'assets/temp_images/hiking2.jpg',
          type: MediaType.photo,
          orderInPost: 1,
          fileSizeBytes: 2621440, // 2.5MB
          width: 1080,
          height: 1920, // Portrait
        ),
        PostMediaItem(
          id: 'media_005',
          filePath: 'assets/temp_images/hiking3.jpg',
          type: MediaType.photo,
          orderInPost: 2,
          fileSizeBytes: 2097152, // 2MB
          width: 1080,
          height: 1080, // Square
        ),
      ],
      type: PostType.photo,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      displayOrder: 1,
      isVisible: true,
    ),

    PostEntity(
      id: 'post_003',
      profileId: profileId,
      caption:
          'Cooking experiments 👨‍🍳 Tonight: homemade pasta from scratch! Who wants to be my taste tester?',
      mediaItems: [
        PostMediaItem(
          id: 'media_006',
          filePath: 'assets/temp_images/cooking_video_thumb.jpg',
          type: MediaType.video,
          orderInPost: 0,
          fileSizeBytes: 15728640, // 15MB
          width: 1920,
          height: 1080,
          durationSeconds: 45,
          thumbnailPath: 'assets/temp_images/cooking_video_thumb.jpg',
        ),
      ],
      type: PostType.video,
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      displayOrder: 2,
      isVisible: true,
    ),

    PostEntity(
      id: 'post_004',
      profileId: profileId,
      caption:
          'Beach sunset vibes 🌅 Sometimes you need to pause and appreciate the simple beauty around us.',
      mediaItems: [
        PostMediaItem(
          id: 'media_007',
          filePath: 'assets/temp_images/beach_sunset.jpg',
          type: MediaType.photo,
          orderInPost: 0,
          fileSizeBytes: 2686976, // 2.56MB
          width: 1920,
          height: 1080, // Landscape
        ),
      ],
      type: PostType.photo,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      displayOrder: 3,
      isVisible: true,
    ),
  ];
}
