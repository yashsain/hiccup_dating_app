import '../../domain/entities/profile_entity.dart';
import '../../domain/entities/prompt_entity.dart';
import '../../domain/entities/poll_entity.dart';
import '../../domain/entities/media_entity.dart';
import '../../domain/entities/interest_entity.dart';
import '../../domain/entities/badge_entity.dart';

/// 🎭 Sample Profiles - Rich Demo Data for Testing (2025)
///
/// This class provides 5 complete, realistic profiles for testing all app features:
/// - Discovery & matching algorithms
/// - Gift sending between profiles
/// - Chat conversations and icebreakers
/// - Profile completion scoring
/// - Interest-based recommendations
/// - Badge systems and verification states
///
/// Each profile includes:
/// ✅ Complete basic information
/// ✅ 3 engaging prompts with personality
/// ✅ 1 active poll for interaction
/// ✅ 4-6 media items (photos/videos)
/// ✅ 5-8 diverse interests across categories
/// ✅ 2-4 relevant badges
/// ✅ Realistic verification states
/// ✅ Premium mix for testing flows
///
/// Designed for:
/// - Frontend testing with realistic data
/// - Matching algorithm validation
/// - Gift/chat flow testing
/// - Easy backend swap preparation
class SampleProfiles {
  // 🚫 Private constructor - This is a utility class
  SampleProfiles._();

  /// Get all 5 sample profiles
  static List<ProfileEntity> get allProfiles => [
    alexChen,
    mayaPatel,
    jordanSmith,
    samRodriguez,
    caseyKim,
  ];

  /// Get all sample prompts for all profiles
  static List<PromptEntity> get allPrompts => [
    ...alexChenPrompts,
    ...mayaPatelPrompts,
    ...jordanSmithPrompts,
    ...samRodriguezPrompts,
    ...caseyKimPrompts,
  ];

  /// Get all sample polls for all profiles
  static List<PollEntity> get allPolls => [
    alexChenPoll,
    mayaPatelPoll,
    jordanSmithPoll,
    samRodriguezPoll,
    caseyKimPoll,
  ];

  /// Get all sample media for all profiles
  static List<MediaEntity> get allMedia => [
    ...alexChenMedia,
    ...mayaPatelMedia,
    ...jordanSmithMedia,
    ...samRodriguezMedia,
    ...caseyKimMedia,
  ];

  /// Get all sample interests for all profiles
  static List<InterestEntity> get allInterests => [
    ...alexChenInterests,
    ...mayaPatelInterests,
    ...jordanSmithInterests,
    ...samRodriguezInterests,
    ...caseyKimInterests,
  ];

  /// Get all sample badges for all profiles
  static List<BadgeEntity> get allBadges => [
    ...alexChenBadges,
    ...mayaPatelBadges,
    ...jordanSmithBadges,
    ...samRodriguezBadges,
    ...caseyKimBadges,
  ];

  // ============================================================================
  // 👨‍💻 ALEX CHEN - Tech Professional & Hiking Enthusiast
  // ============================================================================

  static const String alexChenId = 'alex_chen_001';

  /// Alex Chen - Tech professional who loves weekend hikes and specialty coffee
  static ProfileEntity get alexChen => ProfileEntity(
    id: alexChenId,
    name: 'Alex',
    age: 28,
    location: 'San Francisco, CA',
    gender: 'Non-binary',
    sexualOrientation: 'Pansexual',
    bio:
        'Full-stack developer who lives for weekend hikes and discovering new coffee shops ☕🏔️ Always up for deep conversations about tech, philosophy, or the best trail mix combinations!',
    datingGoals:
        'Looking for meaningful connections with fellow adventurers and thinkers',
    music:
        'Indie rock, lo-fi beats for coding, and whatever playlist matches the hiking trail',
    photoVerification: true,
    identityVerification: true,
    premium: 'Hiccup Premium',
    instagramUrl: 'https://instagram.com/alex_trails_code',
    spotifyUrl: 'https://open.spotify.com/user/alex_chen_sf',
    createdAt: DateTime.now().subtract(const Duration(days: 45)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
    promptIds: ['alex_prompt_1', 'alex_prompt_2', 'alex_prompt_3'],
    activePollId: 'alex_poll_1',
    mediaIds: [
      'alex_photo_1',
      'alex_photo_2',
      'alex_photo_3',
      'alex_photo_4',
      'alex_video_1',
    ],
    interestIds: [
      'alex_int_1',
      'alex_int_2',
      'alex_int_3',
      'alex_int_4',
      'alex_int_5',
      'alex_int_6',
    ],
    badgeIds: ['alex_badge_1', 'alex_badge_2', 'alex_badge_3'],
  );

  static List<PromptEntity> get alexChenPrompts => [
    PromptEntity(
      id: 'alex_prompt_1',
      profileId: alexChenId,
      question: 'Two truths and a lie',
      response:
          'I speak 3 languages fluently, I\'ve never broken a bone in my life, and I can solve a Rubik\'s cube in under 2 minutes 🧩',
      displayOrder: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    PromptEntity(
      id: 'alex_prompt_2',
      profileId: alexChenId,
      question: 'My ideal weekend looks like',
      response:
          'Saturday: Morning hike with podcast + coffee, afternoon coding a passion project, evening trying that new ramen place everyone\'s talking about 🍜',
      displayOrder: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
    ),
    PromptEntity(
      id: 'alex_prompt_3',
      profileId: alexChenId,
      question: 'I\'m overly competitive about',
      response:
          'Board games - sorry not sorry! I will absolutely strategize for 20 minutes on a single Settlers of Catan move 🎲',
      displayOrder: 3,
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
  ];

  static PollEntity get alexChenPoll => PollEntity(
    id: 'alex_poll_1',
    profileId: alexChenId,
    question: 'What\'s your ideal first date activity?',
    options: [
      'Coffee shop conversation',
      'Easy hiking trail',
      'Board game café',
      'Art museum',
    ],
    isActive: true,
    createdAt: DateTime.now().subtract(const Duration(days: 15)),
  );

  static List<MediaEntity> get alexChenMedia => [
    MediaEntity(
      id: 'alex_photo_1',
      profileId: alexChenId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
      caption: 'Sunset vibes after conquering Mount Tam 🌅',
      displayOrder: 1,
      width: 400,
      height: 600,
      fileSizeBytes: 2850000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 40)),
    ),
    MediaEntity(
      id: 'alex_photo_2',
      profileId: alexChenId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1556075798-4825dfaaf498?w=400',
      caption: 'Found the perfect coding spot ☕',
      displayOrder: 2,
      width: 400,
      height: 400,
      fileSizeBytes: 1920000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 35)),
    ),
    MediaEntity(
      id: 'alex_photo_3',
      profileId: alexChenId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1581833971358-2c8b550f87b3?w=400',
      caption: 'Board game night champion 🏆',
      displayOrder: 3,
      width: 400,
      height: 500,
      fileSizeBytes: 2340000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    MediaEntity(
      id: 'alex_photo_4',
      profileId: alexChenId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=400',
      caption: 'Debugging life, one line at a time 💻',
      displayOrder: 4,
      width: 400,
      height: 300,
      fileSizeBytes: 1650000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
    ),
    MediaEntity(
      id: 'alex_video_1',
      profileId: alexChenId,
      type: MediaType.video,
      filePath:
          'https://sample-videos.com/zip/10/mp4/480x360/sample_960x540_ocean_with_audio.mp4',
      caption: 'Quick trail review - this one\'s a keeper! 🥾',
      displayOrder: 5,
      width: 480,
      height: 360,
      fileSizeBytes: 8500000,
      durationSeconds: 45,
      thumbnailPath:
          'https://images.unsplash.com/photo-1551632811-561732d1e306?w=400',
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
  ];

  static List<InterestEntity> get alexChenInterests => [
    InterestEntity(
      id: 'alex_int_1',
      profileId: alexChenId,
      interest: 'Hiking',
      category: InterestCategory.outdoor,
      isCustom: false,
      popularity: 850,
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    InterestEntity(
      id: 'alex_int_2',
      profileId: alexChenId,
      interest: 'Coffee',
      category: InterestCategory.food,
      isCustom: false,
      popularity: 920,
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    InterestEntity(
      id: 'alex_int_3',
      profileId: alexChenId,
      interest: 'Programming',
      category: InterestCategory.technology,
      isCustom: false,
      popularity: 680,
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    InterestEntity(
      id: 'alex_int_4',
      profileId: alexChenId,
      interest: 'Board Games',
      category: InterestCategory.gaming,
      isCustom: false,
      popularity: 750,
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    InterestEntity(
      id: 'alex_int_5',
      profileId: alexChenId,
      interest: 'Photography',
      category: InterestCategory.creative,
      isCustom: false,
      popularity: 890,
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    InterestEntity(
      id: 'alex_int_6',
      profileId: alexChenId,
      interest: 'Philosophy',
      category: InterestCategory.reading,
      isCustom: false,
      popularity: 420,
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
  ];

  static List<BadgeEntity> get alexChenBadges => [
    BadgeEntity(
      id: 'alex_badge_1',
      profileId: alexChenId,
      badge: 'Verified',
      type: BadgeType.verification,
      description: 'Photo and identity verified',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 40)),
      createdAt: DateTime.now().subtract(const Duration(days: 40)),
    ),
    BadgeEntity(
      id: 'alex_badge_2',
      profileId: alexChenId,
      badge: 'Early Adopter',
      type: BadgeType.achievement,
      description: 'Joined Hiccup in the first month',
      isVisible: true,
      isRare: true,
      earnedAt: DateTime.now().subtract(const Duration(days: 45)),
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    BadgeEntity(
      id: 'alex_badge_3',
      profileId: alexChenId,
      badge: 'Tech Enthusiast',
      type: BadgeType.interest,
      description: 'Active in technology discussions',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 30)),
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
  ];

  // ============================================================================
  // 🎨 MAYA PATEL - Creative Artist & Music Lover
  // ============================================================================

  static const String mayaPatelId = 'maya_patel_002';

  /// Maya Patel - Creative artist passionate about music and self-expression
  static ProfileEntity get mayaPatel => ProfileEntity(
    id: mayaPatelId,
    name: 'Maya',
    age: 26,
    location: 'Brooklyn, NY',
    gender: 'Female',
    sexualOrientation: 'Bisexual',
    bio:
        'Digital artist by day, vinyl collector by night 🎨🎵 I believe life is too short for boring conversations and bad music. Always down to explore new galleries or dive bars with good playlists!',
    datingGoals:
        'Seeking someone who appreciates art, music, and spontaneous adventures',
    music:
        'Everything from classic jazz to experimental electronic - currently obsessed with FKA twigs',
    photoVerification: true,
    identityVerification: false,
    premium: null,
    instagramUrl: 'https://instagram.com/maya_creates_magic',
    spotifyUrl: 'https://open.spotify.com/user/maya_vinyl_vibes',
    createdAt: DateTime.now().subtract(const Duration(days: 32)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 6)),
    promptIds: ['maya_prompt_1', 'maya_prompt_2', 'maya_prompt_3'],
    activePollId: 'maya_poll_1',
    mediaIds: [
      'maya_photo_1',
      'maya_photo_2',
      'maya_photo_3',
      'maya_photo_4',
      'maya_video_1',
      'maya_audio_1',
    ],
    interestIds: [
      'maya_int_1',
      'maya_int_2',
      'maya_int_3',
      'maya_int_4',
      'maya_int_5',
      'maya_int_6',
      'maya_int_7',
    ],
    badgeIds: ['maya_badge_1', 'maya_badge_2'],
  );

  static List<PromptEntity> get mayaPatelPrompts => [
    PromptEntity(
      id: 'maya_prompt_1',
      profileId: mayaPatelId,
      question: 'The way to my heart is',
      response:
          'Through a perfectly curated playlist and maybe some late-night philosophical conversations about whether art truly imitates life 🎭',
      displayOrder: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 28)),
    ),
    PromptEntity(
      id: 'maya_prompt_2',
      profileId: mayaPatelId,
      question: 'I want someone who',
      response:
          'Gets excited about random museum exhibits, doesn\'t judge my 3am creative spurts, and can appreciate both Coltrane and Charli XCX 🎷',
      displayOrder: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
    ),
    PromptEntity(
      id: 'maya_prompt_3',
      profileId: mayaPatelId,
      question: 'My most controversial opinion is',
      response:
          'Pineapple on pizza is amazing AND digital art is just as valid as traditional mediums. Fight me (respectfully) 🍍🎨',
      displayOrder: 3,
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
  ];

  static PollEntity get mayaPatelPoll => PollEntity(
    id: 'maya_poll_1',
    profileId: mayaPatelId,
    question: 'Which creative date sounds most appealing?',
    options: [
      'Art gallery opening',
      'Vinyl record shopping',
      'Paint & sip class',
      'Live jazz performance',
    ],
    isActive: true,
    createdAt: DateTime.now().subtract(const Duration(days: 18)),
  );

  static List<MediaEntity> get mayaPatelMedia => [
    MediaEntity(
      id: 'maya_photo_1',
      profileId: mayaPatelId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=400',
      caption: 'Self-portrait Sunday vibes ✨',
      displayOrder: 1,
      width: 400,
      height: 600,
      fileSizeBytes: 3200000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    MediaEntity(
      id: 'maya_photo_2',
      profileId: mayaPatelId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1541961017774-22349e4a1262?w=400',
      caption: 'Latest digital piece - still obsessing over these colors 🎨',
      displayOrder: 2,
      width: 400,
      height: 400,
      fileSizeBytes: 2750000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
    ),
    MediaEntity(
      id: 'maya_photo_3',
      profileId: mayaPatelId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400',
      caption: 'Vinyl hunting success! Found this gem for \$5 🎵',
      displayOrder: 3,
      width: 400,
      height: 400,
      fileSizeBytes: 2100000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
    MediaEntity(
      id: 'maya_photo_4',
      profileId: mayaPatelId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?w=400',
      caption: 'Gallery opening last week - so inspiring! 🖼️',
      displayOrder: 4,
      width: 400,
      height: 500,
      fileSizeBytes: 2980000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
    MediaEntity(
      id: 'maya_video_1',
      profileId: mayaPatelId,
      type: MediaType.video,
      filePath:
          'https://sample-videos.com/zip/10/mp4/480x360/sample_960x540_ocean_with_audio.mp4',
      caption: 'Time-lapse of my latest piece coming to life ⏰',
      displayOrder: 5,
      width: 480,
      height: 360,
      fileSizeBytes: 12800000,
      durationSeconds: 60,
      thumbnailPath:
          'https://images.unsplash.com/photo-1541961017774-22349e4a1262?w=400',
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 12)),
    ),
    MediaEntity(
      id: 'maya_audio_1',
      profileId: mayaPatelId,
      type: MediaType.voiceNote,
      filePath: 'https://sample-audio.com/sample_voice_note.mp3',
      caption: 'Quick voice note about my favorite Brooklyn coffee spot ☕',
      displayOrder: 6,
      fileSizeBytes: 850000,
      durationSeconds: 30,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 8)),
    ),
  ];

  static List<InterestEntity> get mayaPatelInterests => [
    InterestEntity(
      id: 'maya_int_1',
      profileId: mayaPatelId,
      interest: 'Digital Art',
      category: InterestCategory.creative,
      isCustom: false,
      popularity: 650,
      createdAt: DateTime.now().subtract(const Duration(days: 32)),
    ),
    InterestEntity(
      id: 'maya_int_2',
      profileId: mayaPatelId,
      interest: 'Vinyl Records',
      category: InterestCategory.creative,
      isCustom: false,
      popularity: 480,
      createdAt: DateTime.now().subtract(const Duration(days: 32)),
    ),
    InterestEntity(
      id: 'maya_int_3',
      profileId: mayaPatelId,
      interest: 'Jazz Music',
      category: InterestCategory.creative,
      isCustom: false,
      popularity: 520,
      createdAt: DateTime.now().subtract(const Duration(days: 32)),
    ),
    InterestEntity(
      id: 'maya_int_4',
      profileId: mayaPatelId,
      interest: 'Museums',
      category: InterestCategory.creative,
      isCustom: false,
      popularity: 720,
      createdAt: DateTime.now().subtract(const Duration(days: 32)),
    ),
    InterestEntity(
      id: 'maya_int_5',
      profileId: mayaPatelId,
      interest: 'Brooklyn Food Scene',
      category: InterestCategory.food,
      isCustom: true,
      popularity: 380,
      createdAt: DateTime.now().subtract(const Duration(days: 32)),
    ),
    InterestEntity(
      id: 'maya_int_6',
      profileId: mayaPatelId,
      interest: 'Electronic Music',
      category: InterestCategory.creative,
      isCustom: false,
      popularity: 690,
      createdAt: DateTime.now().subtract(const Duration(days: 32)),
    ),
    InterestEntity(
      id: 'maya_int_7',
      profileId: mayaPatelId,
      interest: 'Philosophy',
      category: InterestCategory.reading,
      isCustom: false,
      popularity: 420,
      createdAt: DateTime.now().subtract(const Duration(days: 32)),
    ),
  ];

  static List<BadgeEntity> get mayaPatelBadges => [
    BadgeEntity(
      id: 'maya_badge_1',
      profileId: mayaPatelId,
      badge: 'Verified',
      type: BadgeType.verification,
      description: 'Photo verified',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 30)),
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    BadgeEntity(
      id: 'maya_badge_2',
      profileId: mayaPatelId,
      badge: 'Creative Soul',
      type: BadgeType.interest,
      description: 'Active in creative communities',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 25)),
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
    ),
  ];

  // ============================================================================
  // 💪 JORDAN SMITH - Fitness Trainer & Adventure Seeker
  // ============================================================================

  static const String jordanSmithId = 'jordan_smith_003';

  /// Jordan Smith - Fitness trainer who lives for adrenaline and helping others
  static ProfileEntity get jordanSmith => ProfileEntity(
    id: jordanSmithId,
    name: 'Jordan',
    age: 30,
    location: 'Austin, TX',
    gender: 'Male',
    sexualOrientation: 'Straight',
    bio:
        'Personal trainer who believes fitness should be fun, not punishment 💪 When I\'m not helping clients crush their goals, you\'ll find me rock climbing, trying new workout classes, or planning my next adventure!',
    datingGoals:
        'Looking for an adventure buddy who loves staying active and trying new things',
    music:
        'High-energy playlists for workouts, but give me some country and indie folk for road trips',
    photoVerification: true,
    identityVerification: true,
    premium: 'Hiccup Premium',
    instagramUrl: 'https://instagram.com/jordan_adventure_fit',
    spotifyUrl: 'https://open.spotify.com/user/jordan_workout_vibes',
    createdAt: DateTime.now().subtract(const Duration(days: 28)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 12)),
    promptIds: ['jordan_prompt_1', 'jordan_prompt_2', 'jordan_prompt_3'],
    activePollId: 'jordan_poll_1',
    mediaIds: [
      'jordan_photo_1',
      'jordan_photo_2',
      'jordan_photo_3',
      'jordan_photo_4',
      'jordan_video_1',
    ],
    interestIds: [
      'jordan_int_1',
      'jordan_int_2',
      'jordan_int_3',
      'jordan_int_4',
      'jordan_int_5',
      'jordan_int_6',
    ],
    badgeIds: [
      'jordan_badge_1',
      'jordan_badge_2',
      'jordan_badge_3',
      'jordan_badge_4',
    ],
  );

  static List<PromptEntity> get jordanSmithPrompts => [
    PromptEntity(
      id: 'jordan_prompt_1',
      profileId: jordanSmithId,
      question: 'A life goal of mine is',
      response:
          'To climb El Capitan in Yosemite and help 100 people discover that they\'re stronger than they think they are 🧗‍♂️',
      displayOrder: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
    ),
    PromptEntity(
      id: 'jordan_prompt_2',
      profileId: jordanSmithId,
      question: 'You should NOT go out with me if',
      response:
          'You think rest days are for the weak or you hate being encouraged to try new things. I\'m definitely that person who suggests hiking dates! 🥾',
      displayOrder: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 22)),
    ),
    PromptEntity(
      id: 'jordan_prompt_3',
      profileId: jordanSmithId,
      question: 'My greatest strength is',
      response:
          'Making people believe in themselves. Whether it\'s their first pull-up or facing a fear, I\'ll be your biggest cheerleader 📣',
      displayOrder: 3,
      createdAt: DateTime.now().subtract(const Duration(days: 18)),
    ),
  ];

  static PollEntity get jordanSmithPoll => PollEntity(
    id: 'jordan_poll_1',
    profileId: jordanSmithId,
    question: 'What\'s your ideal adventure date?',
    options: [
      'Rock climbing gym',
      'Kayaking trip',
      'Hiking with picnic',
      'New fitness class',
    ],
    isActive: true,
    createdAt: DateTime.now().subtract(const Duration(days: 16)),
  );

  static List<MediaEntity> get jordanSmithMedia => [
    MediaEntity(
      id: 'jordan_photo_1',
      profileId: jordanSmithId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400',
      caption: 'Conquered this route after months of training! 🧗‍♂️',
      displayOrder: 1,
      width: 400,
      height: 600,
      fileSizeBytes: 3500000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 26)),
    ),
    MediaEntity(
      id: 'jordan_photo_2',
      profileId: jordanSmithId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=400',
      caption: 'Morning runs in Austin are unbeatable 🌅',
      displayOrder: 2,
      width: 400,
      height: 500,
      fileSizeBytes: 2900000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 22)),
    ),
    MediaEntity(
      id: 'jordan_photo_3',
      profileId: jordanSmithId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1517838277536-f5f99be501cd?w=400',
      caption: 'Client just hit their first bodyweight squat! 💪',
      displayOrder: 3,
      width: 400,
      height: 400,
      fileSizeBytes: 2600000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 18)),
    ),
    MediaEntity(
      id: 'jordan_photo_4',
      profileId: jordanSmithId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
      caption: 'Weekend adventure at Hamilton Pool 🏊‍♂️',
      displayOrder: 4,
      width: 400,
      height: 600,
      fileSizeBytes: 3800000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 14)),
    ),
    MediaEntity(
      id: 'jordan_video_1',
      profileId: jordanSmithId,
      type: MediaType.video,
      filePath:
          'https://sample-videos.com/zip/10/mp4/480x360/sample_960x540_ocean_with_audio.mp4',
      caption: 'Quick form check - perfect deadlift technique! 🏋️‍♂️',
      displayOrder: 5,
      width: 480,
      height: 360,
      fileSizeBytes: 15200000,
      durationSeconds: 20,
      thumbnailPath:
          'https://images.unsplash.com/photo-1517838277536-f5f99be501cd?w=400',
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
  ];

  static List<InterestEntity> get jordanSmithInterests => [
    InterestEntity(
      id: 'jordan_int_1',
      profileId: jordanSmithId,
      interest: 'Rock Climbing',
      category: InterestCategory.sports,
      isCustom: false,
      popularity: 620,
      createdAt: DateTime.now().subtract(const Duration(days: 28)),
    ),
    InterestEntity(
      id: 'jordan_int_2',
      profileId: jordanSmithId,
      interest: 'Personal Training',
      category: InterestCategory.sports,
      isCustom: false,
      popularity: 450,
      createdAt: DateTime.now().subtract(const Duration(days: 28)),
    ),
    InterestEntity(
      id: 'jordan_int_3',
      profileId: jordanSmithId,
      interest: 'Hiking',
      category: InterestCategory.outdoor,
      isCustom: false,
      popularity: 850,
      createdAt: DateTime.now().subtract(const Duration(days: 28)),
    ),
    InterestEntity(
      id: 'jordan_int_4',
      profileId: jordanSmithId,
      interest: 'Kayaking',
      category: InterestCategory.outdoor,
      isCustom: false,
      popularity: 580,
      createdAt: DateTime.now().subtract(const Duration(days: 28)),
    ),
    InterestEntity(
      id: 'jordan_int_5',
      profileId: jordanSmithId,
      interest: 'Adventure Travel',
      category: InterestCategory.travel,
      isCustom: false,
      popularity: 740,
      createdAt: DateTime.now().subtract(const Duration(days: 28)),
    ),
    InterestEntity(
      id: 'jordan_int_6',
      profileId: jordanSmithId,
      interest: 'Country Music',
      category: InterestCategory.creative,
      isCustom: false,
      popularity: 680,
      createdAt: DateTime.now().subtract(const Duration(days: 28)),
    ),
  ];

  static List<BadgeEntity> get jordanSmithBadges => [
    BadgeEntity(
      id: 'jordan_badge_1',
      profileId: jordanSmithId,
      badge: 'Verified',
      type: BadgeType.verification,
      description: 'Photo and identity verified',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 26)),
      createdAt: DateTime.now().subtract(const Duration(days: 26)),
    ),
    BadgeEntity(
      id: 'jordan_badge_2',
      profileId: jordanSmithId,
      badge: 'Fitness Pro',
      type: BadgeType.achievement,
      description: 'Certified personal trainer',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 25)),
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
    ),
    BadgeEntity(
      id: 'jordan_badge_3',
      profileId: jordanSmithId,
      badge: 'Adventure Seeker',
      type: BadgeType.interest,
      description: 'Active in outdoor communities',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 20)),
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
    BadgeEntity(
      id: 'jordan_badge_4',
      profileId: jordanSmithId,
      badge: 'Premium Member',
      type: BadgeType.premium,
      description: 'Hiccup Premium subscriber',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 15)),
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
  ];

  // ============================================================================
  // 🍳 SAM RODRIGUEZ - Chef & Food & Travel Enthusiast
  // ============================================================================

  static const String samRodriguezId = 'sam_rodriguez_004';

  /// Sam Rodriguez - Chef passionate about culinary adventures and travel
  static ProfileEntity get samRodriguez => ProfileEntity(
    id: samRodriguezId,
    name: 'Sam',
    age: 29,
    location: 'Portland, OR',
    gender: 'Male',
    sexualOrientation: 'Straight',
    bio:
        'Executive chef who believes food is love made edible 🍳❤️ Always experimenting with fusion cuisine and planning my next food-focused travel adventure. Warning: I will definitely cook for you!',
    datingGoals: 'Seeking a fellow foodie to explore flavors and cultures with',
    music:
        'Latin beats while cooking, jazz for wine tastings, indie folk for road trips',
    photoVerification: true,
    identityVerification: false,
    premium: null,
    instagramUrl: 'https://instagram.com/chef_sam_travels',
    spotifyUrl: 'https://open.spotify.com/user/sam_kitchen_jams',
    createdAt: DateTime.now().subtract(const Duration(days: 38)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 8)),
    promptIds: ['sam_prompt_1', 'sam_prompt_2', 'sam_prompt_3'],
    activePollId: 'sam_poll_1',
    mediaIds: [
      'sam_photo_1',
      'sam_photo_2',
      'sam_photo_3',
      'sam_photo_4',
      'sam_photo_5',
      'sam_video_1',
    ],
    interestIds: [
      'sam_int_1',
      'sam_int_2',
      'sam_int_3',
      'sam_int_4',
      'sam_int_5',
      'sam_int_6',
      'sam_int_7',
      'sam_int_8',
    ],
    badgeIds: ['sam_badge_1', 'sam_badge_2', 'sam_badge_3'],
  );

  static List<PromptEntity> get samRodriguezPrompts => [
    PromptEntity(
      id: 'sam_prompt_1',
      profileId: samRodriguezId,
      question: 'The way to my heart is',
      response:
          'Through your stomach, obviously! But really, it\'s sharing a meal you\'ve never tried before and watching your face light up 🥘',
      displayOrder: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 35)),
    ),
    PromptEntity(
      id: 'sam_prompt_2',
      profileId: samRodriguezId,
      question: 'I want someone who',
      response:
          'Is adventurous with food, doesn\'t mind flour in my hair after a long kitchen day, and dreams of eating our way through different countries 🌍',
      displayOrder: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    PromptEntity(
      id: 'sam_prompt_3',
      profileId: samRodriguezId,
      question: 'My most controversial opinion is',
      response:
          'Pineapple belongs on pizza AND in tacos. Cuban-Hawaiian fusion is my specialty - don\'t knock it \'til you try it! 🍍🌮',
      displayOrder: 3,
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
    ),
  ];

  static PollEntity get samRodriguezPoll => PollEntity(
    id: 'sam_poll_1',
    profileId: samRodriguezId,
    question: 'What\'s your ideal food date?',
    options: [
      'Cooking class together',
      'Food truck crawl',
      'Wine & cheese tasting',
      'Farmers market adventure',
    ],
    isActive: true,
    createdAt: DateTime.now().subtract(const Duration(days: 20)),
  );

  static List<MediaEntity> get samRodriguezMedia => [
    MediaEntity(
      id: 'sam_photo_1',
      profileId: samRodriguezId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
      caption: 'Just another day in paradise (aka my kitchen) 👨‍🍳',
      displayOrder: 1,
      width: 400,
      height: 600,
      fileSizeBytes: 3100000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 36)),
    ),
    MediaEntity(
      id: 'sam_photo_2',
      profileId: samRodriguezId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400',
      caption: 'Tonight\'s special: Korean-Mexican fusion tacos 🌮',
      displayOrder: 2,
      width: 400,
      height: 400,
      fileSizeBytes: 2800000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    MediaEntity(
      id: 'sam_photo_3',
      profileId: samRodriguezId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400',
      caption: 'Street food adventures in Thailand last month 🇹🇭',
      displayOrder: 3,
      width: 400,
      height: 500,
      fileSizeBytes: 3400000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
    ),
    MediaEntity(
      id: 'sam_photo_4',
      profileId: samRodriguezId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400',
      caption: 'Wine pairing session with the team 🍷',
      displayOrder: 4,
      width: 400,
      height: 400,
      fileSizeBytes: 2200000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
    MediaEntity(
      id: 'sam_photo_5',
      profileId: samRodriguezId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1543353071-873f17a7a088?w=400',
      caption: 'Portland farmer\'s market haul - inspiration for tonight! 🥕',
      displayOrder: 5,
      width: 400,
      height: 600,
      fileSizeBytes: 3700000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
    MediaEntity(
      id: 'sam_video_1',
      profileId: samRodriguezId,
      type: MediaType.video,
      filePath:
          'https://sample-videos.com/zip/10/mp4/480x360/sample_960x540_ocean_with_audio.mp4',
      caption: 'Quick knife skills demo - satisfying and useful! 🔪',
      displayOrder: 6,
      width: 480,
      height: 360,
      fileSizeBytes: 18500000,
      durationSeconds: 90,
      thumbnailPath:
          'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400',
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 12)),
    ),
  ];

  static List<InterestEntity> get samRodriguezInterests => [
    InterestEntity(
      id: 'sam_int_1',
      profileId: samRodriguezId,
      interest: 'Cooking',
      category: InterestCategory.food,
      isCustom: false,
      popularity: 930,
      createdAt: DateTime.now().subtract(const Duration(days: 38)),
    ),
    InterestEntity(
      id: 'sam_int_2',
      profileId: samRodriguezId,
      interest: 'Travel',
      category: InterestCategory.travel,
      isCustom: false,
      popularity: 890,
      createdAt: DateTime.now().subtract(const Duration(days: 38)),
    ),
    InterestEntity(
      id: 'sam_int_3',
      profileId: samRodriguezId,
      interest: 'Wine Tasting',
      category: InterestCategory.food,
      isCustom: false,
      popularity: 670,
      createdAt: DateTime.now().subtract(const Duration(days: 38)),
    ),
    InterestEntity(
      id: 'sam_int_4',
      profileId: samRodriguezId,
      interest: 'Food Photography',
      category: InterestCategory.creative,
      isCustom: false,
      popularity: 580,
      createdAt: DateTime.now().subtract(const Duration(days: 38)),
    ),
    InterestEntity(
      id: 'sam_int_5',
      profileId: samRodriguezId,
      interest: 'Street Food',
      category: InterestCategory.food,
      isCustom: false,
      popularity: 720,
      createdAt: DateTime.now().subtract(const Duration(days: 38)),
    ),
    InterestEntity(
      id: 'sam_int_6',
      profileId: samRodriguezId,
      interest: 'Latin Music',
      category: InterestCategory.creative,
      isCustom: false,
      popularity: 560,
      createdAt: DateTime.now().subtract(const Duration(days: 38)),
    ),
    InterestEntity(
      id: 'sam_int_7',
      profileId: samRodriguezId,
      interest: 'Fusion Cuisine',
      category: InterestCategory.food,
      isCustom: true,
      popularity: 320,
      createdAt: DateTime.now().subtract(const Duration(days: 38)),
    ),
    InterestEntity(
      id: 'sam_int_8',
      profileId: samRodriguezId,
      interest: 'Farmers Markets',
      category: InterestCategory.food,
      isCustom: false,
      popularity: 640,
      createdAt: DateTime.now().subtract(const Duration(days: 38)),
    ),
  ];

  static List<BadgeEntity> get samRodriguezBadges => [
    BadgeEntity(
      id: 'sam_badge_1',
      profileId: samRodriguezId,
      badge: 'Verified',
      type: BadgeType.verification,
      description: 'Photo verified',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 35)),
      createdAt: DateTime.now().subtract(const Duration(days: 35)),
    ),
    BadgeEntity(
      id: 'sam_badge_2',
      profileId: samRodriguezId,
      badge: 'Culinary Expert',
      type: BadgeType.achievement,
      description: 'Professional chef with 5+ years experience',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 30)),
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    BadgeEntity(
      id: 'sam_badge_3',
      profileId: samRodriguezId,
      badge: 'World Traveler',
      type: BadgeType.achievement,
      description: 'Visited 15+ countries',
      isVisible: true,
      isRare: true,
      earnedAt: DateTime.now().subtract(const Duration(days: 25)),
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
    ),
  ];

  // ============================================================================
  // 📚 CASEY KIM - Photographer, Bookworm & Coffee Enthusiast
  // ============================================================================

  static const String caseyKimId = 'casey_kim_005';

  /// Casey Kim - Photographer who finds magic in quiet moments and great books
  static ProfileEntity get caseyKim => ProfileEntity(
    id: caseyKimId,
    name: 'Casey',
    age: 27,
    location: 'Seattle, WA',
    gender: 'Non-binary',
    sexualOrientation: 'Queer',
    bio:
        'Freelance photographer who believes the best stories are found in quiet corners and golden hour light 📸☕ When I\'m not chasing perfect lighting, I\'m probably reading in a cozy café or planning my next photo walk!',
    datingGoals:
        'Looking for someone who appreciates life\'s quieter moments and deeper conversations',
    music:
        'Indie folk, acoustic covers, and whatever matches the current book I\'m reading',
    photoVerification: true,
    identityVerification: false,
    premium: null,
    instagramUrl: 'https://instagram.com/casey_captures_light',
    spotifyUrl: 'https://open.spotify.com/user/casey_reading_vibes',
    createdAt: DateTime.now().subtract(const Duration(days: 24)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 4)),
    promptIds: ['casey_prompt_1', 'casey_prompt_2', 'casey_prompt_3'],
    activePollId: 'casey_poll_1',
    mediaIds: [
      'casey_photo_1',
      'casey_photo_2',
      'casey_photo_3',
      'casey_photo_4',
    ],
    interestIds: [
      'casey_int_1',
      'casey_int_2',
      'casey_int_3',
      'casey_int_4',
      'casey_int_5',
      'casey_int_6',
    ],
    badgeIds: ['casey_badge_1', 'casey_badge_2'],
  );

  static List<PromptEntity> get caseyKimPrompts => [
    PromptEntity(
      id: 'casey_prompt_1',
      profileId: caseyKimId,
      question: 'I\'m weirdly attracted to',
      response:
          'People who get genuinely excited about small things - perfect lighting, a good book recommendation, or finding the ideal coffee shop corner 📚',
      displayOrder: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 22)),
    ),
    PromptEntity(
      id: 'casey_prompt_2',
      profileId: caseyKimId,
      question: 'My ideal weekend looks like',
      response:
          'Saturday photo walk through Pike Place, afternoon reading in a new café, Sunday developing film and planning next week\'s shoots 🎞️',
      displayOrder: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 18)),
    ),
    PromptEntity(
      id: 'casey_prompt_3',
      profileId: caseyKimId,
      question: 'Two truths and a lie',
      response:
          'I\'ve read 52 books this year, I once accidentally photographed a celebrity, and I can make latte art that doesn\'t look like a blob ☕',
      displayOrder: 3,
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
  ];

  static PollEntity get caseyKimPoll => PollEntity(
    id: 'casey_poll_1',
    profileId: caseyKimId,
    question: 'What\'s your perfect cozy date?',
    options: [
      'Bookstore browsing',
      'Coffee & people watching',
      'Museum photo walk',
      'Rainy day reading',
    ],
    isActive: true,
    createdAt: DateTime.now().subtract(const Duration(days: 12)),
  );

  static List<MediaEntity> get caseyKimMedia => [
    MediaEntity(
      id: 'casey_photo_1',
      profileId: caseyKimId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=400',
      caption: 'Golden hour magic at Discovery Park ✨',
      displayOrder: 1,
      width: 400,
      height: 600,
      fileSizeBytes: 2900000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 22)),
    ),
    MediaEntity(
      id: 'casey_photo_2',
      profileId: caseyKimId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400',
      caption: 'Current read and perfect rainy day setup 📖',
      displayOrder: 2,
      width: 400,
      height: 400,
      fileSizeBytes: 2100000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 18)),
    ),
    MediaEntity(
      id: 'casey_photo_3',
      profileId: caseyKimId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400',
      caption: 'My favorite corner at Victrola - best light for reading ☕',
      displayOrder: 3,
      width: 400,
      height: 500,
      fileSizeBytes: 2650000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
    MediaEntity(
      id: 'casey_photo_4',
      profileId: caseyKimId,
      type: MediaType.photo,
      filePath:
          'https://images.unsplash.com/photo-1606983340126-99ab4feaa64a?w=400',
      caption: 'Street photography session in Capitol Hill 📷',
      displayOrder: 4,
      width: 400,
      height: 600,
      fileSizeBytes: 3300000,
      isProcessing: false,
      isVisible: true,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
  ];

  static List<InterestEntity> get caseyKimInterests => [
    InterestEntity(
      id: 'casey_int_1',
      profileId: caseyKimId,
      interest: 'Photography',
      category: InterestCategory.creative,
      isCustom: false,
      popularity: 890,
      createdAt: DateTime.now().subtract(const Duration(days: 24)),
    ),
    InterestEntity(
      id: 'casey_int_2',
      profileId: caseyKimId,
      interest: 'Reading',
      category: InterestCategory.reading,
      isCustom: false,
      popularity: 780,
      createdAt: DateTime.now().subtract(const Duration(days: 24)),
    ),
    InterestEntity(
      id: 'casey_int_3',
      profileId: caseyKimId,
      interest: 'Coffee',
      category: InterestCategory.food,
      isCustom: false,
      popularity: 920,
      createdAt: DateTime.now().subtract(const Duration(days: 24)),
    ),
    InterestEntity(
      id: 'casey_int_4',
      profileId: caseyKimId,
      interest: 'Indie Folk Music',
      category: InterestCategory.creative,
      isCustom: false,
      popularity: 640,
      createdAt: DateTime.now().subtract(const Duration(days: 24)),
    ),
    InterestEntity(
      id: 'casey_int_5',
      profileId: caseyKimId,
      interest: 'Film Photography',
      category: InterestCategory.creative,
      isCustom: true,
      popularity: 380,
      createdAt: DateTime.now().subtract(const Duration(days: 24)),
    ),
    InterestEntity(
      id: 'casey_int_6',
      profileId: caseyKimId,
      interest: 'Bookstores',
      category: InterestCategory.reading,
      isCustom: false,
      popularity: 520,
      createdAt: DateTime.now().subtract(const Duration(days: 24)),
    ),
  ];

  static List<BadgeEntity> get caseyKimBadges => [
    BadgeEntity(
      id: 'casey_badge_1',
      profileId: caseyKimId,
      badge: 'Verified',
      type: BadgeType.verification,
      description: 'Photo verified',
      isVisible: true,
      isRare: false,
      earnedAt: DateTime.now().subtract(const Duration(days: 22)),
      createdAt: DateTime.now().subtract(const Duration(days: 22)),
    ),
    BadgeEntity(
      id: 'casey_badge_2',
      profileId: caseyKimId,
      badge: 'Bookworm',
      type: BadgeType.interest,
      description: 'Read 50+ books this year',
      isVisible: true,
      isRare: true,
      earnedAt: DateTime.now().subtract(const Duration(days: 10)),
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
  ];

  // ============================================================================
  // 🧪 UTILITY METHODS
  // ============================================================================

  /// Get sample profile by ID
  static ProfileEntity? getProfileById(String id) {
    try {
      return allProfiles.firstWhere((profile) => profile.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get profiles with common interests (for matching algorithms)
  static List<ProfileEntity> getProfilesWithCommonInterests(String profileId) {
    final targetProfile = getProfileById(profileId);
    if (targetProfile == null) return [];

    final targetInterestIds = targetProfile.interestIds;

    return allProfiles
        .where(
          (profile) =>
              profile.id != profileId &&
              profile.interestIds.any((id) => targetInterestIds.contains(id)),
        )
        .toList();
  }

  /// Get demo data statistics
  static Map<String, int> get demoDataStats => {
    'profiles': allProfiles.length,
    'prompts': allPrompts.length,
    'polls': allPolls.length,
    'media_items': allMedia.length,
    'interests': allInterests.length,
    'badges': allBadges.length,
    'verified_profiles': allProfiles.where((p) => p.photoVerification).length,
    'premium_profiles': allProfiles.where((p) => p.premium != null).length,
  };

  /// Get random profile (useful for discovery testing)
  static ProfileEntity getRandomProfile() {
    final random = DateTime.now().millisecondsSinceEpoch % allProfiles.length;
    return allProfiles[random];
  }
}
