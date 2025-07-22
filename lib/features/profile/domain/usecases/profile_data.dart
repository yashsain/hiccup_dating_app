import '../entities/profile_entity.dart';
import '../entities/prompt_entity.dart';
import '../entities/poll_entity.dart';
import '../entities/media_entity.dart';
import '../entities/interest_entity.dart';
import '../entities/badge_entity.dart';

/// 📊 Profile Data - Complete profile information
class ProfileData {
  final ProfileEntity profile;
  final List<PromptEntity> prompts;
  final PollEntity? activePoll;
  final List<MediaEntity> media;
  final List<InterestEntity> interests;
  final List<BadgeEntity> badges;

  const ProfileData({
    required this.profile,
    required this.prompts,
    this.activePoll,
    required this.media,
    required this.interests,
    required this.badges,
  });
}
