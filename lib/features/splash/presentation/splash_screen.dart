import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/constants/app_constants.dart';
import '../../../shared/services/theme_provider.dart';
import '../../../app/router/app_router.dart';

/// 🚀 Splash Screen - New Theme System Integration (2025)
///
/// This screen now uses:
/// - Centralized theme system for all styling
/// - Automatic gradient selection based on theme
/// - Platform-agnostic design with consistent look
/// - Proper theme-aware colors and text
///
/// Key improvements:
/// - ✅ Automatically uses correct gradient (light/dark)
/// - ✅ Theme-aware text colors
/// - ✅ No hardcoded colors
/// - ✅ Smooth theme transitions
/// - ✅ Platform-consistent appearance

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  // 🎬 Animation Controllers
  late AnimationController _logoController;
  late AnimationController _textController;

  // ✨ Animations
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startSplashSequence();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  /// 🎬 Setup smooth animations for modern feel
  void _setupAnimations() {
    // Logo animation controller
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Logo animations
    _logoScale = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeIn));

    // Text animations
    _textOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _textSlide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
        );
  }

  /// ⏰ Start the splash sequence
  void _startSplashSequence() async {
    // Start logo animation immediately
    _logoController.forward();

    // Start text animation after a delay
    await Future.delayed(const Duration(milliseconds: 500));
    _textController.forward();

    // Navigate after total splash duration
    await Future.delayed(AppConstants.splashDuration);

    if (mounted) {
      context.go(AppRouter.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 🎨 Get current theme information
    final currentBrightness = ref.watch(currentBrightnessProvider);
    final isDarkTheme = currentBrightness == Brightness.dark;

    // 🎯 Get theme-appropriate colors
    final gradient = AppColors.getThemeGradient(currentBrightness);
    final textColor = isDarkTheme
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final shadowColor = isDarkTheme
        ? AppColors.darkPrimary
        : AppColors.lightPrimary;

    return Scaffold(
      // 🎨 Theme-aware gradient background
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🎯 Logo Section
                AnimatedBuilder(
                  animation: _logoController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _logoScale.value,
                      child: Opacity(
                        opacity: _logoOpacity.value,
                        child: _buildLogo(currentBrightness),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 32),

                // ✍️ Brand Text Section
                AnimatedBuilder(
                  animation: _textController,
                  builder: (context, child) {
                    return SlideTransition(
                      position: _textSlide,
                      child: Opacity(
                        opacity: _textOpacity.value,
                        child: _buildBrandText(textColor, shadowColor),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 64),

                // 🔄 Loading Indicator
                AnimatedBuilder(
                  animation: _textController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _textOpacity.value,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(textColor),
                        strokeWidth: 2,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🎯 Build the logo widget with theme-aware styling
  Widget _buildLogo(Brightness brightness) {
    final isDarkTheme = brightness == Brightness.dark;

    // 💕 Theme-aware logo styling
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: isDarkTheme ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: isDarkTheme
                ? AppColors.darkPrimary.withOpacity(0.3)
                : AppColors.lightPrimary.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Icon(
        Icons.favorite_rounded,
        size: 60,
        color: isDarkTheme ? AppColors.darkPrimary : AppColors.lightPrimary,
      ),
    );

    // 🖼️ When you have your logo image, replace above with:
    // return Container(
    //   width: 120,
    //   height: 120,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(30),
    //     boxShadow: [
    //       BoxShadow(
    //         color: isDarkTheme
    //             ? AppColors.darkPrimary.withOpacity(0.3)
    //             : AppColors.lightPrimary.withOpacity(0.3),
    //         blurRadius: 30,
    //         offset: const Offset(0, 15),
    //       ),
    //     ],
    //   ),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(30),
    //     child: Image.asset(
    //       'assets/images/hiccup_logo.png',
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // );
  }

  /// ✍️ Build the brand text with theme-aware colors
  Widget _buildBrandText(Color textColor, Color shadowColor) {
    return Column(
      children: [
        Text(
          AppConstants.appName.toUpperCase(),
          style: AppTextStyles.brandTitle.copyWith(
            color: textColor,
            shadows: [
              Shadow(
                offset: const Offset(0, 2),
                blurRadius: 8,
                color: shadowColor.withOpacity(0.5),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Send a hiccup to remind them of you',
          style: AppTextStyles.brandSubtitle.copyWith(
            color: textColor.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}

/// 🎨 Theme-Aware Splash Extensions - Helper methods for splash screen theming
extension SplashThemeExtensions on ConsumerState<SplashScreen> {
  /// Get theme-appropriate gradient
  LinearGradient get currentGradient {
    final brightness = ref.read(currentBrightnessProvider);
    return AppColors.getThemeGradient(brightness);
  }

  /// Get theme-appropriate text color
  Color get currentTextColor {
    final brightness = ref.read(currentBrightnessProvider);
    return AppColors.getPrimaryTextColor(brightness);
  }

  /// Get theme-appropriate shadow color
  Color get currentShadowColor {
    final brightness = ref.read(currentBrightnessProvider);
    return AppColors.getPrimaryColor(brightness);
  }
}
