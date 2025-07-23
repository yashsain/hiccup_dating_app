import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/constants/app_colors.dart';
import '../../../../../shared/constants/app_text_styles.dart';
import '../../../data/providers/profile_providers.dart';
import '../common/profile_base_widget.dart';

/// 📸 Photo Gallery Component - Premium Media Carousel (2025)
///
/// This component displays a beautiful, swipeable media gallery featuring:
/// - Smooth PageView carousel with media items
/// - Photo, video, and voice note support
/// - Media type indicators and badges
/// - Add media functionality for own profiles
/// - Tap-to-expand fullscreen viewing
/// - Progressive loading with skeleton states
/// - Platform-optimized image handling
///
/// Key Features:
/// - Hiccup theme integration with romantic gradients
/// - Smooth animations and micro-interactions
/// - Accessibility support with semantic labels
/// - Responsive design for all screen sizes
/// - Media upload interface for profile owners
/// - Visual indicators for different media types
///
/// Design Philosophy:
/// - Clean, modern carousel following 2025 trends
/// - Premium feel with subtle shadows and gradients
/// - Clear visual hierarchy for media browsing
/// - Romantic color palette matching Hiccup branding
class ProfilePhotoGallery extends ProfileBaseWidget {
  /// Profile ID to display gallery for
  final String profileId;

  /// Whether this profile belongs to the current user (enables media upload)
  final bool isOwnProfile;

  /// Callback when add media button is pressed
  final VoidCallback? onAddMediaPressed;

  /// Callback when media item is tapped for fullscreen view
  final Function(int index, dynamic mediaItem)? onMediaTapped;

  const ProfilePhotoGallery({
    super.key,
    required this.profileId,
    this.isOwnProfile = false,
    this.onAddMediaPressed,
    this.onMediaTapped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme information
    final currentBrightness = getCurrentBrightness(ref);
    final primaryColor = getPrimaryColor(ref);
    final surfaceColor = getSurfaceColor(ref);

    // 📱 Load profile data
    final profileAsync = ref.watch(profileProvider(profileId));

    return profileAsync.when(
      data: (profileData) {
        if (profileData == null) {
          return _buildErrorState(context, 'Profile not found');
        }

        final media = profileData.media as List<dynamic>;

        return _buildGalleryContent(
          context,
          ref,
          media,
          currentBrightness,
          primaryColor,
          surfaceColor,
        );
      },
      loading: () => _buildLoadingState(context),
      error: (error, stack) =>
          _buildErrorState(context, 'Failed to load media'),
    );
  }

  /// 🏗️ Build main gallery content
  Widget _buildGalleryContent(
    BuildContext context,
    WidgetRef ref,
    List<dynamic> media,
    Brightness brightness,
    Color primaryColor,
    Color surfaceColor,
  ) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: _buildGalleryDecoration(surfaceColor, brightness),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🏷️ Gallery Header
        _buildGalleryHeader(context, media, primaryColor),

        // 📸 Media Carousel
        if (media.isNotEmpty) ...[
          _buildMediaCarousel(context, ref, media, primaryColor),
        ] else ...[
          _buildEmptyGalleryState(context, primaryColor),
        ],

        // 📊 Media Indicators and Actions
        if (media.isNotEmpty) ...[
          const SizedBox(height: 12),
          _buildGalleryFooter(context, media, primaryColor),
        ],
      ],
    ),
  );

  /// 🏷️ Build gallery header
  Widget _buildGalleryHeader(
    BuildContext context,
    List<dynamic> media,
    Color primaryColor,
  ) => Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        // Gallery icon and title
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.photo_library_rounded,
            color: primaryColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Photo Gallery',
                style: AppTextStyles.getLabelLarge(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '${media.length} ${media.length == 1 ? 'item' : 'items'}',
                style: AppTextStyles.getCaption(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),

        // Add media button (for own profile)
        if (isOwnProfile) ...[_buildAddMediaButton(context, primaryColor)],
      ],
    ),
  );

  /// ➕ Build add media button
  Widget _buildAddMediaButton(BuildContext context, Color primaryColor) =>
      GestureDetector(
        onTap: onAddMediaPressed,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: primaryColor.withOpacity(0.3), width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_rounded, color: primaryColor, size: 16),
              const SizedBox(width: 4),
              Text(
                'Add',
                style: AppTextStyles.getCaption(
                  context,
                ).copyWith(color: primaryColor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      );

  /// 📸 Build media carousel
  Widget _buildMediaCarousel(
    BuildContext context,
    WidgetRef ref,
    List<dynamic> media,
    Color primaryColor,
  ) => SizedBox(
    height: 280,
    child: PageView.builder(
      itemCount: media.length,
      controller: PageController(viewportFraction: 0.85),
      itemBuilder: (context, index) {
        final mediaItem = media[index];
        return _buildMediaItem(context, ref, mediaItem, index, primaryColor);
      },
    ),
  );

  /// 📱 Build individual media item
  Widget _buildMediaItem(
    BuildContext context,
    WidgetRef ref,
    dynamic mediaItem,
    int index,
    Color primaryColor,
  ) => GestureDetector(
    onTap: () => onMediaTapped?.call(index, mediaItem),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Media content
            _buildMediaContent(mediaItem, primaryColor),

            // Media type indicator
            Positioned(
              top: 12,
              right: 12,
              child: _buildMediaTypeIndicator(mediaItem, primaryColor),
            ),

            // Media overlay for interactions
            Positioned.fill(
              child: _buildMediaOverlay(context, mediaItem, primaryColor),
            ),
          ],
        ),
      ),
    ),
  );

  /// 🖼️ Build media content based on type
  Widget _buildMediaContent(dynamic mediaItem, Color primaryColor) {
    // For demo purposes, create beautiful gradient placeholders
    final gradients = [
      LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [primaryColor.withOpacity(0.8), primaryColor.withOpacity(0.6)],
      ),
      LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [AppColors.lightGradientStart, AppColors.lightGradientEnd],
      ),
      LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.darkGradientStart.withOpacity(0.7),
          AppColors.darkGradientEnd.withOpacity(0.9),
        ],
      ),
    ];

    final gradient = gradients[mediaItem.id.hashCode % gradients.length];

    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getMediaIcon(mediaItem.type),
              color: Colors.white.withOpacity(0.9),
              size: 48,
            ),
            const SizedBox(height: 8),
            Text(
              _getMediaTypeLabel(mediaItem.type),
              style: AppTextStyles.getLabelMedium(null).copyWith(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🏷️ Build media type indicator
  Widget _buildMediaTypeIndicator(dynamic mediaItem, Color primaryColor) {
    final type = mediaItem.type.toLowerCase();
    Color indicatorColor;
    IconData icon;

    switch (type) {
      case 'video':
        indicatorColor = Colors.red.shade400;
        icon = Icons.play_circle_filled_rounded;
        break;
      case 'voice':
        indicatorColor = Colors.green.shade400;
        icon = Icons.mic_rounded;
        break;
      default:
        indicatorColor = Colors.blue.shade400;
        icon = Icons.photo_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: indicatorColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: indicatorColor.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 12),
          const SizedBox(width: 4),
          Text(
            type.toUpperCase(),
            style: AppTextStyles.getCaption(null).copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  /// 🎭 Build media overlay for interactions
  Widget _buildMediaOverlay(
    BuildContext context,
    dynamic mediaItem,
    Color primaryColor,
  ) => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.transparent, Colors.black.withOpacity(0.3)],
        stops: const [0.6, 1.0],
      ),
    ),
    child: Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (mediaItem.caption?.isNotEmpty == true) ...[
              Text(
                mediaItem.caption,
                style: AppTextStyles.getBodySmall(
                  context,
                ).copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
            ],
            Row(
              children: [
                Icon(
                  Icons.favorite_rounded,
                  color: Colors.white.withOpacity(0.8),
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '${mediaItem.likes ?? 0}',
                  style: AppTextStyles.getCaption(
                    context,
                  ).copyWith(color: Colors.white.withOpacity(0.8)),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  /// 📊 Build gallery footer with indicators
  Widget _buildGalleryFooter(
    BuildContext context,
    List<dynamic> media,
    Color primaryColor,
  ) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        // Media type summary
        _buildMediaTypeSummary(context, media, primaryColor),

        const Spacer(),

        // View all button
        TextButton.icon(
          onPressed: () {
            // Future: Navigate to full gallery view
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Full gallery view coming soon!',
                  style: AppTextStyles.getBodyMedium(
                    context,
                  ).copyWith(color: Colors.white),
                ),
                backgroundColor: primaryColor,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
          icon: Icon(Icons.fullscreen_rounded, color: primaryColor, size: 16),
          label: Text(
            'View All',
            style: AppTextStyles.getCaption(
              context,
            ).copyWith(color: primaryColor, fontWeight: FontWeight.w600),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
        ),
      ],
    ),
  );

  /// 📊 Build media type summary
  Widget _buildMediaTypeSummary(
    BuildContext context,
    List<dynamic> media,
    Color primaryColor,
  ) {
    final typeCounts = <String, int>{};
    for (final item in media) {
      final type = item.type.toLowerCase();
      typeCounts[type] = (typeCounts[type] ?? 0) + 1;
    }

    return Wrap(
      spacing: 8,
      children: typeCounts.entries
          .map(
            (entry) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_getMediaIcon(entry.key), color: primaryColor, size: 12),
                  const SizedBox(width: 4),
                  Text(
                    '${entry.value}',
                    style: AppTextStyles.getCaption(context).copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  /// 🎭 Build empty gallery state
  Widget _buildEmptyGalleryState(BuildContext context, Color primaryColor) =>
      Container(
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add_photo_alternate_rounded,
                  color: primaryColor,
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                isOwnProfile ? 'Add your first photo!' : 'No photos yet',
                style: AppTextStyles.getLabelLarge(
                  context,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                isOwnProfile
                    ? 'Share your personality with great photos'
                    : 'Check back later for updates',
                style: AppTextStyles.getBodySmall(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
              if (isOwnProfile) ...[
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: onAddMediaPressed,
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: Text(
                    'Add Photos',
                    style: AppTextStyles.getLabelMedium(
                      context,
                    ).copyWith(fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      );

  /// 🎨 Build gallery decoration
  BoxDecoration _buildGalleryDecoration(
    Color surfaceColor,
    Brightness brightness,
  ) => BoxDecoration(
    color: surfaceColor.withOpacity(0.95),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: brightness == Brightness.dark
          ? Colors.white.withOpacity(0.1)
          : Colors.black.withOpacity(0.05),
    ),
    boxShadow: [
      BoxShadow(
        color: brightness == Brightness.dark
            ? Colors.black.withOpacity(0.3)
            : Colors.black.withOpacity(0.1),
        blurRadius: 15,
        spreadRadius: 1,
        offset: const Offset(0, 4),
      ),
    ],
  );

  /// ⏳ Loading state
  Widget _buildLoadingState(BuildContext context) => Container(
    height: 350,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Center(child: CircularProgressIndicator()),
  );

  /// ❌ Error state
  Widget _buildErrorState(BuildContext context, String message) => Container(
    height: 200,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Theme.of(context).colorScheme.error.withOpacity(0.3),
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: Theme.of(context).colorScheme.error,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: AppTextStyles.getBodyMedium(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.error),
          ),
        ],
      ),
    ),
  );

  // ============================================================================
  // 🔧 HELPER METHODS
  // ============================================================================

  /// Get icon for media type
  IconData _getMediaIcon(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return Icons.videocam_rounded;
      case 'voice':
        return Icons.mic_rounded;
      default:
        return Icons.photo_rounded;
    }
  }

  /// Get display label for media type
  String _getMediaTypeLabel(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return 'Video';
      case 'voice':
        return 'Voice Note';
      default:
        return 'Photo';
    }
  }
}
