import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/constants/app_colors.dart';
import '../../../../../shared/constants/app_text_styles.dart';
import '../../../../../shared/services/theme_provider.dart';
import '../../../domain/entities/post_entity.dart';

/// 📱 Post Card Widget - Individual Post Display (2025)
///
/// A beautifully designed card component that displays a single post
/// optimized for dating app profiles. Features:
///
/// - Hero image with gradient overlay for text readability
/// - Post type indicators with icon and color coding
/// - Media count badges for multi-media posts
/// - Caption preview with elegant typography
/// - Interactive touch feedback with proper accessibility
/// - Options menu for post management
/// - Responsive design that scales across devices
///
/// Design Philosophy:
/// - Visual hierarchy that highlights the content
/// - Romantic gradient overlays matching app theme
/// - Clean, modern card design with subtle shadows
/// - Touch targets sized for comfortable interaction
/// - Accessibility-first approach with semantic labels
///
/// Usage:
/// ```dart
/// PostCardWidget(
///   post: myPost,
///   onTap: () => navigateToDetail(myPost),
///   onOptionsPressed: () => showOptionsMenu(myPost),
/// )
/// ```
class PostCardWidget extends ConsumerWidget {
  /// The post data to display
  final PostEntity post;

  /// Callback when card is tapped (for navigation to detail view)
  final VoidCallback? onTap;

  /// Callback when options menu is pressed
  final VoidCallback? onOptionsPressed;

  /// Whether to show the options menu button
  final bool showOptions;

  const PostCardWidget({
    super.key,
    required this.post,
    this.onTap,
    this.onOptionsPressed,
    this.showOptions = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBrightness = ref.watch(currentBrightnessProvider);
    final textColor = AppColors.getPrimaryTextColor(currentBrightness);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Background image
                _buildBackgroundImage(),

                // Gradient overlay for text readability
                _buildGradientOverlay(),

                // Post content
                _buildPostContent(context, textColor),

                // Post type indicator
                _buildTypeIndicator(context, textColor),

                // Media count badge (if multiple items)
                if (post.hasMultipleMedia)
                  _buildMediaCountBadge(context, textColor),

                // Options menu button
                if (showOptions) _buildOptionsButton(context, textColor),

                // Visibility indicator (if hidden)
                if (!post.isVisible)
                  _buildVisibilityIndicator(context, textColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🖼️ Background Image Display
  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: post.primaryImagePath.isNotEmpty
          ? Image.asset(
              post.primaryImagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildImagePlaceholder();
              },
            )
          : _buildImagePlaceholder(),
    );
  }

  /// 🎨 Gradient Overlay for Text Readability
  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.7),
            ],
            stops: const [0.0, 0.6, 1.0],
          ),
        ),
      ),
    );
  }

  /// 📝 Post Content (Caption and Metadata)
  Widget _buildPostContent(BuildContext context, Color textColor) {
    return Positioned(
      left: 12,
      right: 12,
      bottom: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Caption text
          Text(
            post.displayCaption,
            style: AppTextStyles.getBodyMedium(context).copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 8),

          // Post metadata
          _buildPostMetadata(context),
        ],
      ),
    );
  }

  /// 📊 Post Metadata Display
  Widget _buildPostMetadata(BuildContext context) {
    return Row(
      children: [
        // Time ago
        Icon(
          Icons.access_time_rounded,
          size: 12,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(width: 4),
        Text(
          _getTimeAgo(post.createdAt),
          style: AppTextStyles.getLabelSmall(
            context,
          ).copyWith(color: Colors.white.withOpacity(0.8)),
        ),

        // Recent indicator
        if (post.isRecent) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.green.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Text(
              'NEW',
              style: AppTextStyles.getLabelSmall(context).copyWith(
                color: Colors.green.shade300,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ],
    );
  }

  /// 🎭 Post Type Indicator
  Widget _buildTypeIndicator(BuildContext context, Color textColor) {
    return Positioned(
      top: 12,
      left: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _getTypeColor(post.type).withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(post.type.emoji, style: const TextStyle(fontSize: 12)),
            const SizedBox(width: 4),
            Text(
              post.type.displayName,
              style: AppTextStyles.getLabelSmall(context).copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔢 Media Count Badge
  Widget _buildMediaCountBadge(BuildContext context, Color textColor) {
    return Positioned(
      top: 12,
      right: showOptions ? 52 : 12, // Account for options button
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.collections_rounded, size: 12, color: Colors.white),
            const SizedBox(width: 2),
            Text(
              '${post.mediaCount}',
              style: AppTextStyles.getLabelSmall(context).copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ⚙️ Options Menu Button
  Widget _buildOptionsButton(BuildContext context, Color textColor) {
    return Positioned(
      top: 8,
      right: 8,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onOptionsPressed,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.more_vert_rounded, size: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  /// 👁️ Visibility Indicator (when post is hidden)
  Widget _buildVisibilityIndicator(BuildContext context, Color textColor) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.visibility_off_rounded,
                size: 32,
                color: Colors.white.withOpacity(0.9),
              ),
              const SizedBox(height: 8),
              Text(
                'Hidden',
                style: AppTextStyles.getBodyMedium(context).copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🖼️ Image Placeholder (when image fails to load)
  Widget _buildImagePlaceholder() {
    return Container(
      color: Colors.grey.shade300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_outlined, size: 48, color: Colors.grey.shade600),
            const SizedBox(height: 8),
            Text(
              'Image not found',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  /// 🎨 Get Post Type Color
  Color _getTypeColor(PostType type) {
    switch (type) {
      case PostType.photo:
        return Colors.green;
      case PostType.video:
        return Colors.blue;
      case PostType.voiceNote:
        return Colors.orange;
      case PostType.mixed:
        return Colors.purple;
    }
  }

  /// ⏰ Convert DateTime to Human-Readable Time Ago
  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '${months}mo ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
