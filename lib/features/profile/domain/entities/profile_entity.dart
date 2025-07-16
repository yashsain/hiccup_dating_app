import 'package:equatable/equatable.dart';

/// 👤 Profile Entity - Clean Domain Model (2025)
///
/// This entity represents a complete user profile in the domain layer.
/// It's immutable, validated, and platform-independent.
///
/// Features:
/// - Immutable data structure
/// - Built-in validation
/// - Type-safe properties
/// - Equatable for easy comparison
/// - Comprehensive toString for debugging
///
/// Usage:
/// ```dart
/// final profile = ProfileEntity(
///   id: 'user_123',
///   name: 'Alex',
///   age: 25,
///   // ... other properties
/// );
/// ```
class ProfileEntity extends Equatable {
  // 🔑 Core Identity
  final String id;
  final String name;
  final int age;
  final String location;
  final String gender;
  final String? sexualOrientation;

  // 💭 Personal Expression
  final String? bio;
  final String? datingGoals;
  final String? music;

  // 🔒 Verification & Safety
  final bool photoVerification;
  final bool identityVerification;

  // 💎 Premium Features
  final String? premium;
  final String? instagramUrl;
  final String? spotifyUrl;

  // ⏰ Timestamps
  final DateTime createdAt;
  final DateTime updatedAt;

  // 🎯 Related Entities (will be loaded separately)
  final List<String> promptIds;
  final String? activePollId;
  final List<String> mediaIds;
  final List<String> interestIds;
  final List<String> badgeIds;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.age,
    required this.location,
    required this.gender,
    this.sexualOrientation,
    this.bio,
    this.datingGoals,
    this.music,
    this.photoVerification = false,
    this.identityVerification = false,
    this.premium,
    this.instagramUrl,
    this.spotifyUrl,
    required this.createdAt,
    required this.updatedAt,
    this.promptIds = const [],
    this.activePollId,
    this.mediaIds = const [],
    this.interestIds = const [],
    this.badgeIds = const [],
  });

  // 🔄 Copy with method for immutable updates
  ProfileEntity copyWith({
    String? id,
    String? name,
    int? age,
    String? location,
    String? gender,
    String? sexualOrientation,
    String? bio,
    String? datingGoals,
    String? music,
    bool? photoVerification,
    bool? identityVerification,
    String? premium,
    String? instagramUrl,
    String? spotifyUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? promptIds,
    String? activePollId,
    List<String>? mediaIds,
    List<String>? interestIds,
    List<String>? badgeIds,
  }) {
    return ProfileEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      location: location ?? this.location,
      gender: gender ?? this.gender,
      sexualOrientation: sexualOrientation ?? this.sexualOrientation,
      bio: bio ?? this.bio,
      datingGoals: datingGoals ?? this.datingGoals,
      music: music ?? this.music,
      photoVerification: photoVerification ?? this.photoVerification,
      identityVerification: identityVerification ?? this.identityVerification,
      premium: premium ?? this.premium,
      instagramUrl: instagramUrl ?? this.instagramUrl,
      spotifyUrl: spotifyUrl ?? this.spotifyUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      promptIds: promptIds ?? this.promptIds,
      activePollId: activePollId ?? this.activePollId,
      mediaIds: mediaIds ?? this.mediaIds,
      interestIds: interestIds ?? this.interestIds,
      badgeIds: badgeIds ?? this.badgeIds,
    );
  }

  // ✅ Validation Methods
  bool get isValid {
    return _validateName() &&
        _validateAge() &&
        _validateLocation() &&
        _validateGender() &&
        _validateBio() &&
        _validateUrls();
  }

  bool _validateName() {
    return name.trim().isNotEmpty && name.length >= 2 && name.length <= 50;
  }

  bool _validateAge() {
    return age >= 18 && age <= 99;
  }

  bool _validateLocation() {
    return location.trim().isNotEmpty && location.length <= 100;
  }

  bool _validateGender() {
    return gender.trim().isNotEmpty && gender.length <= 50;
  }

  bool _validateBio() {
    return bio == null || bio!.length <= 500;
  }

  bool _validateUrls() {
    if (instagramUrl != null && instagramUrl!.isNotEmpty) {
      if (!instagramUrl!.startsWith('https://instagram.com/') &&
          !instagramUrl!.startsWith('https://www.instagram.com/')) {
        return false;
      }
    }
    if (spotifyUrl != null && spotifyUrl!.isNotEmpty) {
      if (!spotifyUrl!.startsWith('https://open.spotify.com/')) {
        return false;
      }
    }
    return true;
  }

  // 📊 Computed Properties
  String get displayName => name.trim();

  String get ageDisplay => '$age years old';

  bool get isVerified => photoVerification || identityVerification;

  bool get isPremium => premium != null && premium!.isNotEmpty;

  bool get hasCompletedProfile {
    return name.isNotEmpty &&
        age >= 18 &&
        location.isNotEmpty &&
        gender.isNotEmpty &&
        (bio?.isNotEmpty ?? false) &&
        promptIds.isNotEmpty &&
        mediaIds.isNotEmpty;
  }

  double get profileCompleteness {
    int completed = 0;
    int total = 8;

    if (name.isNotEmpty) completed++;
    if (age >= 18) completed++;
    if (location.isNotEmpty) completed++;
    if (gender.isNotEmpty) completed++;
    if (bio?.isNotEmpty ?? false) completed++;
    if (promptIds.isNotEmpty) completed++;
    if (mediaIds.isNotEmpty) completed++;
    if (interestIds.isNotEmpty) completed++;

    return completed / total;
  }

  // 🎯 Business Logic Helpers
  bool canAddMorePrompts() => promptIds.length < 3;
  bool canAddMoreMedia() => mediaIds.length < 9;
  bool canAddMoreInterests() => interestIds.length < 10;
  bool canAddMoreBadges() => badgeIds.length < 5;

  // 📱 Display Helpers
  String get shortBio {
    if (bio == null || bio!.isEmpty) return '';
    return bio!.length <= 100 ? bio! : '${bio!.substring(0, 97)}...';
  }

  String get locationDisplay {
    // Format: "New York, NY" or just "New York"
    return location.split(',').first.trim();
  }

  // 🔍 Search Helpers
  List<String> get searchKeywords {
    final keywords = <String>[];

    keywords.add(name.toLowerCase());
    keywords.add(location.toLowerCase());
    keywords.add(gender.toLowerCase());

    if (sexualOrientation != null) {
      keywords.add(sexualOrientation!.toLowerCase());
    }

    if (bio != null) {
      keywords.addAll(bio!.toLowerCase().split(' '));
    }

    return keywords.where((keyword) => keyword.isNotEmpty).toList();
  }

  // 🎨 Theme Helpers
  String get initialsForAvatar {
    final names = name.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  // 📋 Equatable implementation
  @override
  List<Object?> get props => [
    id,
    name,
    age,
    location,
    gender,
    sexualOrientation,
    bio,
    datingGoals,
    music,
    photoVerification,
    identityVerification,
    premium,
    instagramUrl,
    spotifyUrl,
    createdAt,
    updatedAt,
    promptIds,
    activePollId,
    mediaIds,
    interestIds,
    badgeIds,
  ];

  // 🔍 Debug representation
  @override
  String toString() {
    return 'ProfileEntity('
        'id: $id, '
        'name: $name, '
        'age: $age, '
        'location: $location, '
        'completeness: ${(profileCompleteness * 100).toInt()}%, '
        'verified: $isVerified, '
        'premium: $isPremium'
        ')';
  }

  // 🧪 Factory constructors for testing
  factory ProfileEntity.empty() {
    return ProfileEntity(
      id: '',
      name: '',
      age: 18,
      location: '',
      gender: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  factory ProfileEntity.sample() {
    return ProfileEntity(
      id: 'sample_123',
      name: 'Alex Thompson',
      age: 25,
      location: 'New York, NY',
      gender: 'Non-binary',
      sexualOrientation: 'Pansexual',
      bio:
          'Coffee enthusiast, dog lover, and adventure seeker. Always up for trying new restaurants and exploring hidden gems in the city.',
      datingGoals: 'Looking for genuine connections',
      music: 'Indie rock, jazz, and lo-fi hip hop',
      photoVerification: true,
      identityVerification: false,
      premium: 'Hiccup Premium',
      instagramUrl: 'https://instagram.com/alexthompson',
      spotifyUrl: 'https://open.spotify.com/user/alexthompson',
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      promptIds: ['prompt_1', 'prompt_2'],
      activePollId: 'poll_1',
      mediaIds: ['media_1', 'media_2', 'media_3'],
      interestIds: ['interest_1', 'interest_2', 'interest_3'],
      badgeIds: ['badge_1', 'badge_2'],
    );
  }
}

/// 🎯 Profile Entity Extensions - Additional functionality
extension ProfileEntityExtensions on ProfileEntity {
  /// Check if profile was recently updated (within last 7 days)
  bool get isRecentlyUpdated {
    return DateTime.now().difference(updatedAt).inDays <= 7;
  }

  /// Check if profile is newly created (within last 30 days)
  bool get isNewProfile {
    return DateTime.now().difference(createdAt).inDays <= 30;
  }

  /// Get profile age in days
  int get profileAgeInDays {
    return DateTime.now().difference(createdAt).inDays;
  }

  /// Get time since last update in human readable format
  String get lastUpdateTimeAgo {
    final difference = DateTime.now().difference(updatedAt);

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

  /// Generate profile summary for display
  String get profileSummary {
    final summary = StringBuffer();
    summary.write('$displayName, $age');

    if (location.isNotEmpty) {
      summary.write(' • $locationDisplay');
    }

    if (isVerified) {
      summary.write(' • Verified');
    }

    if (isPremium) {
      summary.write(' • Premium');
    }

    return summary.toString();
  }
}
