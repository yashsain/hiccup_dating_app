import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

/// 📱 Post Entity - Production-Grade Domain Model (2025)
///
/// This is the complete PostEntity for the Hiccup dating app, designed to handle
/// all post types and media combinations. Built for production use with full
/// business logic, validation, and extensibility.
///
/// Features:
/// - Immutable data structure with Freezed
/// - Complete media metadata support
/// - Business rule validation (6 posts max, 6 media per post)
/// - Support for all media types (photos, videos, voice notes)
/// - Visibility controls and ordering
/// - Future-ready for backend integration
///
/// Media Architecture:
/// - Each post contains 1-6 media items
/// - Each media item has complete metadata
/// - Support for mixed media types (photos + videos)
/// - Voice notes are separate posts (dating app requirement)
///
/// Usage:
/// ```dart
/// final post = PostEntity(
///   id: 'post_123',
///   profileId: 'user_456',
///   caption: 'Coffee lover ☕',
///   mediaItems: [mediaItem1, mediaItem2],
///   type: PostType.photo,
///   createdAt: DateTime.now(),
/// );
/// ```
@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    required String id,
    required String profileId,
    required String caption,
    required List<PostMediaItem> mediaItems,
    required PostType type,
    @Default(true) bool isVisible,
    @Default(0) int displayOrder,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _PostEntity;

  const PostEntity._();

  // ============================================================================
  // 📊 COMPUTED PROPERTIES
  // ============================================================================

  /// Get the primary media item for thumbnail display
  PostMediaItem? get primaryMedia =>
      mediaItems.isNotEmpty ? mediaItems.first : null;

  /// Get primary image path for UI display
  String get primaryImagePath => primaryMedia?.filePath ?? '';

  /// Get media count for display
  int get mediaCount => mediaItems.length;

  /// Check if post has multiple media items
  bool get hasMultipleMedia => mediaItems.length > 1;

  /// Get display caption (truncated for grid view)
  String get displayCaption {
    if (caption.length <= 50) return caption;
    return '${caption.substring(0, 47)}...';
  }

  /// Get full caption for detail view
  String get fullCaption => caption;

  /// Check if post is recent (created within last 7 days)
  bool get isRecent {
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return createdAt.isAfter(weekAgo);
  }

  /// Get total file size of all media items
  int get totalFileSizeBytes =>
      mediaItems.fold(0, (total, item) => total + item.fileSizeBytes);

  /// Get total file size in MB
  double get totalFileSizeMB => totalFileSizeBytes / (1024 * 1024);

  /// Get formatted file size display
  String get fileSizeDisplay {
    if (totalFileSizeMB >= 1) {
      return '${totalFileSizeMB.toStringAsFixed(1)} MB';
    } else {
      final sizeKB = totalFileSizeBytes / 1024;
      return '${sizeKB.toStringAsFixed(0)} KB';
    }
  }

  /// Get ordered media items (sorted by orderInPost)
  List<PostMediaItem> get orderedMediaItems =>
      List.from(mediaItems)
        ..sort((a, b) => a.orderInPost.compareTo(b.orderInPost));

  // ============================================================================
  // ✅ VALIDATION METHODS
  // ============================================================================

  /// Validate post meets all business rules
  bool get isValid {
    return _validateBasicFields() &&
        _validateCaption() &&
        _validateMediaItems() &&
        _validatePostType() &&
        _validateDisplayOrder();
  }

  /// Validate basic required fields
  bool _validateBasicFields() {
    return id.isNotEmpty && profileId.isNotEmpty && mediaItems.isNotEmpty;
  }

  /// Validate caption rules
  bool _validateCaption() {
    return caption.isNotEmpty &&
        caption.length <= 200 &&
        caption.trim().isNotEmpty;
  }

  /// Validate media items rules
  bool _validateMediaItems() {
    return mediaItems.length >= 1 &&
        mediaItems.length <= 6 &&
        mediaItems.every((item) => item.isValid) &&
        _validateMediaItemOrder();
  }

  /// Validate media item ordering
  bool _validateMediaItemOrder() {
    final orders = mediaItems.map((item) => item.orderInPost).toList();
    final expectedOrders = List.generate(mediaItems.length, (index) => index);
    orders.sort();
    return orders.toString() == expectedOrders.toString();
  }

  /// Validate post type matches media content
  bool _validatePostType() {
    final mediaTypes = mediaItems.map((item) => item.type).toSet();

    switch (type) {
      case PostType.photo:
        return mediaTypes.length == 1 && mediaTypes.contains(MediaType.photo);
      case PostType.video:
        return mediaTypes.length == 1 && mediaTypes.contains(MediaType.video);
      case PostType.voiceNote:
        return mediaTypes.length == 1 &&
            mediaTypes.contains(MediaType.voiceNote);
      case PostType.mixed:
        return mediaTypes.length > 1 &&
            !mediaTypes.contains(MediaType.voiceNote);
    }
  }

  /// Validate display order
  bool _validateDisplayOrder() {
    return displayOrder >= 0 && displayOrder < 6; // Max 6 posts per profile
  }

  // ============================================================================
  // 🎯 BUSINESS LOGIC HELPERS
  // ============================================================================

  /// Check if post can be edited
  bool get canEdit => true; // All posts are editable in dating app

  /// Check if post can be deleted
  bool get canDelete => true; // All posts can be deleted

  /// Check if post can be hidden
  bool get canHide => isVisible; // Can only hide visible posts

  /// Check if post can be shown
  bool get canShow => !isVisible; // Can only show hidden posts

  /// Check if post can add more media
  bool get canAddMedia => mediaItems.length < 6;

  /// Check if post can remove media
  bool get canRemoveMedia => mediaItems.length > 1;

  /// Get available media slots
  int get availableMediaSlots => 6 - mediaItems.length;

  /// Check if post supports mixed media (photos + videos)
  bool get supportsMixedMedia => type == PostType.mixed;

  /// Check if post is voice note only
  bool get isVoiceNoteOnly => type == PostType.voiceNote;

  /// Get post age in days
  int get ageInDays => DateTime.now().difference(createdAt).inDays;

  /// Get post age display string
  String get ageDisplay {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '${months}mo ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  @override
  // TODO: implement caption
  String get caption => throw UnimplementedError();

  @override
  // TODO: implement createdAt
  DateTime get createdAt => throw UnimplementedError();

  @override
  // TODO: implement displayOrder
  int get displayOrder => throw UnimplementedError();

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement isVisible
  bool get isVisible => throw UnimplementedError();

  @override
  // TODO: implement mediaItems
  List<PostMediaItem> get mediaItems => throw UnimplementedError();

  @override
  // TODO: implement profileId
  String get profileId => throw UnimplementedError();

  @override
  // TODO: implement type
  PostType get type => throw UnimplementedError();

  @override
  // TODO: implement updatedAt
  DateTime? get updatedAt => throw UnimplementedError();
}

/// 🎭 Post Type Classification - Complete Dating App Support
///
/// Supports all post types planned for the Hiccup dating app:
/// - Photo posts: 1-6 photos (most common dating content)
/// - Video posts: 1-6 videos (personality showcase)
/// - Voice note posts: 1-6 voice recordings (authentic voice, separate from photos/videos)
/// - Mixed posts: photos + videos together (rich storytelling)
enum PostType {
  photo,
  video,
  voiceNote,
  mixed;

  /// Human-readable display name
  String get displayName {
    switch (this) {
      case PostType.photo:
        return 'Photos';
      case PostType.video:
        return 'Video';
      case PostType.voiceNote:
        return 'Voice Note';
      case PostType.mixed:
        return 'Mixed';
    }
  }

  /// Emoji icon for quick visual identification
  String get emoji {
    switch (this) {
      case PostType.photo:
        return '📷';
      case PostType.video:
        return '🎥';
      case PostType.voiceNote:
        return '🎤';
      case PostType.mixed:
        return '🎭';
    }
  }

  /// Material Design icon for UI consistency
  String get materialIcon {
    switch (this) {
      case PostType.photo:
        return 'photo_camera';
      case PostType.video:
        return 'videocam';
      case PostType.voiceNote:
        return 'mic';
      case PostType.mixed:
        return 'collections';
    }
  }

  /// Color accent for post type indicators
  String get colorHex {
    switch (this) {
      case PostType.photo:
        return '#4CAF50'; // Green
      case PostType.video:
        return '#2196F3'; // Blue
      case PostType.voiceNote:
        return '#FF9800'; // Orange
      case PostType.mixed:
        return '#9C27B0'; // Purple
    }
  }

  /// Maximum recommended media items for this post type
  int get maxMediaItems {
    switch (this) {
      case PostType.photo:
        return 6; // Up to 6 photos for variety
      case PostType.video:
        return 3; // Videos are larger, limit to 3
      case PostType.voiceNote:
        return 2; // Voice notes are personal, 1-2 is enough
      case PostType.mixed:
        return 6; // Mixed allows full flexibility
    }
  }
}

/// 🎬 Post Media Item - Individual Media File Metadata
///
/// Complete metadata for each media file within a post.
/// Supports photos, videos, and voice notes with full file information.
@freezed
class PostMediaItem with _$PostMediaItem {
  const factory PostMediaItem({
    required String id,
    required String filePath,
    required MediaType type,
    required int orderInPost, // 0-5 for ordering within the post
    @Default(0) int fileSizeBytes,
    int? durationSeconds, // For videos and voice notes
    int? width, // For photos and videos
    int? height, // For photos and videos
    String? thumbnailPath, // For videos
    @Default(false) bool isProcessing, // Upload/processing status
    String? mimeType, // File MIME type
    DateTime? capturedAt, // When media was captured/created
  }) = _PostMediaItem;

  const PostMediaItem._();

  // ============================================================================
  // 📊 COMPUTED PROPERTIES
  // ============================================================================

  /// Get file extension
  String get fileExtension {
    return filePath.split('.').last.toLowerCase();
  }

  /// Get file name without path
  String get fileName {
    return filePath.split('/').last;
  }

  /// Get file size in MB
  double get fileSizeMB => fileSizeBytes / (1024 * 1024);

  /// Get formatted file size
  String get fileSizeDisplay {
    if (fileSizeMB >= 1) {
      return '${fileSizeMB.toStringAsFixed(1)} MB';
    } else {
      final sizeKB = fileSizeBytes / 1024;
      return '${sizeKB.toStringAsFixed(0)} KB';
    }
  }

  /// Get duration display (for videos/audio)
  String? get durationDisplay {
    if (durationSeconds == null) return null;

    final minutes = durationSeconds! ~/ 60;
    final seconds = durationSeconds! % 60;

    if (minutes > 0) {
      return '${minutes}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${seconds}s';
    }
  }

  /// Get dimensions display (for photos/videos)
  String? get dimensionsDisplay {
    if (width == null || height == null) return null;
    return '${width}x$height';
  }

  /// Get aspect ratio (for photos/videos)
  double? get aspectRatio {
    if (width == null || height == null) return null;
    return width! / height!;
  }

  /// Check if media is portrait orientation
  bool get isPortrait => aspectRatio != null && aspectRatio! < 1.0;

  /// Check if media is landscape orientation
  bool get isLandscape => aspectRatio != null && aspectRatio! > 1.0;

  /// Check if media is square
  bool get isSquare => aspectRatio != null && (aspectRatio! - 1.0).abs() < 0.1;

  // ============================================================================
  // ✅ VALIDATION METHODS
  // ============================================================================

  /// Validate media item meets all requirements
  bool get isValid {
    return _validateBasicFields() &&
        _validateFileSize() &&
        _validateDimensions() &&
        _validateDuration() &&
        _validateFileType();
  }

  /// Validate basic required fields
  bool _validateBasicFields() {
    return id.isNotEmpty &&
        filePath.isNotEmpty &&
        orderInPost >= 0 &&
        orderInPost < 6;
  }

  /// Validate file size limits
  bool _validateFileSize() {
    if (fileSizeBytes <= 0) return false;

    switch (type) {
      case MediaType.photo:
        return fileSizeBytes <= 10 * 1024 * 1024; // 10MB max
      case MediaType.video:
        return fileSizeBytes <= 100 * 1024 * 1024; // 100MB max
      case MediaType.voiceNote:
        return fileSizeBytes <= 5 * 1024 * 1024; // 5MB max
    }
  }

  /// Validate dimensions (for photos/videos)
  bool _validateDimensions() {
    if (type == MediaType.voiceNote) return true; // No dimensions for audio

    if (width != null && height != null) {
      return width! > 0 && height! > 0 && width! <= 4096 && height! <= 4096;
    }

    return true; // Dimensions are optional during development
  }

  /// Validate duration (for videos/audio)
  bool _validateDuration() {
    if (durationSeconds == null) return true; // Optional during development

    switch (type) {
      case MediaType.photo:
        return durationSeconds == null; // Photos shouldn't have duration
      case MediaType.video:
        return durationSeconds! > 0 && durationSeconds! <= 120; // 2 minutes max
      case MediaType.voiceNote:
        return durationSeconds! > 0 && durationSeconds! <= 120; // 2 minutes max
    }
  }

  /// Validate file type and extension
  bool _validateFileType() {
    final validExtensions = type.allowedExtensions;
    return validExtensions.contains('.$fileExtension');
  }

  @override
  // TODO: implement capturedAt
  DateTime? get capturedAt => throw UnimplementedError();

  @override
  // TODO: implement durationSeconds
  int? get durationSeconds => throw UnimplementedError();

  @override
  // TODO: implement filePath
  String get filePath => throw UnimplementedError();

  @override
  // TODO: implement fileSizeBytes
  int get fileSizeBytes => throw UnimplementedError();

  @override
  // TODO: implement height
  int? get height => throw UnimplementedError();

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement isProcessing
  bool get isProcessing => throw UnimplementedError();

  @override
  // TODO: implement mimeType
  String? get mimeType => throw UnimplementedError();

  @override
  // TODO: implement orderInPost
  int get orderInPost => throw UnimplementedError();

  @override
  // TODO: implement thumbnailPath
  String? get thumbnailPath => throw UnimplementedError();

  @override
  // TODO: implement type
  MediaType get type => throw UnimplementedError();

  @override
  // TODO: implement width
  int? get width => throw UnimplementedError();
}

/// 🎬 Media Type Classification
///
/// Supports all media types for the dating app with proper validation.
enum MediaType {
  photo,
  video,
  voiceNote;

  /// Human-readable display name
  String get displayName {
    switch (this) {
      case MediaType.photo:
        return 'Photo';
      case MediaType.video:
        return 'Video';
      case MediaType.voiceNote:
        return 'Voice Note';
    }
  }

  /// Emoji representation
  String get emoji {
    switch (this) {
      case MediaType.photo:
        return '📷';
      case MediaType.video:
        return '🎥';
      case MediaType.voiceNote:
        return '🎤';
    }
  }

  /// Maximum file size in bytes
  int get maxFileSizeBytes {
    switch (this) {
      case MediaType.photo:
        return 10 * 1024 * 1024; // 10MB
      case MediaType.video:
        return 100 * 1024 * 1024; // 100MB
      case MediaType.voiceNote:
        return 5 * 1024 * 1024; // 5MB
    }
  }

  /// Allowed file extensions
  List<String> get allowedExtensions {
    switch (this) {
      case MediaType.photo:
        return ['.jpg', '.jpeg', '.png', '.webp', '.heic'];
      case MediaType.video:
        return ['.mp4', '.mov', '.avi', '.mkv'];
      case MediaType.voiceNote:
        return ['.mp3', '.wav', '.m4a', '.aac'];
    }
  }

  /// MIME types for this media type
  List<String> get mimeTypes {
    switch (this) {
      case MediaType.photo:
        return ['image/jpeg', 'image/png', 'image/webp', 'image/heic'];
      case MediaType.video:
        return ['video/mp4', 'video/quicktime', 'video/avi'];
      case MediaType.voiceNote:
        return ['audio/mpeg', 'audio/wav', 'audio/mp4', 'audio/aac'];
    }
  }
}
