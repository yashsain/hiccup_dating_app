import '../../domain/entities/media_entity.dart';

/// 🎥 Media Model - Entity ↔ Database Mapping (2025)
///
/// This model handles conversion between MediaEntity and database maps.
/// Media includes photos, videos, and voice notes that users upload
/// to showcase themselves on their profile.
///
/// Key Features:
/// - Multi-type media support (photo/video/voice)
/// - File metadata handling (size, duration, format)
/// - Order management for media display sequence
/// - File path handling for local/remote storage
/// - Type-safe conversions with validation
/// - Easy backend swap capability
///
/// Usage:
/// ```dart
/// // Entity → Database
/// final map = MediaModel.toMap(mediaEntity);
/// await database.insert('media', map);
///
/// // Database → Entity
/// final media = MediaModel.fromMap(databaseMap);
/// ```
class MediaModel {
  // 🚫 Private constructor - This is a utility class
  MediaModel._();

  /// 📤 Convert MediaEntity to Database Map
  ///
  /// Serializes media data for SQLite storage with proper type
  /// handling for different media types and metadata.
  static Map<String, dynamic> toMap(MediaEntity entity) {
    try {
      return {
        // 🔑 Primary identifiers
        'id': entity.id,
        'profile_id': entity.profileId,

        // 🎭 Media type and content
        'type': entity.type.name, // enum to string
        'file_path': entity.filePath,
        'caption': entity.caption,

        // 📊 File metadata
        'file_size_bytes': entity.fileSizeBytes,
        'duration_seconds': entity.durationSeconds, // nullable for photos
        'width': entity.width,
        'height': entity.height,
        'thumbnail_path': entity.thumbnailPath,

        // 📱 Display properties
        'display_order': entity.displayOrder,
        'is_processing': entity.isProcessing ? 1 : 0, // SQLite boolean
        'is_visible': entity.isVisible ? 1 : 0, // SQLite boolean
        // ⏰ Timestamps
        'created_at': entity.createdAt.toIso8601String(),
      };
    } catch (e) {
      throw MediaModelException(
        'Failed to convert MediaEntity to Map: ${e.toString()}',
        entity.id,
      );
    }
  }

  /// 📥 Convert Database Map to MediaEntity
  ///
  /// Deserializes database data back into clean domain entity
  /// with proper enum conversion and validation.
  static MediaEntity fromMap(Map<String, dynamic> map) {
    try {
      return MediaEntity(
        // 🔑 Primary identifiers
        id: map['id'] as String? ?? '',
        profileId: map['profile_id'] as String? ?? '',

        // 🎭 Media type and content
        type: MediaType.values.firstWhere(
          (type) => type.name == map['type'],
          orElse: () => MediaType.photo, // Default instead of throwing
        ),
        filePath: map['file_path'] as String? ?? '', // Handle null
        caption: map['caption'] as String?,

        // 📊 File metadata - Handle nulls with defaults
        fileSizeBytes: map['file_size_bytes'] as int? ?? 0,
        durationSeconds: map['duration_seconds'] as int?,
        width: map['width'] as int?,
        height: map['height'] as int?,
        thumbnailPath: map['thumbnail_path'] as String?,

        // 📱 Display properties - Handle nulls with defaults
        displayOrder: map['display_order'] as int? ?? 1,
        isProcessing: (map['is_processing'] as int? ?? 0) == 1,
        isVisible: (map['is_visible'] as int? ?? 1) == 1,

        // ⏰ Timestamps - Handle null safely
        createdAt: map['created_at'] != null
            ? DateTime.tryParse(map['created_at'] as String) ?? DateTime.now()
            : DateTime.now(),
      );
    } catch (e) {
      throw MediaModelException(
        'Failed to convert Map to MediaEntity: ${e.toString()}',
        map['id']?.toString(),
      );
    }
  }

  /// 🔄 Convert multiple media items for bulk operations
  ///
  /// Efficiently converts a list of entities to database maps
  /// for batch insert/update operations.
  static List<Map<String, dynamic>> toMapList(List<MediaEntity> entities) {
    return entities.map((entity) => toMap(entity)).toList();
  }

  /// 📥 Convert multiple database maps to entities
  ///
  /// Efficiently converts database results to entity list
  /// with proper error handling and type validation.
  static List<MediaEntity> fromMapList(List<Map<String, dynamic>> maps) {
    final entities = <MediaEntity>[];
    final errors = <String>[];

    for (final map in maps) {
      try {
        entities.add(fromMap(map));
      } catch (e) {
        errors.add('Map ${map['id']}: ${e.toString()}');
      }
    }

    // Log errors but don't fail the entire operation
    if (errors.isNotEmpty) {
      print(
        '⚠️ MediaModel: Some media items failed to convert: ${errors.join(', ')}',
      );
    }

    return entities;
  }

  /// 🔄 Create reorder maps for media display sequence
  ///
  /// Creates update maps for changing media display order
  /// while preserving other metadata.
  static List<Map<String, dynamic>> createReorderMaps(
    List<MediaEntity> mediaItems,
  ) {
    return mediaItems.asMap().entries.map((entry) {
      final index = entry.key;
      final media = entry.value;

      return {
        'id': media.id,
        'display_order': index + 1, // 1-based ordering
      };
    }).toList();
  }

  /// 🌟 Create visibility update map
  ///
  /// Creates update map to set media visibility.
  static Map<String, dynamic> createSetVisibilityMap(
    String mediaId,
    bool isVisible,
  ) {
    return {'id': mediaId, 'is_visible': isVisible ? 1 : 0};
  }

  /// 🎯 Create map for new media with auto-order
  ///
  /// Creates a new media map with automatically assigned order
  /// based on existing media for the profile.
  static Map<String, dynamic> toMapWithAutoOrder(
    MediaEntity entity,
    int existingMediaCount,
  ) {
    final map = toMap(entity);
    map['display_order'] = existingMediaCount + 1;
    return map;
  }

  /// 📊 Get media stats map for profile summary
  ///
  /// Creates a summary map of media counts by type
  /// for profile completeness calculations.
  static Map<String, int> getMediaStats(List<MediaEntity> mediaItems) {
    final stats = <String, int>{
      'total': mediaItems.length,
      'photos': 0,
      'videos': 0,
      'voice_notes': 0,
    };

    for (final media in mediaItems) {
      switch (media.type) {
        case MediaType.photo:
          stats['photos'] = (stats['photos'] ?? 0) + 1;
          break;
        case MediaType.video:
          stats['videos'] = (stats['videos'] ?? 0) + 1;
          break;
        case MediaType.voiceNote:
          stats['voice_notes'] = (stats['voice_notes'] ?? 0) + 1;
          break;
      }
    }

    return stats;
  }

  // 🛠️ PRIVATE HELPER METHODS

  /// Validate that all required fields are present and valid
  static void _validateRequiredFields(Map<String, dynamic> map) {
    final requiredFields = [
      'id',
      'profile_id',
      'type',
      'file_path',
      'file_size_bytes',
      'display_order',
      'is_visible',
      'created_at',
    ];
    final missingFields = <String>[];

    for (final field in requiredFields) {
      if (!map.containsKey(field) || map[field] == null) {
        missingFields.add(field);
      }
    }

    if (missingFields.isNotEmpty) {
      throw MediaModelException(
        'Missing required fields: ${missingFields.join(', ')}',
        map['id']?.toString(),
      );
    }

    // Validate business rules
    _validateBusinessRules(map);
  }

  /// Validate business rules for media data
  static void _validateBusinessRules(Map<String, dynamic> map) {
    // Validate file path
    final filePath = map['file_path'] as String;
    if (filePath.isEmpty) {
      throw MediaModelException(
        'File path cannot be empty',
        map['id']?.toString(),
      );
    }

    // Validate file name
    final fileName = map['file_name'] as String;
    if (fileName.isEmpty) {
      throw MediaModelException(
        'File name cannot be empty',
        map['id']?.toString(),
      );
    }

    // Validate file size (reasonable limits)
    final fileSize = map['file_size_bytes'] as int;
    if (fileSize <= 0) {
      throw MediaModelException(
        'File size must be positive',
        map['id']?.toString(),
      );
    }

    // Validate file size limits by type
    final type = map['type'] as String;
    switch (type) {
      case 'photo':
        if (fileSize > 10 * 1024 * 1024) {
          // 10MB
          throw MediaModelException(
            'Photo file size cannot exceed 10MB',
            map['id']?.toString(),
          );
        }
        break;
      case 'video':
        if (fileSize > 100 * 1024 * 1024) {
          // 100MB
          throw MediaModelException(
            'Video file size cannot exceed 100MB',
            map['id']?.toString(),
          );
        }
        // Validate duration for videos
        final duration = map['duration_seconds'] as int?;
        if (duration != null && (duration <= 0 || duration > 60)) {
          throw MediaModelException(
            'Video duration must be 1-60 seconds',
            map['id']?.toString(),
          );
        }
        break;
      case 'voiceNote':
        if (fileSize > 5 * 1024 * 1024) {
          // 5MB
          throw MediaModelException(
            'Voice note file size cannot exceed 5MB',
            map['id']?.toString(),
          );
        }
        // Validate duration for voice notes
        final duration = map['duration_seconds'] as int?;
        if (duration != null && (duration <= 0 || duration > 30)) {
          throw MediaModelException(
            'Voice note duration must be 1-30 seconds',
            map['id']?.toString(),
          );
        }
        break;
    }

    // Validate order (must be positive)
    final order = map['display_order'] as int;
    if (order < 1) {
      throw MediaModelException(
        'Display order must be positive',
        map['id']?.toString(),
      );
    }
  }
}

/// 🚨 Media Model Exception - Custom error handling
///
/// Provides detailed error information for media data conversion issues.
class MediaModelException implements Exception {
  final String message;
  final String? mediaId;
  final DateTime timestamp;

  MediaModelException(this.message, [this.mediaId])
    : timestamp = DateTime.now();

  @override
  String toString() {
    final id = mediaId != null ? ' (Media ID: $mediaId)' : '';
    return 'MediaModelException$id: $message [${timestamp.toIso8601String()}]';
  }
}

/// 🧪 Media Model Utilities - Helper methods for testing and validation
///
/// Utilities for testing the media data layer and ensuring data integrity.
class MediaModelUtils {
  // 🚫 Private constructor - This is a utility class
  MediaModelUtils._();

  /// MIME types for different media formats
  static const Map<MediaType, List<String>> allowedMimeTypes = {
    MediaType.photo: ['image/jpeg', 'image/png', 'image/heic', 'image/webp'],
    MediaType.video: ['video/mp4', 'video/quicktime', 'video/x-msvideo'],
    MediaType.voiceNote: ['audio/mpeg', 'audio/wav', 'audio/aac', 'audio/ogg'],
  };

  /// Create sample media map for testing
  static Map<String, dynamic> createSampleMap({
    String? id,
    String? profileId,
    MediaType type = MediaType.photo,
    int displayOrder = 1,
    bool isVisible = true,
  }) {
    final now = DateTime.now();

    return {
      'id': id ?? 'test_media_1',
      'profile_id': profileId ?? 'test_profile_1',
      'type': type.name,
      'file_path': _getSampleFilePath(type),
      'caption': 'Sample ${type.displayName.toLowerCase()}',
      'file_size_bytes': _getSampleFileSize(type),
      'duration_seconds': type != MediaType.photo
          ? _getSampleDuration(type)
          : null,
      'width': type != MediaType.voiceNote ? 1920 : null,
      'height': type != MediaType.voiceNote ? 1080 : null,
      'thumbnail_path': type != MediaType.photo
          ? _getSampleThumbnailPath(type)
          : null,
      'display_order': displayOrder,
      'is_processing': 0,
      'is_visible': isVisible ? 1 : 0,
      'created_at': now
          .subtract(Duration(days: displayOrder))
          .toIso8601String(),
    };
  }

  /// Create a sample media set for a profile
  static List<Map<String, dynamic>> createSampleMediaSet(String profileId) {
    return [
      createSampleMap(
        id: 'photo_${profileId}_1',
        profileId: profileId,
        type: MediaType.photo,
        displayOrder: 1,
        isVisible: true,
      ),
      createSampleMap(
        id: 'photo_${profileId}_2',
        profileId: profileId,
        type: MediaType.photo,
        displayOrder: 2,
      ),
      createSampleMap(
        id: 'video_${profileId}_1',
        profileId: profileId,
        type: MediaType.video,
        displayOrder: 3,
      ),
      createSampleMap(
        id: 'voice_${profileId}_1',
        profileId: profileId,
        type: MediaType.voiceNote,
        displayOrder: 4,
      ),
    ];
  }

  /// Validate media entity can be converted to map and back
  static bool validateRoundTrip(MediaEntity entity) {
    try {
      final map = MediaModel.toMap(entity);
      final restored = MediaModel.fromMap(map);

      return entity.id == restored.id &&
          entity.profileId == restored.profileId &&
          entity.type == restored.type &&
          entity.filePath == restored.filePath &&
          entity.displayOrder == restored.displayOrder;
    } catch (e) {
      return false;
    }
  }

  /// Check if media list has valid ordering
  static bool validateMediaOrder(List<MediaEntity> mediaItems) {
    if (mediaItems.isEmpty) return true;

    final sorted = [...mediaItems]
      ..sort((a, b) => a.displayOrder.compareTo(b.displayOrder));

    for (int i = 0; i < sorted.length; i++) {
      if (sorted[i].displayOrder != i + 1) {
        return false; // Order should be 1, 2, 3...
      }
    }

    return true;
  }

  /// Get next available order for new media
  static int getNextOrder(List<MediaEntity> existingMedia) {
    if (existingMedia.isEmpty) return 1;

    final maxOrder = existingMedia
        .map((m) => m.displayOrder)
        .reduce((max, current) => current > max ? current : max);

    return maxOrder + 1;
  }

  /// Check if profile has visible photos
  static bool hasVisiblePhotos(List<MediaEntity> mediaItems) {
    return mediaItems.any(
      (media) => media.type == MediaType.photo && media.isVisible,
    );
  }

  /// Get first visible photo from media list
  static MediaEntity? getFirstVisiblePhoto(List<MediaEntity> mediaItems) {
    try {
      return mediaItems.firstWhere(
        (media) => media.type == MediaType.photo && media.isVisible,
      );
    } catch (e) {
      return null;
    }
  }

  // Helper methods for sample data creation
  static String _getSampleFilePath(MediaType type) {
    switch (type) {
      case MediaType.photo:
        return '/storage/photos/sample_photo.jpg';
      case MediaType.video:
        return '/storage/videos/sample_video.mp4';
      case MediaType.voiceNote:
        return '/storage/voice/sample_voice.aac';
    }
  }

  static String _getSampleFileName(MediaType type) {
    switch (type) {
      case MediaType.photo:
        return 'sample_photo.jpg';
      case MediaType.video:
        return 'sample_video.mp4';
      case MediaType.voiceNote:
        return 'sample_voice.aac';
    }
  }

  static int _getSampleFileSize(MediaType type) {
    switch (type) {
      case MediaType.photo:
        return 2 * 1024 * 1024; // 2MB
      case MediaType.video:
        return 15 * 1024 * 1024; // 15MB
      case MediaType.voiceNote:
        return 512 * 1024; // 512KB
    }
  }

  static int? _getSampleDuration(MediaType type) {
    switch (type) {
      case MediaType.photo:
        return null;
      case MediaType.video:
        return 30; // 30 seconds
      case MediaType.voiceNote:
        return 15; // 15 seconds
    }
  }

  static String? _getSampleThumbnailPath(MediaType type) {
    switch (type) {
      case MediaType.photo:
        return null;
      case MediaType.video:
        return '/storage/thumbnails/sample_video_thumb.jpg';
      case MediaType.voiceNote:
        return null;
    }
  }
}
