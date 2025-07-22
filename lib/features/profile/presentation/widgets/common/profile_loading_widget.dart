import 'dart:math' show cos, sin;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/constants/app_colors.dart';
import '../../../../../shared/constants/app_text_styles.dart';
import '../../../../../shared/services/theme_provider.dart';

/// ⏳ Profile Loading Widget - Branded Loading Experience (2025)
///
/// A beautiful, theme-aware loading widget specifically designed for profile loading.
/// Features:
/// - Hiccup-branded animations with heart iconography
/// - Smooth gradient background matching app theme
/// - Platform-optimized performance
/// - Accessible loading states
/// - Multiple loading scenarios (profile, media, etc.)
///
/// Design follows 2025 trends:
/// - Engaging micro-animations
/// - Premium feel with gradients
/// - Meaningful loading messages
/// - Smooth transitions
class ProfileLoadingWidget extends ConsumerStatefulWidget {
  /// Loading message to display
  final String? message;

  /// Loading type for different scenarios
  final ProfileLoadingType type;

  /// Whether to show the loading percentage
  final bool showProgress;

  /// Current progress (0.0 to 1.0) if showProgress is true
  final double progress;

  const ProfileLoadingWidget({
    super.key,
    this.message,
    this.type = ProfileLoadingType.profile,
    this.showProgress = false,
    this.progress = 0.0,
  });

  @override
  ConsumerState<ProfileLoadingWidget> createState() =>
      _ProfileLoadingWidgetState();
}

class _ProfileLoadingWidgetState extends ConsumerState<ProfileLoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotationController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  /// 🎬 Setup smooth loading animations
  void _setupAnimations() {
    // Pulse animation for heart
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Rotation animation for outer ring
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.linear),
    );

    // Start animations
    _pulseController.repeat(reverse: true);
    _rotationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    // 🎨 Get current theme
    final brightness = ref.watch(currentBrightnessProvider);
    final primaryColor = AppColors.getPrimaryColor(brightness);
    final textColor = AppColors.getPrimaryTextColor(brightness);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 💖 Animated loading indicator
          _buildLoadingIndicator(primaryColor),

          const SizedBox(height: 32),

          // 📝 Loading message
          _buildLoadingMessage(textColor),

          // 📊 Progress indicator (if enabled)
          if (widget.showProgress) ...[
            const SizedBox(height: 24),
            _buildProgressIndicator(primaryColor),
          ],

          const SizedBox(height: 16),

          // 💡 Loading tip
          _buildLoadingTip(textColor),
        ],
      ),
    );
  }

  /// 💖 Build animated loading indicator
  Widget _buildLoadingIndicator(Color primaryColor) => SizedBox(
    width: 120,
    height: 120,
    child: Stack(
      alignment: Alignment.center,
      children: [
        // Outer rotating ring
        AnimatedBuilder(
          animation: _rotationAnimation,
          builder: (context, child) => Transform.rotate(
            angle: _rotationAnimation.value * 2 * 3.14159,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryColor.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: CustomPaint(
                painter: _LoadingRingPainter(
                  primaryColor: primaryColor,
                  progress: widget.showProgress ? widget.progress : null,
                ),
              ),
            ),
          ),
        ),

        // Pulsing heart in center
        AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) => Transform.scale(
            scale: _pulseAnimation.value,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(0.1),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite_rounded,
                size: 32,
                color: primaryColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );

  /// 📝 Build loading message
  Widget _buildLoadingMessage(Color textColor) {
    final message = widget.message ?? _getDefaultMessage();

    return Text(
      message,
      style: AppTextStyles.getHeading4(
        context,
      ).copyWith(color: textColor, fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    );
  }

  /// 📊 Build progress indicator
  Widget _buildProgressIndicator(Color primaryColor) => Column(
    children: [
      // Progress bar
      Container(
        width: 200,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: primaryColor.withOpacity(0.2),
        ),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: widget.progress,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              gradient: LinearGradient(
                colors: [primaryColor, primaryColor.withOpacity(0.7)],
              ),
            ),
          ),
        ),
      ),

      const SizedBox(height: 8),

      // Progress percentage
      Text(
        '${(widget.progress * 100).toInt()}%',
        style: AppTextStyles.getCaption(
          context,
        ).copyWith(color: primaryColor, fontWeight: FontWeight.w600),
      ),
    ],
  );

  /// 💡 Build loading tip
  Widget _buildLoadingTip(Color textColor) {
    final tip = _getLoadingTip();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        tip,
        style: AppTextStyles.getCaption(
          context,
        ).copyWith(color: textColor.withOpacity(0.7)),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// 📝 Get default loading message based on type
  String _getDefaultMessage() {
    switch (widget.type) {
      case ProfileLoadingType.profile:
        return 'Loading Profile...';
      case ProfileLoadingType.media:
        return 'Loading Photos...';
      case ProfileLoadingType.interests:
        return 'Loading Interests...';
      case ProfileLoadingType.prompts:
        return 'Loading Prompts...';
      case ProfileLoadingType.saving:
        return 'Saving Changes...';
      case ProfileLoadingType.uploading:
        return 'Uploading Media...';
    }
  }

  /// 💡 Get contextual loading tip
  String _getLoadingTip() {
    switch (widget.type) {
      case ProfileLoadingType.profile:
        return 'Creating meaningful connections takes time...';
      case ProfileLoadingType.media:
        return 'A picture is worth a thousand swipes';
      case ProfileLoadingType.interests:
        return 'Finding your perfect matches';
      case ProfileLoadingType.prompts:
        return 'Discovering your personality';
      case ProfileLoadingType.saving:
        return 'Your profile is looking great!';
      case ProfileLoadingType.uploading:
        return 'Quality photos get more matches';
    }
  }
}

/// 🎨 Custom Loading Ring Painter
///
/// Draws the animated loading ring with optional progress
class _LoadingRingPainter extends CustomPainter {
  final Color primaryColor;
  final double? progress;

  _LoadingRingPainter({required this.primaryColor, this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    // Background circle
    final backgroundPaint = Paint()
      ..color = primaryColor.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc (if progress is provided)
    if (progress != null) {
      final progressPaint = Paint()
        ..shader = LinearGradient(
          colors: [primaryColor, primaryColor.withOpacity(0.6)],
        ).createShader(Rect.fromCircle(center: center, radius: radius))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round;

      final sweepAngle = 2 * 3.14159 * progress!;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -3.14159 / 2, // Start from top
        sweepAngle,
        false,
        progressPaint,
      );
    } else {
      // Animated dots for indeterminate loading
      final dotPaint = Paint()
        ..color = primaryColor
        ..style = PaintingStyle.fill;

      for (int i = 0; i < 8; i++) {
        final angle = (i * 3.14159 / 4);
        final opacity = (i % 4 + 1) / 4;
        final dotRadius = 3.0 * opacity;

        final dotCenter = Offset(
          center.dx + radius * 0.8 * cos(angle),
          center.dy + radius * 0.8 * sin(angle),
        );

        dotPaint.color = primaryColor.withOpacity(opacity);
        canvas.drawCircle(dotCenter, dotRadius, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// 🎯 Profile Loading Types
///
/// Different loading scenarios for appropriate messaging
enum ProfileLoadingType {
  profile,
  media,
  interests,
  prompts,
  saving,
  uploading,
}
