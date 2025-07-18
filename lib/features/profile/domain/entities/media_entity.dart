import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_entity.freezed.dart';

/// 🎥 Media Entity - Clean Domain Model for Photos/Videos/Voice Notes (2025)
///
/// This entity represents a media file (photo, video, or voice note).
/// Based on the design document, users can have up to 9 media files total.
///
/// Features:
/// - Immutable data structure
/// - Built-in validation (file size, type limits)
/// - Type-safe properties
/// - Media type classification
/// - Freezed for equality and copyWith
///
/// Usage:
/// ```dart
/// final media = MediaEntity(
///   id: 'media_123',
///   profileId: 'user_123',
///   filePath: '/path/to/photo.jpg',
///   type: MediaType.photo,
///   displayOrder: 1,
/// );
/// ```

enum MediaType {
  photo,
  video,
  voiceNote;

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

  int get maxCount {
    switch (this) {
      case MediaType.photo:
        return 6;
      case MediaType.video:
        return 3;
      case MediaType.voiceNote:
        return 2;
    }
  }

  int get maxFileSizeMB {
    switch (this) {
      case MediaType.photo:
        return 10; // 10MB per photo
      case MediaType.video:
        return 100; // 100MB per video
      case MediaType.voiceNote:
        return 5; // 5MB per voice note
    }
  }

  List<String> get allowedExtensions {
    switch (this) {
      case MediaType.photo:
        return ['.jpg', '.jpeg', '.png', '.webp'];
      case MediaType.video:
        return ['.mp4', '.mov', '.avi'];
      case MediaType.voiceNote:
        return ['.mp3', '.wav', '.m4a'];
    }
  }
}

@freezed
sealed class MediaEntity with _$MediaEntity {
  const factory MediaEntity({
    required String id,
    required String profileId,
    required String filePath,
    required MediaType type,
    required int displayOrder,
    String? caption,
    @Default(0) int fileSizeBytes,
    int? durationSeconds, // For videos and voice notes
    int? width, // For photos and videos
    int? height, // For photos and videos
    String? thumbnailPath, // For videos
    @Default(false) bool isProcessing, // Upload/processing status
    @Default(true) bool isVisible,
    required DateTime createdAt,
  }) = _MediaEntity;

  const MediaEntity._();

  // ✅ Validation Methods
  bool get isValid {
    return _validateFilePath() &&
        _validateDisplayOrder() &&
        _validateFileSize() &&
        _validateDimensions() &&
        _validateCaption();
  }

  bool _validateFilePath() {
    if (filePath.isEmpty) return false;

    final extension = filePath.toLowerCase().substring(
      filePath.lastIndexOf('.'),
    );
    return type.allowedExtensions.contains(extension);
  }

  bool _validateDisplayOrder() {
    return displayOrder >= 1 && displayOrder <= 9;
  }

  bool _validateFileSize() {
    final maxSizeBytes = type.maxFileSizeMB * 1024 * 1024;
    return fileSizeBytes > 0 && fileSizeBytes <= maxSizeBytes;
  }

  bool _validateDimensions() {
    if (type == MediaType.voiceNote) return true; // No dimensions for audio

    if (width != null && height != null) {
      return width! > 0 && height! > 0 && width! <= 4096 && height! <= 4096;
    }

    return true; // Dimensions are optional
  }

  bool _validateCaption() {
    return caption == null || caption!.length <= 200;
  }

  // 📊 Computed Properties
  String get fileExtension {
    return filePath.substring(filePath.lastIndexOf('.')).toLowerCase();
  }

  String get fileName {
    return filePath.substring(filePath.lastIndexOf('/') + 1);
  }

  double get fileSizeMB {
    return fileSizeBytes / (1024 * 1024);
  }

  String get fileSizeDisplay {
    if (fileSizeMB >= 1) {
      return '${fileSizeMB.toStringAsFixed(1)} MB';
    } else {
      final sizeKB = fileSizeBytes / 1024;
      return '${sizeKB.toStringAsFixed(0)} KB';
    }
  }

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

  String? get dimensionsDisplay {
    if (width == null || height == null) return null;
    return '${width}x$height';
  }

  double? get aspectRatio {
    if (width == null || height == null) return null;
    return width! / height!;
  }

  // 🎯 Business Logic Helpers
  bool get canHaveCaption => type != MediaType.voiceNote;

  bool get canHaveThumbnail => type == MediaType.video;

  bool get isPortrait {
    if (aspectRatio == null) return false;
    return aspectRatio! < 1.0;
  }

  bool get isLandscape {
    if (aspectRatio == null) return false;
    return aspectRatio! > 1.0;
  }

  bool get isSquare {
    if (aspectRatio == null) return false;
    return (aspectRatio! - 1.0).abs() < 0.1; // Within 10% of 1:1
  }

  bool get isLongContent {
    return (type == MediaType.video && (durationSeconds ?? 0) > 30) ||
        (type == MediaType.voiceNote && (durationSeconds ?? 0) > 60);
  }

  bool get needsProcessing => isProcessing;

  // 🔍 Search Helpers
  List<String> get searchKeywords {
    final keywords = <String>[];
    keywords.add(type.displayName.toLowerCase());
    keywords.add(fileExtension);

    if (caption != null && caption!.isNotEmpty) {
      keywords.addAll(caption!.toLowerCase().split(' '));
    }

    return keywords
        .where((keyword) => keyword.isNotEmpty && keyword.length > 2)
        .toList();
  }

  // 🧪 Factory constructors for testing
  factory MediaEntity.empty() {
    return MediaEntity(
      id: '',
      profileId: '',
      filePath: '',
      type: MediaType.photo,
      displayOrder: 1,
      createdAt: DateTime.now(),
    );
  }

  factory MediaEntity.samplePhoto({int order = 1}) {
    return MediaEntity(
      id: 'media_photo_$order',
      profileId: 'sample_profile',
      filePath: '/uploads/photos/sample_$order.jpg',
      type: MediaType.photo,
      displayOrder: order,
      caption: order == 1 ? 'My favorite hiking spot' : null,
      fileSizeBytes: 2 * 1024 * 1024, // 2MB
      width: 1080,
      height: 1920,
      isVisible: true,
      createdAt: DateTime.now().subtract(Duration(days: order)),
    );
  }

  factory MediaEntity.sampleVideo() {
    return MediaEntity(
      id: 'media_video_1',
      profileId: 'sample_profile',
      filePath: '/uploads/videos/sample_video.mp4',
      type: MediaType.video,
      displayOrder: 2,
      caption: 'Weekend adventure!',
      fileSizeBytes: 25 * 1024 * 1024, // 25MB
      durationSeconds: 45,
      width: 1920,
      height: 1080,
      thumbnailPath: '/uploads/thumbnails/sample_video_thumb.jpg',
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    );
  }

  factory MediaEntity.sampleVoiceNote() {
    return MediaEntity(
      id: 'media_voice_1',
      profileId: 'sample_profile',
      filePath: '/uploads/voice/sample_voice.mp3',
      type: MediaType.voiceNote,
      displayOrder: 3,
      fileSizeBytes: 1024 * 1024, // 1MB
      durationSeconds: 30,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    );
  }
}

/// 🎯 Media Entity Extensions - Additional functionality
extension MediaEntityExtensions on MediaEntity {
  /// Check if media is recently uploaded (within last 7 days)
  bool get isRecentlyUploaded {
    return DateTime.now().difference(createdAt).inDays <= 7;
  }

  /// Get media age in days
  int get mediaAgeInDays {
    return DateTime.now().difference(createdAt).inDays;
  }

  /// Check if file size is within recommended limits
  bool get isRecommendedSize {
    switch (type) {
      case MediaType.photo:
        return fileSizeMB <= 5; // Recommend under 5MB for photos
      case MediaType.video:
        return fileSizeMB <= 50; // Recommend under 50MB for videos
      case MediaType.voiceNote:
        return fileSizeMB <= 2; // Recommend under 2MB for voice notes
    }
  }

  /// Get quality level based on dimensions and file size
  String get qualityLevel {
    if (type == MediaType.voiceNote) {
      return fileSizeMB > 2 ? 'High' : 'Standard';
    }

    if (width == null || height == null) return 'Unknown';

    final pixels = width! * height!;
    if (pixels >= 1920 * 1080) {
      return 'HD';
    } else if (pixels >= 1280 * 720) {
      return 'HD Ready';
    } else {
      return 'Standard';
    }
  }

  /// Generate display summary
  String get mediaSummary {
    final summary = StringBuffer();
    summary.write('${type.displayName}');

    if (dimensionsDisplay != null) {
      summary.write(' • $dimensionsDisplay');
    }

    if (durationDisplay != null) {
      summary.write(' • $durationDisplay');
    }

    summary.write(' • $fileSizeDisplay');

    return summary.toString();
  }

  /// Check if media needs optimization
  bool get needsOptimization {
    return !isRecommendedSize ||
        (type == MediaType.video && (durationSeconds ?? 0) > 120);
  }
}
