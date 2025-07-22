/// 🔧 Database Configuration - Constants & Settings (2025)
///
/// This file contains:
/// - Database configuration constants
/// - Table and column name definitions
/// - Database constraints and limits
/// - Media type definitions
/// - Error handling constants
///
/// Following 2025 best practices:
/// - Centralized configuration management
/// - Type-safe constants
/// - Clear documentation
/// - Maintainable structure
class DatabaseConfig {
  // 🚫 Private constructor - This class should not be instantiated
  DatabaseConfig._();

  // 🗄️ Database Settings
  static const String databaseName = 'hiccup_profiles.db';
  static const int databaseVersion = 1;
  static const int databaseCacheSize = 10000;

  // 📋 Table Names
  static const String profilesTable = 'profiles';
  static const String promptsTable = 'prompts';
  static const String pollsTable = 'polls';
  static const String mediaTable = 'media';
  static const String interestsTable = 'interests';
  static const String badgesTable = 'badges';

  // 👤 Profile Table Columns
  static const String profileIdColumn = 'id';
  static const String profileNameColumn = 'name';
  static const String profileAgeColumn = 'age';
  static const String profileLocationColumn = 'location';
  static const String profileGenderColumn = 'gender';
  static const String profileSexualOrientationColumn = 'sexual_orientation';
  static const String profileBioColumn = 'bio';
  static const String profileDatingGoalsColumn = 'dating_goals';
  static const String profileMusicColumn = 'music';
  static const String profilePhotoVerificationColumn = 'photo_verification';
  static const String profileIdentityVerificationColumn =
      'identity_verification';

  // 📊 Polls Table Columns
  static const String pollIdColumn = 'id';
  static const String pollProfileIdColumn = 'profile_id';
  static const String pollQuestionColumn = 'question';
  static const String pollOptionsColumn = 'options';
  static const String pollIsActiveColumn = 'is_active';
  static const String pollCreatedAtColumn = 'created_at';

  // 🎨 Media Table Columns
  static const String mediaIdColumn = 'id';
  static const String mediaProfileIdColumn = 'profile_id';
  static const String mediaTypeColumn = 'media_type';
  static const String mediaFilePathColumn = 'file_path';
  static const String mediaDisplayOrderColumn = 'display_order';
  static const String mediaCreatedAtColumn = 'created_at';

  // 🎯 Interests Table Columns
  static const String interestIdColumn = 'id';
  static const String interestProfileIdColumn = 'profile_id';
  static const String interestColumn = 'interest';
  static const String interestCreatedAtColumn = 'created_at';

  // 🏆 Badges Table Columns
  static const String badgeIdColumn = 'id';
  static const String badgeProfileIdColumn = 'profile_id';
  static const String badgeColumn = 'badge';
  static const String badgeCreatedAtColumn = 'created_at';

  // 🎭 Media Types
  static const String mediaTypePhoto = 'photo';
  static const String mediaTypeVideo = 'video';
  static const String mediaTypeVoiceNote = 'voice_note';

  // 📏 Data Constraints
  static const int maxProfileNameLength = 50;
  static const int maxLocationLength = 100;
  static const int maxGenderLength = 50;
  static const int maxSexualOrientationLength = 50;
  static const int maxBioLength = 500;
  static const int maxDatingGoalsLength = 50;
  static const int maxMusicLength = 100;
  static const int maxPremiumLength = 50;
  static const int maxPromptQuestionLength = 100;
  static const int maxPromptResponseLength = 150;
  static const int maxPollQuestionLength = 100;
  static const int maxPollOptionLength = 50;
  static const int maxInterestLength = 50;
  static const int maxBadgeLength = 50;
  static const int maxFilePathLength = 255;

  // 🔢 Limit Constants
  static const int maxPrompts = 3;
  static const int maxPhotos = 9;
  static const int maxVideos = 2;
  static const int maxVoiceNotes = 2;
  static const int maxInterests = 10;
  static const int maxBadges = 5;
  static const int maxPollOptions = 4;
  static const int minPollOptions = 2;
  static const int maxMediaDurationSeconds = 30;

  // 🎯 Age Constraints
  static const int minAge = 18;
  static const int maxAge = 99;

  // 📱 Database Queries - Common WHERE clauses
  static const String whereProfileById = '$profileIdColumn = ?';
  static const String wherePromptsByProfileId = '$promptProfileIdColumn = ?';
  static const String wherePollsByProfileId = '$pollProfileIdColumn = ?';
  static const String whereMediaByProfileId = '$mediaProfileIdColumn = ?';
  static const String whereInterestsByProfileId =
      '$interestProfileIdColumn = ?';
  static const String whereBadgesByProfileId = '$badgeProfileIdColumn = ?';
  static const String whereActivePoll = '$pollIsActiveColumn = 1';

  // 📋 Database Queries - Common ORDER BY clauses
  static const String orderByCreatedAtDesc = '$profileCreatedAtColumn DESC';
  static const String orderByUpdatedAtDesc = '$profileUpdatedAtColumn DESC';
  static const String orderByDisplayOrder = '$promptDisplayOrderColumn ASC';
  static const String orderByMediaDisplayOrder = '$mediaDisplayOrderColumn ASC';

  // 🔍 Database Queries - Common SELECT statements
  static const String selectAllProfiles = 'SELECT * FROM $profilesTable';
  static const String selectProfileById =
      'SELECT * FROM $profilesTable WHERE $whereProfileById';
  static const String selectPromptsByProfileId =
      'SELECT * FROM $promptsTable WHERE $wherePromptsByProfileId ORDER BY $orderByDisplayOrder';
  static const String selectPollsByProfileId =
      'SELECT * FROM $pollsTable WHERE $wherePollsByProfileId';
  static const String selectMediaByProfileId =
      'SELECT * FROM $mediaTable WHERE $whereMediaByProfileId ORDER BY $orderByMediaDisplayOrder';
  static const String selectInterestsByProfileId =
      'SELECT * FROM $interestsTable WHERE $whereInterestsByProfileId';
  static const String selectBadgesByProfileId =
      'SELECT * FROM $badgesTable WHERE $whereBadgesByProfileId';

  // 🔢 Database Queries - Count statements
  static const String countProfiles =
      'SELECT COUNT(*) as count FROM $profilesTable';
  static const String countPromptsByProfileId =
      'SELECT COUNT(*) as count FROM $promptsTable WHERE $wherePromptsByProfileId';
  static const String countMediaByProfileId =
      'SELECT COUNT(*) as count FROM $mediaTable WHERE $whereMediaByProfileId';

  // ⚠️ Error Messages
  static const String errorDatabaseNotInitialized = 'Database not initialized';
  static const String errorProfileNotFound = 'Profile not found';
  static const String errorInvalidProfileId = 'Invalid profile ID';
  static const String errorMaxPromptsReached =
      'Maximum number of prompts reached';
  static const String errorMaxPhotosReached =
      'Maximum number of photos reached';
  static const String errorMaxVideosReached =
      'Maximum number of videos reached';
  static const String errorMaxVoiceNotesReached =
      'Maximum number of voice notes reached';
  static const String errorMaxInterestsReached =
      'Maximum number of interests reached';
  static const String errorMaxBadgesReached =
      'Maximum number of badges reached';
  static const String errorInvalidAge =
      'Age must be between $minAge and $maxAge';
  static const String errorInvalidMediaType = 'Invalid media type';
  static const String errorDuplicateProfile = 'Profile already exists';
  static const String errorDatabaseConnection = 'Database connection failed';
  static const String errorDatabaseOperation = 'Database operation failed';

  // 👤 Additional Profile Table Columns
  static const String profilePremiumColumn = 'premium';
  static const String profileInstagramUrlColumn = 'instagram_url';
  static const String profileSpotifyUrlColumn = 'spotify_url';
  static const String profileActivePollidColumn = 'active_poll_id';
  static const String profileCreatedAtColumn = 'created_at';
  static const String profileUpdatedAtColumn = 'updated_at';

  // 📝 Prompt Table Columns
  static const String promptIdColumn = 'id';
  static const String promptProfileIdColumn = 'profile_id';
  static const String promptQuestionColumn = 'question';
  static const String promptResponseColumn = 'response';
  static const String promptDisplayOrderColumn = 'display_order';
  static const String promptCreatedAtColumn = 'created_at';

  // 📊 Poll Table Columns

  static const String pollVotesColumn = 'votes';
  static const String pollTotalVotesColumn = 'total_votes';

  // 🎥 Media Table Columns
  static const String mediaCaptionColumn = 'caption';
  static const String mediaFileSizeBytesColumn = 'file_size_bytes';
  static const String mediaDurationSecondsColumn = 'duration_seconds';
  static const String mediaWidthColumn = 'width';
  static const String mediaHeightColumn = 'height';
  static const String mediaThumbnailPathColumn = 'thumbnail_path';
  static const String mediaIsProcessingColumn = 'is_processing';
  static const String mediaIsVisibleColumn = 'is_visible';

  // 🎯 Interest Table Columns

  static const String interestCategoryColumn = 'category';
  static const String interestIsCustomColumn = 'is_custom';
  static const String interestDisplayOrderColumn = 'display_order';
  static const String interestPopularityColumn = 'popularity_score';

  // 🏆 Additional Badge Table Columns
  static const String badgeTypeColumn = 'type';
  static const String badgeDescriptionColumn = 'description';
  static const String badgeIsVisibleColumn = 'is_visible';
  static const String badgeIsRareColumn = 'is_rare';
  static const String badgeEarnedAtColumn = 'earned_at';
  static const String badgeExpiresAtColumn = 'expires_at';
  static const String badgeIconUrlColumn = 'icon_url';
  static const String badgeColorColumn = 'color';
  // 🏗️ SQL TABLE CREATION QUERIES

  /// Create profiles table SQL
  static const String createProfilesTableQuery =
      '''
    CREATE TABLE $profilesTable (
      $profileIdColumn TEXT PRIMARY KEY,
      $profileNameColumn TEXT NOT NULL,
      $profileAgeColumn INTEGER NOT NULL,
      $profileLocationColumn TEXT NOT NULL,
      $profileGenderColumn TEXT NOT NULL,
      $profileSexualOrientationColumn TEXT,
      $profileBioColumn TEXT,
      $profileDatingGoalsColumn TEXT,
      $profileMusicColumn TEXT,
      $profilePhotoVerificationColumn INTEGER DEFAULT 0,
      $profileIdentityVerificationColumn INTEGER DEFAULT 0,
      $profilePremiumColumn TEXT,
      $profileInstagramUrlColumn TEXT,
      $profileSpotifyUrlColumn TEXT,
      $profileCreatedAtColumn TEXT NOT NULL,
      $profileUpdatedAtColumn TEXT NOT NULL,
      $profileActivePollidColumn TEXT,
      FOREIGN KEY ($profileActivePollidColumn) REFERENCES $pollsTable($pollIdColumn)
    );
  ''';

  /// Create prompts table SQL
  static const String createPromptsTableQuery =
      '''
    CREATE TABLE $promptsTable (
      $promptIdColumn TEXT PRIMARY KEY,
      $promptProfileIdColumn TEXT NOT NULL,
      $promptQuestionColumn TEXT NOT NULL,
      $promptResponseColumn TEXT NOT NULL,
      $promptDisplayOrderColumn INTEGER NOT NULL,
      $promptCreatedAtColumn TEXT NOT NULL,
      FOREIGN KEY ($promptProfileIdColumn) REFERENCES $profilesTable($profileIdColumn) ON DELETE CASCADE
    );
  ''';

  /// Create polls table SQL
  static const String createPollsTableQuery =
      '''
    CREATE TABLE $pollsTable (
      $pollIdColumn TEXT PRIMARY KEY,
      $pollProfileIdColumn TEXT NOT NULL,
      $pollQuestionColumn TEXT NOT NULL,
      $pollOptionsColumn TEXT NOT NULL,
      $pollIsActiveColumn INTEGER DEFAULT 1,
      $pollVotesColumn TEXT DEFAULT '{}',
      $pollTotalVotesColumn INTEGER DEFAULT 0,
      $pollCreatedAtColumn TEXT NOT NULL,
      FOREIGN KEY ($pollProfileIdColumn) REFERENCES $profilesTable($profileIdColumn) ON DELETE CASCADE
    );
  ''';

  /// Create media table SQL
  static const String createMediaTableQuery =
      '''
    CREATE TABLE $mediaTable (
      $mediaIdColumn TEXT PRIMARY KEY,
      $mediaProfileIdColumn TEXT NOT NULL,
      $mediaFilePathColumn TEXT NOT NULL,
      $mediaTypeColumn TEXT NOT NULL,
      $mediaDisplayOrderColumn INTEGER NOT NULL,
      $mediaCaptionColumn TEXT,
      $mediaFileSizeBytesColumn INTEGER DEFAULT 0,
      $mediaDurationSecondsColumn INTEGER,
      $mediaWidthColumn INTEGER,
      $mediaHeightColumn INTEGER,
      $mediaThumbnailPathColumn TEXT,
      $mediaIsProcessingColumn INTEGER DEFAULT 0,
      $mediaIsVisibleColumn INTEGER DEFAULT 1,
      $mediaCreatedAtColumn TEXT NOT NULL,
      FOREIGN KEY ($mediaProfileIdColumn) REFERENCES $profilesTable($profileIdColumn) ON DELETE CASCADE
    );
  ''';

  /// Create interests table SQL
  static const String createInterestsTableQuery =
      '''
  CREATE TABLE $interestsTable (
    $interestIdColumn TEXT PRIMARY KEY,
    $interestProfileIdColumn TEXT NOT NULL,
    $interestColumn TEXT NOT NULL,
    $interestCategoryColumn TEXT,
    $interestIsCustomColumn INTEGER DEFAULT 0,
    $interestDisplayOrderColumn INTEGER,
    $interestPopularityColumn INTEGER DEFAULT 0,
    $interestCreatedAtColumn TEXT NOT NULL,
    FOREIGN KEY ($interestProfileIdColumn) REFERENCES $profilesTable($profileIdColumn) ON DELETE CASCADE
  );
''';

  /// Create badges table SQL
  static const String createBadgesTableQuery =
      '''
    CREATE TABLE $badgesTable (
      $badgeIdColumn TEXT PRIMARY KEY,
      $badgeProfileIdColumn TEXT NOT NULL,
      $badgeColumn TEXT NOT NULL,
      $badgeTypeColumn TEXT NOT NULL,
      $badgeDescriptionColumn TEXT,
      $badgeIsVisibleColumn INTEGER DEFAULT 1,
      $badgeIsRareColumn INTEGER DEFAULT 0,
      $badgeEarnedAtColumn TEXT,
      $badgeExpiresAtColumn TEXT,
      $badgeIconUrlColumn TEXT,
      $badgeColorColumn TEXT,
      $badgeCreatedAtColumn TEXT NOT NULL,
      FOREIGN KEY ($badgeProfileIdColumn) REFERENCES $profilesTable($profileIdColumn) ON DELETE CASCADE
    );
  ''';

  // 🎯 Validation Methods

  /// Validate profile name
  static bool isValidProfileName(String name) {
    return name.isNotEmpty && name.length <= maxProfileNameLength;
  }

  /// Validate age
  static bool isValidAge(int age) {
    return age >= minAge && age <= maxAge;
  }

  /// Validate location
  static bool isValidLocation(String location) {
    return location.isNotEmpty && location.length <= maxLocationLength;
  }

  /// Validate bio
  static bool isValidBio(String bio) {
    return bio.length <= maxBioLength;
  }

  /// Validate prompt response
  static bool isValidPromptResponse(String response) {
    return response.isNotEmpty && response.length <= maxPromptResponseLength;
  }

  /// Validate poll question
  static bool isValidPollQuestion(String question) {
    return question.isNotEmpty && question.length <= maxPollQuestionLength;
  }

  /// Validate poll options
  static bool isValidPollOptions(List<String> options) {
    return options.length >= minPollOptions &&
        options.length <= maxPollOptions &&
        options.every(
          (option) => option.isNotEmpty && option.length <= maxPollOptionLength,
        );
  }

  /// Validate media type
  static bool isValidMediaType(String mediaType) {
    return [
      mediaTypePhoto,
      mediaTypeVideo,
      mediaTypeVoiceNote,
    ].contains(mediaType);
  }

  /// Validate interest
  static bool isValidInterest(String interest) {
    return interest.isNotEmpty && interest.length <= maxInterestLength;
  }

  /// Validate badge
  static bool isValidBadge(String badge) {
    return badge.isNotEmpty && badge.length <= maxBadgeLength;
  }

  /// Validate file path
  static bool isValidFilePath(String filePath) {
    return filePath.isNotEmpty && filePath.length <= maxFilePathLength;
  }

  /// Check if profile can add more prompts
  static bool canAddMorePrompts(int currentCount) {
    return currentCount < maxPrompts;
  }

  /// Check if profile can add more photos
  static bool canAddMorePhotos(int currentCount) {
    return currentCount < maxPhotos;
  }

  /// Check if profile can add more videos
  static bool canAddMoreVideos(int currentCount) {
    return currentCount < maxVideos;
  }

  /// Check if profile can add more voice notes
  static bool canAddMoreVoiceNotes(int currentCount) {
    return currentCount < maxVoiceNotes;
  }

  /// Check if profile can add more interests
  static bool canAddMoreInterests(int currentCount) {
    return currentCount < maxInterests;
  }

  /// Check if profile can add more badges
  static bool canAddMoreBadges(int currentCount) {
    return currentCount < maxBadges;
  }

  /// Get media type limits
  static int getMediaTypeLimit(String mediaType) {
    switch (mediaType) {
      case DatabaseConfig.mediaTypePhoto:
        return DatabaseConfig.maxPhotos;
      case DatabaseConfig.mediaTypeVideo:
        return DatabaseConfig.maxVideos;
      case DatabaseConfig.mediaTypeVoiceNote:
        return DatabaseConfig.maxVoiceNotes;
      default:
        return 0;
    }
  }

  /// Get all media types
  static List<String> get allMediaTypes => [
    mediaTypePhoto,
    mediaTypeVideo,
    mediaTypeVoiceNote,
  ];

  /// Get all table names
  static List<String> get allTables => [
    profilesTable,
    promptsTable,
    pollsTable,
    mediaTable,
    interestsTable,
    badgesTable,
  ];

  static String getTableQuery(String tableName) {
    switch (tableName) {
      case DatabaseConfig.profilesTable:
        return DatabaseConfig.createProfilesTableQuery;
      case DatabaseConfig.promptsTable:
        return DatabaseConfig.createPromptsTableQuery;
      case DatabaseConfig.pollsTable:
        return DatabaseConfig.createPollsTableQuery;
      case DatabaseConfig.mediaTable:
        return DatabaseConfig.createMediaTableQuery;
      case DatabaseConfig.interestsTable:
        return DatabaseConfig.createInterestsTableQuery;
      case DatabaseConfig.badgesTable:
        return DatabaseConfig.createBadgesTableQuery;
      default:
        throw ArgumentError('Unknown table: $tableName');
    }
  }

  /// Get current timestamp
  static int getCurrentTimestamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}

/// 🎯 Database Configuration Extensions - Additional utility methods
extension DatabaseConfigExtensions on DatabaseConfig {
  /// Get validation error message for profile data
  static String? getProfileValidationError(Map<String, dynamic> profileData) {
    if (profileData['name'] == null ||
        !DatabaseConfig.isValidProfileName(profileData['name'] as String)) {
      return 'Invalid profile name';
    }

    if (profileData['age'] == null ||
        !DatabaseConfig.isValidAge(profileData['age'] as int)) {
      return DatabaseConfig.errorInvalidAge;
    }

    if (profileData['location'] == null ||
        !DatabaseConfig.isValidLocation(profileData['location'] as String)) {
      return 'Invalid location';
    }

    if (profileData['bio'] != null &&
        !DatabaseConfig.isValidBio(profileData['bio'] as String)) {
      return 'Bio too long';
    }

    return null; // No validation errors
  }

  /// Get formatted table statistics
  static String formatTableStatistics(Map<String, int> stats) {
    final buffer = StringBuffer();
    buffer.writeln('📊 Database Statistics:');

    for (final entry in stats.entries) {
      buffer.writeln('  ${entry.key}: ${entry.value} records');
    }

    return buffer.toString();
  }
}
