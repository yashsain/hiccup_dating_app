import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/services/theme_provider.dart';
import '../data/providers/profile_providers.dart';

/// 👤 Profile Screen - Raw Data Display for Verification
///
/// This temporarily shows raw user data to verify the complete data flow.
/// Will be replaced with proper UI once data layer is confirmed working.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme information
    final currentBrightness = ref.watch(currentBrightnessProvider);
    final gradient = AppColors.getThemeGradient(currentBrightness);
    final textColor = AppColors.getPrimaryTextColor(currentBrightness);

    // 🎯 Load Alex Chen profile for testing
    const testProfileId = 'alex_chen_001';
    final profileAsync = ref.watch(profileProvider(testProfileId));

    // 🎯 Initialize demo data
    ref.watch(initializeDemoDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile - Raw Data Test'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: textColor,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: profileAsync.when(
            // ✅ Data loaded successfully
            data: (profileData) {
              if (profileData == null) {
                return _buildErrorView(textColor, 'Profile not found');
              }

              return _buildRawDataView(profileData, textColor);
            },

            // ⏳ Loading state
            loading: () => _buildLoadingView(textColor),

            // ❌ Error state
            error: (error, stack) =>
                _buildErrorView(textColor, error.toString()),
          ),
        ),
      ),
    );
  }

  /// 📊 Build raw data display - plain text for verification
  Widget _buildRawDataView(
    dynamic profileData,
    Color textColor,
  ) => SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🎯 Header
        Text(
          '🔍 RAW DATA VERIFICATION',
          style: AppTextStyles.heading2.copyWith(color: textColor),
        ),
        const SizedBox(height: 8),
        Text(
          'This is temporary - showing raw data to verify data flow',
          style: AppTextStyles.caption.copyWith(
            color: textColor.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 24),

        // 📋 Profile Basic Info
        _buildSection('BASIC PROFILE INFO', [
          'ID: ${profileData.profile.id}',
          'Name: ${profileData.profile.name}',
          'Age: ${profileData.profile.age}',
          'Location: ${profileData.profile.location}',
          'Gender: ${profileData.profile.gender}',
          'Sexual Orientation: ${profileData.profile.sexualOrientation ?? 'Not specified'}',
          'Bio: ${profileData.profile.bio ?? 'No bio'}',
          'Dating Goals: ${profileData.profile.datingGoals ?? 'Not specified'}',
          'Music: ${profileData.profile.music ?? 'Not specified'}',
          'Photo Verified: ${profileData.profile.photoVerification}',
          'ID Verified: ${profileData.profile.identityVerification}',
          'Premium: ${profileData.profile.premium ?? 'None'}',
          'Instagram: ${profileData.profile.instagramUrl ?? 'Not linked'}',
          'Spotify: ${profileData.profile.spotifyUrl ?? 'Not linked'}',
          'Created: ${profileData.profile.createdAt}',
          'Updated: ${profileData.profile.updatedAt}',
        ], textColor),

        const SizedBox(height: 24),

        // 📝 Prompts
        _buildSection(
          'PROMPTS (${profileData.prompts.length})',
          (profileData.prompts as List)
              .map<String>(
                (dynamic prompt) =>
                    'Q: ${prompt.question}\nA: ${prompt.response}\nOrder: ${prompt.displayOrder}',
              )
              .toList(),
          textColor,
        ),

        const SizedBox(height: 24),

        // 📊 Poll
        _buildSection(
          'ACTIVE POLL',
          profileData.activePoll != null
              ? [
                  'Question: ${profileData.activePoll!.question}',
                  'Options: ${profileData.activePoll!.options.join(', ')}',
                  'Active: ${profileData.activePoll!.isActive}',
                  'Total Votes: ${profileData.activePoll!.totalVotes}',
                  'Created: ${profileData.activePoll!.createdAt}',
                ]
              : ['No active poll'],
          textColor,
        ),

        const SizedBox(height: 24),

        // 📸 Media
        _buildSection(
          'MEDIA (${profileData.media.length})',
          (profileData.media as List)
              .map<String>(
                (dynamic media) =>
                    'Type: ${media.type.name}\nPath: ${media.filePath}\nOrder: ${media.displayOrder}\nCaption: ${media.caption ?? 'No caption'}',
              )
              .toList(),
          textColor,
        ),

        const SizedBox(height: 24),

        // 🎯 Interests
        _buildSection(
          'INTERESTS (${profileData.interests.length})',
          (profileData.interests as List)
              .map<String>(
                (dynamic interest) =>
                    '${interest.interest} (${interest.category.name})',
              )
              .toList(),
          textColor,
        ),

        const SizedBox(height: 24),

        // 🏆 Badges
        _buildSection(
          'BADGES (${profileData.badges.length})',
          (profileData.badges as List)
              .map<String>(
                (dynamic badge) =>
                    '${badge.badge} (${badge.type.name}) - Visible: ${badge.isVisible}',
              )
              .toList(),
          textColor,
        ),

        const SizedBox(height: 32),

        // ✅ Success message
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green),
          ),
          child: Text(
            '✅ DATA FLOW VERIFICATION SUCCESSFUL!\n\n'
            'All components working:\n'
            '• SQLite database ✅\n'
            '• Repository pattern ✅\n'
            '• Riverpod providers ✅\n'
            '• Domain entities ✅\n'
            '• Demo data system ✅\n\n'
            'Ready for UI development!',
            style: AppTextStyles.bodyText.copyWith(
              color: Colors.green.shade800,
            ),
          ),
        ),
      ],
    ),
  );

  /// 📋 Build a data section with title and items
  Widget _buildSection(String title, List<String> items, Color textColor) =>
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: textColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: textColor.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.heading3.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  '• $item',
                  style: AppTextStyles.caption.copyWith(
                    color: textColor.withOpacity(0.9),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  /// ⏳ Build loading view
  Widget _buildLoadingView(Color textColor) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(
          'Loading demo data...',
          style: AppTextStyles.body.copyWith(color: textColor),
        ),
      ],
    ),
  );

  /// ❌ Build error view
  Widget _buildErrorView(Color textColor, String error) => Center(
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'Error Loading Data',
            style: AppTextStyles.heading2.copyWith(color: textColor),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: AppTextStyles.caption.copyWith(
              color: textColor.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
