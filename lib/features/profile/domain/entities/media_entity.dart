import 'package:equatable/equatable.dart';

/// 📸 Media Entity - Clean Domain Model for Profile Media (2025)
///
/// This entity represents media content (photos, videos, voice notes) in profiles.
/// Based on the design document: max 9 photos, 2 videos, 2 voice notes (30s each).
///
/// Features:
/// - Immutable data structure
/// - Built-in validation (file types, size limits)
/// - Type-safe properties
/// - Display ordering support
/// - Equatable for easy comparison
///
/// Usage:
/// ```dart
/// final media = MediaEntity(
///   id: 'media_123',
///   profileId: 'user_123',
///   type: MediaType.photo,
///   filePath: 'path/to/image.jpg',
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

  String get iconName {
    switch (this) {
      case MediaType.photo:
        return 'photo';
      case MediaType.video:
        return 'video_camera';
      case MediaType.voiceNote:
        return 'mic';
    }
  }

  int get maxCount {
    switch (this) {
      case MediaType.photo:
        return 9;
      case MediaType.video:
        return 2;
      case MediaType.voiceNote:
        return 2;
    }
  }

  int get maxDurationSeconds {
    switch (this) {
      case MediaType.photo:
        return 0; // No duration for photos
      case MediaType.video:
        return 30;
      case MediaType.voiceNote:
        return 30;
    }
  }

  List<String> get allowedExtensions {
    switch (this) {
      case MediaType.photo:
        return ['jpg', 'jpeg', 'png', 'heic', 'webp'];
      case MediaType.video:
        return ['mp4', 'mov', 'avi', 'mkv'];
      case MediaType.voiceNote:
        return ['m4a', 'mp3', 'wav', 'aac'];
    }
  }
}

class MediaEntity extends Equatable {
  // 🔑 Core Identity
  final String id;
  final String profileId;

  // 📱 Media Properties
  final MediaType type;
  final String filePath;
  final String? thumbnailPath; // For videos
  final String? originalFileName;

  // 📊 Metadata
  final int? fileSizeBytes;
  final int? durationSeconds; // For videos and voice notes
  final int? width; // For photos and videos
  final int? height; // For photos and videos

  // 🎯 Display
  final int displayOrder;

  // ⏰ Timestamps
  final DateTime createdAt;

  const MediaEntity({
    required this.id,
    required this.profileId,
    required this.type,
    required this.filePath,
    this.thumbnailPath,
    this.originalFileName,
    this.fileSizeBytes,
    this.durationSeconds,
    this.width,
    this.height,
    required this.displayOrder,
    required this.createdAt,
  });

  // 🔄 Copy with method for immutable updates
  MediaEntity copyWith({
    String? id,
    String? profileId,
    MediaType? type,
    String? filePath,
    String? thumbnailPath,
    String? originalFileName,
    int? fileSizeBytes,
    int? durationSeconds,
    int? width,
    int? height,
    int? displayOrder,
    DateTime? createdAt,
  }) {
    return MediaEntity(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      type: type ?? this.type,
      filePath: filePath ?? this.filePath,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      originalFileName: originalFileName ?? this.originalFileName,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      width: width ?? this.width,
      height: height ?? this.height,
      displayOrder: displayOrder ?? this.displayOrder,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // ✅ Validation Methods
  bool get isValid {
    return _validateFilePath() &&
        _validateDuration() &&
        _validateFileSize() &&
        _validateDimensions() &&
        _validateDisplayOrder();
  }

  bool _validateFilePath() {
    if (filePath.isEmpty) return false;

    final extension = filePath.split('.').last.toLowerCase();
    return type.allowedExtensions.contains(extension);
  }

  bool _validateDuration() {
    if (type == MediaType.photo) {
      return durationSeconds == null || durationSeconds == 0;
    }

    if (durationSeconds == null) return false;
    return durationSeconds! > 0 && durationSeconds! <= type.maxDurationSeconds;
  }

  bool _validateFileSize() {
    if (fileSizeBytes == null) return true; // Optional field

    // Max file sizes (in bytes)
    const maxPhotoSize = 10 * 1024 * 1024; // 10MB
    const maxVideoSize = 50 * 1024 * 1024; // 50MB
    const maxVoiceNoteSize = 5 * 1024 * 1024; // 5MB

    switch (type) {
      case MediaType.photo:
        return fileSizeBytes! <= maxPhotoSize;
      case MediaType.video:
        return fileSizeBytes! <= maxVideoSize;
      case MediaType.voiceNote:
        return fileSizeBytes! <= maxVoiceNoteSize;
    }
  }

  bool _validateDimensions() {
    if (type == MediaType.voiceNote) {
      return width == null && height == null;
    }

    if (width != null && height != null) {
      return width! > 0 && height! > 0 && width! <= 4096 && height! <= 4096;
    }

    return true; // Optional for photos and videos
  }

  bool _validateDisplayOrder() {
    return displayOrder >= 1 && displayOrder <= type.maxCount;
  }

  // 📊 Computed Properties
  String get fileName => filePath.split('/').last;

  String get fileExtension => filePath.split('.').last.toLowerCase();

  bool get isPhoto => type == MediaType.photo;
  bool get isVideo => type == MediaType.video;
  bool get isVoiceNote => type == MediaType.voiceNote;

  bool get hasThumbnail => thumbnailPath != null && thumbnailPath!.isNotEmpty;

  String get displayPath => hasThumbnail ? thumbnailPath! : filePath;

  // 📱 File Size Helpers
  String get fileSizeDisplay {
    if (fileSizeBytes == null) return 'Unknown size';

    final size = fileSizeBytes!;
    if (size < 1024) return '${size}B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)}KB';
    if (size < 1024 * 1024 * 1024)
      return '${(size / (1024 * 1024)).toStringAsFixed(1)}MB';
    return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(1)}GB';
  }

  // ⏰ Duration Helpers
  String get durationDisplay {
    if (durationSeconds == null || durationSeconds == 0) return '';

    final minutes = durationSeconds! ~/ 60;
    final seconds = durationSeconds! % 60;

    if (minutes > 0) {
      return '${minutes}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${seconds}s';
  }

  // 📐 Dimension Helpers
  String get dimensionsDisplay {
    if (width == null || height == null) return '';
    return '${width}x${height}';
  }

  double? get aspectRatio {
    if (width == null || height == null || height == 0) return null;
    return width! / height!;
  }

  bool get isPortrait => aspectRatio != null && aspectRatio! < 1.0;
  bool get isLandscape => aspectRatio != null && aspectRatio! > 1.0;
  bool get isSquare => aspectRatio != null && (aspectRatio! - 1.0).abs() < 0.1;

  // 🎨 Display Helpers
  String get typeDisplayName => type.displayName;

  String get shortFileName {
    if (originalFileName != null && originalFileName!.isNotEmpty) {
      return originalFileName!.length > 20
          ? '${originalFileName!.substring(0, 17)}...'
          : originalFileName!;
    }
    return fileName.length > 20 ? '${fileName.substring(0, 17)}...' : fileName;
  }

  // 📊 Quality Assessment
  MediaQuality get quality {
    if (isPhoto) {
      if (width != null && height != null) {
        final megapixels = (width! * height!) / (1024 * 1024);
        if (megapixels >= 8) return MediaQuality.high;
        if (megapixels >= 3) return MediaQuality.medium;
        return MediaQuality.low;
      }
    }

    if (isVideo) {
      if (width != null && height != null) {
        if (width! >= 1920 && height! >= 1080) return MediaQuality.high;
        if (width! >= 1280 && height! >= 720) return MediaQuality.medium;
        return MediaQuality.low;
      }
    }

    // For voice notes, quality could be based on bitrate or file size
    return MediaQuality.medium;
  }

  // 🔍 Search Helpers
  List<String> get searchKeywords {
    final keywords = <String>[];

    keywords.add(type.displayName.toLowerCase());
    keywords.add(fileExtension);

    if (originalFileName != null) {
      keywords.addAll(originalFileName!.toLowerCase().split(' '));
    }

    return keywords.where((keyword) => keyword.isNotEmpty).toList();
  }

  // 📋 Equatable implementation
  @override
  List<Object?> get props => [
    id,
    profileId,
    type,
    filePath,
    thumbnailPath,
    originalFileName,
    fileSizeBytes,
    durationSeconds,
    width,
    height,
    displayOrder,
    createdAt,
  ];

  // 🔍 Debug representation
  @override
  String toString() {
    return 'MediaEntity('
        'id: $id, '
        'profileId: $profileId, '
        'type: ${type.displayName}, '
        'file: $shortFileName, '
        'size: $fileSizeDisplay, '
        'duration: $durationDisplay, '
        'dimensions: $dimensionsDisplay, '
        'order: $displayOrder'
        ')';
  }

  // 🧪 Factory constructors for testing
  factory MediaEntity.empty() {
    return MediaEntity(
      id: '',
      profileId: '',
      type: MediaType.photo,
      filePath: '',
      displayOrder: 1,
      createdAt: DateTime.now(),
    );
  }

  factory MediaEntity.samplePhoto() {
    return MediaEntity(
      id: 'media_photo_1',
      profileId: 'user_123',
      type: MediaType.photo,
      filePath: 'photos/profile_pic.jpg',
      originalFileName: 'profile_pic.jpg',
      fileSizeBytes: 2 * 1024 * 1024, // 2MB
      width: 1920,
      height: 1080,
      displayOrder: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
    );
  }

  factory MediaEntity.sampleVideo() {
    return MediaEntity(
      id: 'media_video_1',
      profileId: 'user_123',
      type: MediaType.video,
      filePath: 'videos/intro_video.mp4',
      thumbnailPath: 'videos/intro_video_thumb.jpg',
      originalFileName: 'intro_video.mp4',
      fileSizeBytes: 15 * 1024 * 1024, // 15MB
      durationSeconds: 25,
      width: 1280,
      height: 720,
      displayOrder: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    );
  }

  factory MediaEntity.sampleVoiceNote() {
    return MediaEntity(
      id: 'media_voice_1',
      profileId: 'user_123',
      type: MediaType.voiceNote,
      filePath: 'voice_notes/introduction.m4a',
      originalFileName: 'introduction.m4a',
      fileSizeBytes: 1 * 1024 * 1024, // 1MB
      durationSeconds: 20,
      displayOrder: 3,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    );
  }
}

/// 📊 Media Quality Enum
enum MediaQuality {
  low,
  medium,
  high;

  String get displayName {
    switch (this) {
      case MediaQuality.low:
        return 'Low';
      case MediaQuality.medium:
        return 'Medium';
      case MediaQuality.high:
        return 'High';
    }
  }

  String get description {
    switch (this) {
      case MediaQuality.low:
        return 'Basic quality';
      case MediaQuality.medium:
        return 'Good quality';
      case MediaQuality.high:
        return 'Best quality';
    }
  }
}

/// 🎯 Media Entity Extensions - Additional functionality
extension MediaEntityExtensions on MediaEntity {
  /// Check if media was recently created (within last 7 days)
  bool get isRecentlyCreated {
    return DateTime.now().difference(createdAt).inDays <= 7;
  }

  /// Get creation time in human readable format
  String get createdTimeAgo {
    final difference = DateTime.now().difference(createdAt);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  /// Check if media needs compression
  bool get needsCompression {
    if (fileSizeBytes == null) return false;

    const compressionThreshold = {
      MediaType.photo: 5 * 1024 * 1024, // 5MB
      MediaType.video: 30 * 1024 * 1024, // 30MB
      MediaType.voiceNote: 3 * 1024 * 1024, // 3MB
    };

    return fileSizeBytes! > compressionThreshold[type]!;
  }

  /// Get compression ratio needed
  double get compressionRatio {
    if (!needsCompression) return 1.0;

    const targetSize = {
      MediaType.photo: 2 * 1024 * 1024, // 2MB
      MediaType.video: 15 * 1024 * 1024, // 15MB
      MediaType.voiceNote: 1 * 1024 * 1024, // 1MB
    };

    return targetSize[type]! / fileSizeBytes!;
  }

  /// Generate media summary for display
  String get mediaSummary {
    final buffer = StringBuffer();
    buffer.write('${type.displayName} - $shortFileName');

    if (fileSizeBytes != null) {
      buffer.write(' ($fileSizeDisplay)');
    }

    if (durationSeconds != null && durationSeconds! > 0) {
      buffer.write(' • $durationDisplay');
    }

    if (width != null && height != null) {
      buffer.write(' • $dimensionsDisplay');
    }

    return buffer.toString();
  }

  /// Check if media is suitable for main profile picture
  bool get isSuitableForMainProfile {
    if (!isPhoto) return false;
    if (quality == MediaQuality.low) return false;
    if (width != null && height != null) {
      // Should be at least 500x500 for profile pictures
      return width! >= 500 && height! >= 500;
    }
    return true;
  }

  /// Get recommended display size for UI
  Size get recommendedDisplaySize {
    if (isPhoto) {
      return const Size(300, 300); // Square for profile photos
    } else if (isVideo) {
      return const Size(300, 200); // 3:2 aspect ratio for videos
    } else {
      return const Size(200, 60); // Wide for voice notes
    }
  }
}

/// 📐 Simple Size class for dimensions
class Size {
  final double width;
  final double height;

  const Size(this.width, this.height);

  double get aspectRatio => width / height;

  @override
  String toString() => '${width}x${height}';
}
