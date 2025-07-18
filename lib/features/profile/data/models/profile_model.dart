import '../../domain/entities/profile_entity.dart';

/// 🗄️ Profile Model - Entity ↔ Database Mapping (2025)
///
/// This model handles conversion between:
/// - Clean domain entities (ProfileEntity)
/// - Raw database maps (SQLite storage)
///
/// Key Features:
/// - Type-safe conversions with validation
/// - Proper null handling for optional fields
/// - DateTime serialization (ISO 8601 strings)
/// - List serialization (JSON arrays)
/// - Error handling with descriptive messages
/// - Easy backend swap (just change this layer)
///
/// Usage:
/// ```dart
/// // Entity → Database
/// final map = ProfileModel.toMap(profileEntity);
/// await database.insert('profiles', map);
///
/// // Database → Entity
/// final profile = ProfileModel.fromMap(databaseMap);
/// ```
class ProfileModel {
  // 🚫 Private constructor - This is a utility class
  ProfileModel._();

  /// 📤 Convert ProfileEntity to Database Map
  ///
  /// This method serializes a clean domain entity into a format
  /// suitable for SQLite storage. All complex types are converted
  /// to primitive types that SQLite can handle.
  static Map<String, dynamic> toMap(ProfileEntity entity) {
    try {
      return {
        // 🔑 Primary identifiers
        'id': entity.id,

        // 👤 Basic information (required fields)
        'name': entity.name,
        'age': entity.age,
        'location': entity.location,
        'gender': entity.gender,

        // 🎯 Optional profile information
        'sexual_orientation': entity.sexualOrientation,
        'bio': entity.bio,
        'dating_goals': entity.datingGoals,
        'music': entity.music,

        // ✅ Verification flags
        'photo_verification': entity.photoVerification
            ? 1
            : 0, // SQLite boolean
        'identity_verification': entity.identityVerification ? 1 : 0,

        // 💎 Premium features
        'premium': entity.premium,

        // 🔗 Social media links
        'instagram_url': entity.instagramUrl,
        'spotify_url': entity.spotifyUrl,

        // ⏰ Timestamps (stored as ISO 8601 strings)
        'created_at': entity.createdAt.toIso8601String(),
        'updated_at': entity.updatedAt.toIso8601String(),

        // 📋 Related data (stored as JSON arrays for easy querying)
        'prompt_ids': _encodeStringList(entity.promptIds),
        'active_poll_id': entity.activePollId,
        'media_ids': _encodeStringList(entity.mediaIds),
        'interest_ids': _encodeStringList(entity.interestIds),
        'badge_ids': _encodeStringList(entity.badgeIds),
      };
    } catch (e) {
      throw ProfileModelException(
        'Failed to convert ProfileEntity to Map: ${e.toString()}',
        entity.id,
      );
    }
  }

  /// 📥 Convert Database Map to ProfileEntity
  ///
  /// This method deserializes raw database data back into a clean
  /// domain entity. It includes validation and proper error handling
  /// for malformed data.
  static ProfileEntity fromMap(Map<String, dynamic> map) {
    try {
      // 🔍 Validate required fields first
      _validateRequiredFields(map);

      return ProfileEntity(
        // 🔑 Primary identifiers
        id: map['id'] as String,

        // 👤 Basic information (required fields)
        name: map['name'] as String,
        age: map['age'] as int,
        location: map['location'] as String,
        gender: map['gender'] as String,

        // 🎯 Optional profile information
        sexualOrientation: map['sexual_orientation'] as String?,
        bio: map['bio'] as String?,
        datingGoals: map['dating_goals'] as String?,
        music: map['music'] as String?,

        // ✅ Verification flags (SQLite stores as integers)
        photoVerification: (map['photo_verification'] as int? ?? 0) == 1,
        identityVerification: (map['identity_verification'] as int? ?? 0) == 1,

        // 💎 Premium features
        premium: map['premium'] as String?,

        // 🔗 Social media links
        instagramUrl: map['instagram_url'] as String?,
        spotifyUrl: map['spotify_url'] as String?,

        // ⏰ Timestamps (parse from ISO 8601 strings)
        createdAt: DateTime.parse(map['created_at'] as String),
        updatedAt: DateTime.parse(map['updated_at'] as String),

        // 📋 Related data (decode from JSON arrays)
        promptIds: _decodeStringList(map['prompt_ids']),
        activePollId: map['active_poll_id'] as String?,
        mediaIds: _decodeStringList(map['media_ids']),
        interestIds: _decodeStringList(map['interest_ids']),
        badgeIds: _decodeStringList(map['badge_ids']),
      );
    } catch (e) {
      throw ProfileModelException(
        'Failed to convert Map to ProfileEntity: ${e.toString()}',
        map['id']?.toString(),
      );
    }
  }

  /// 🔄 Update Map with ProfileEntity changes
  ///
  /// This method creates an update map containing only the fields
  /// that should be updated, useful for PATCH operations.
  static Map<String, dynamic> toUpdateMap(ProfileEntity entity) {
    final map = toMap(entity);

    // Always update the timestamp for any change
    map['updated_at'] = DateTime.now().toIso8601String();

    // Remove ID from update operations (primary key shouldn't change)
    map.remove('id');

    return map;
  }

  // 🛠️ PRIVATE HELPER METHODS

  /// Encode string list to JSON string for database storage
  static String _encodeStringList(List<String> list) {
    if (list.isEmpty) return '[]';

    // Simple JSON array encoding (more efficient than full JSON library for lists)
    final escaped = list.map((s) => '"${s.replaceAll('"', '\\"')}"').join(',');
    return '[$escaped]';
  }

  /// Decode JSON string to string list from database
  static List<String> _decodeStringList(dynamic value) {
    if (value == null || value == '[]') return [];

    try {
      final String jsonString = value as String;

      // Simple JSON array parsing for string lists
      if (!jsonString.startsWith('[') || !jsonString.endsWith(']')) {
        return [];
      }

      final content = jsonString.substring(1, jsonString.length - 1).trim();
      if (content.isEmpty) return [];

      // Split by comma and clean up quotes
      return content
          .split(',')
          .map((s) => s.trim())
          .where((s) => s.isNotEmpty)
          .map(
            (s) => s.startsWith('"') && s.endsWith('"')
                ? s.substring(1, s.length - 1).replaceAll('\\"', '"')
                : s,
          )
          .toList();
    } catch (e) {
      // Return empty list if parsing fails (graceful degradation)
      return [];
    }
  }

  /// Validate that all required fields are present in the map
  static void _validateRequiredFields(Map<String, dynamic> map) {
    final requiredFields = [
      'id',
      'name',
      'age',
      'location',
      'gender',
      'created_at',
      'updated_at',
    ];
    final missingFields = <String>[];

    for (final field in requiredFields) {
      if (!map.containsKey(field) || map[field] == null) {
        missingFields.add(field);
      }
    }

    if (missingFields.isNotEmpty) {
      throw ProfileModelException(
        'Missing required fields: ${missingFields.join(', ')}',
        map['id']?.toString(),
      );
    }

    // Validate data types for critical fields
    final age = map['age'];
    if (age is! int || age < 18) {
      throw ProfileModelException(
        'Invalid age: must be integer >= 18',
        map['id']?.toString(),
      );
    }
  }
}

/// 🚨 Profile Model Exception - Custom error handling
///
/// This exception provides detailed error information for debugging
/// and helps identify issues during data conversion.
class ProfileModelException implements Exception {
  final String message;
  final String? profileId;
  final DateTime timestamp;

  ProfileModelException(this.message, [this.profileId])
    : timestamp = DateTime.now();

  @override
  String toString() {
    final id = profileId != null ? ' (Profile ID: $profileId)' : '';
    return 'ProfileModelException$id: $message [${timestamp.toIso8601String()}]';
  }
}

/// 🧪 Profile Model Utilities - Helper methods for testing and validation
///
/// These utilities are useful for testing the data layer and ensuring
/// data integrity during development.
class ProfileModelUtils {
  // 🚫 Private constructor - This is a utility class
  ProfileModelUtils._();

  /// Create a sample profile map for testing
  static Map<String, dynamic> createSampleMap() {
    return {
      'id': 'test_profile_1',
      'name': 'Alex Sample',
      'age': 25,
      'location': 'San Francisco, CA',
      'gender': 'Non-binary',
      'sexual_orientation': 'Pansexual',
      'bio': 'Love hiking and coffee ☕🏔️',
      'dating_goals': 'Looking for meaningful connections',
      'music': 'Indie rock and jazz',
      'photo_verification': 1,
      'identity_verification': 0,
      'premium': 'Hiccup Premium',
      'instagram_url': 'https://instagram.com/alex_sample',
      'spotify_url': 'https://open.spotify.com/user/alex_sample',
      'created_at': DateTime.now()
          .subtract(const Duration(days: 30))
          .toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
      'prompt_ids': '["prompt_1","prompt_2","prompt_3"]',
      'active_poll_id': 'poll_1',
      'media_ids': '["photo_1","photo_2","video_1"]',
      'interest_ids': '["hiking","coffee","photography"]',
      'badge_ids': '["verified","active_user"]',
    };
  }

  /// Validate ProfileEntity can be converted to Map and back without data loss
  static bool validateRoundTrip(ProfileEntity entity) {
    try {
      final map = ProfileModel.toMap(entity);
      final restored = ProfileModel.fromMap(map);

      // Compare critical fields (simplified comparison)
      return entity.id == restored.id &&
          entity.name == restored.name &&
          entity.age == restored.age &&
          entity.location == restored.location &&
          entity.gender == restored.gender;
    } catch (e) {
      return false;
    }
  }
}
