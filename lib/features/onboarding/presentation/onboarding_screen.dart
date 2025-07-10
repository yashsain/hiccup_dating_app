import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/constants/app_constants.dart';
import '../../../shared/services/theme_provider.dart';

/// 👋 Onboarding Screen - New Theme System Integration (2025)
///
/// This screen now uses:
/// - Centralized theme system for all styling
/// - Automatic gradient selection based on theme
/// - Theme-aware text colors and button styles
/// - Platform-consistent appearance
///
/// Key improvements:
/// - ✅ Automatically uses correct gradient (light/dark)
/// - ✅ Theme-aware text colors
/// - ✅ Consistent button styling
/// - ✅ No hardcoded colors
/// - ✅ Smooth theme transitions

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>
    with TickerProviderStateMixin {
  // 🎬 Animation Controllers
  late AnimationController _fadeController;
  late AnimationController _slideController;

  // ✨ Animations
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  /// 🎬 Setup entrance animations
  void _setupAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );
  }

  /// ⏰ Start the entrance animations
  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // 🎨 Get current theme information
    final currentBrightness = ref.watch(currentBrightnessProvider);
    final isDarkTheme = currentBrightness == Brightness.dark;

    // 🎯 Get theme-appropriate colors
    final gradient = AppColors.getThemeGradient(currentBrightness);
    final primaryColor = AppColors.getPrimaryColor(currentBrightness);
    final textColor = AppColors.getPrimaryTextColor(currentBrightness);
    final secondaryTextColor = AppColors.getSecondaryTextColor(
      currentBrightness,
    );

    return Scaffold(
      // 🎨 Theme-aware gradient background
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                // 📱 Top spacer
                const Spacer(),

                // 🎯 Main content
                AnimatedBuilder(
                  animation: _fadeController,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: _buildMainContent(
                          primaryColor,
                          textColor,
                          secondaryTextColor,
                          isDarkTheme,
                        ),
                      ),
                    );
                  },
                ),

                // 📱 Bottom spacer
                const Spacer(),

                // 🎯 Action buttons
                AnimatedBuilder(
                  animation: _fadeController,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: _buildActionButtons(
                        primaryColor,
                        textColor,
                        isDarkTheme,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🎯 Build the main content section with theme-aware styling
  Widget _buildMainContent(
    Color primaryColor,
    Color textColor,
    Color secondaryTextColor,
    bool isDarkTheme,
  ) {
    return Column(
      children: [
        // 💫 Hero illustration/icon
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            // Theme-aware gradient for the hero icon
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                primaryColor,
                primaryColor.withOpacity(0.7),
                AppColors.accentGold,
              ],
            ),
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.3),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Icon(
            Icons.card_giftcard_rounded,
            size: 100,
            color: isDarkTheme
                ? AppColors.darkTextPrimary
                : AppColors.neutralWhite,
          ),
        ),

        const SizedBox(height: 48),

        // 👋 Welcome message
        Text(
          'Ready to Hiccup?',
          style: AppTextStyles.brandTitle.copyWith(color: textColor),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 16),

        // 💭 Subtitle message
        Text(
          'Welcome to ${AppConstants.appName}',
          style: AppTextStyles.heading2.copyWith(color: textColor),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 24),

        // 📝 Description
        Text(
          'Send thoughtful gifts to spark meaningful connections. '
          'Where romance meets premium experiences.',
          style: AppTextStyles.bodyLarge.copyWith(
            color: secondaryTextColor,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 32),

        // ✨ Feature highlights
        _buildFeatureHighlights(primaryColor, textColor, isDarkTheme),
      ],
    );
  }

  /// ✨ Build feature highlights with theme-aware styling
  Widget _buildFeatureHighlights(
    Color primaryColor,
    Color textColor,
    bool isDarkTheme,
  ) {
    return Column(
      children: [
        _buildFeatureItem(
          icon: Icons.card_giftcard_rounded,
          text: 'Send Thoughtful Gifts',
          primaryColor: primaryColor,
          textColor: textColor,
          isDarkTheme: isDarkTheme,
        ),
        const SizedBox(height: 16),
        _buildFeatureItem(
          icon: Icons.security_rounded,
          text: 'Secure Until Accepted',
          primaryColor: primaryColor,
          textColor: textColor,
          isDarkTheme: isDarkTheme,
        ),
        const SizedBox(height: 16),
        _buildFeatureItem(
          icon: Icons.star_rounded,
          text: 'Premium Experience',
          primaryColor: primaryColor,
          textColor: textColor,
          isDarkTheme: isDarkTheme,
        ),
      ],
    );
  }

  /// 🎯 Build individual feature item with theme-aware styling
  Widget _buildFeatureItem({
    required IconData icon,
    required String text,
    required Color primaryColor,
    required Color textColor,
    required bool isDarkTheme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                primaryColor.withOpacity(0.1),
                AppColors.accentGold.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: primaryColor, size: 20),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// 🎯 Build action buttons with theme-aware styling
  Widget _buildActionButtons(
    Color primaryColor,
    Color textColor,
    bool isDarkTheme,
  ) {
    return Column(
      children: [
        // 🎯 Primary action button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              // 🔮 Future: Navigate to registration/login
              _showComingSoonDialog(textColor, isDarkTheme);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: isDarkTheme
                  ? AppColors.darkTextPrimary
                  : AppColors.neutralWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              ),
              elevation: AppConstants.elevationMedium,
            ),
            child: Text(
              'Start Sending Hiccups',
              style: AppTextStyles.button.copyWith(
                color: isDarkTheme
                    ? AppColors.darkTextPrimary
                    : AppColors.neutralWhite,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // 🎯 Secondary action button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton(
            onPressed: () {
              // 🔮 Future: Navigate to login
              _showComingSoonDialog(textColor, isDarkTheme);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: textColor,
              side: BorderSide(color: textColor, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              ),
            ),
            child: Text(
              'I Already Have an Account',
              style: AppTextStyles.button.copyWith(color: textColor),
            ),
          ),
        ),
      ],
    );
  }

  /// 🔮 Show coming soon dialog with theme-aware styling
  void _showComingSoonDialog(Color textColor, bool isDarkTheme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkTheme
            ? AppColors.darkSurface
            : AppColors.lightSurface,
        title: Text(
          'Coming Soon! 🚀',
          style: AppTextStyles.heading3.copyWith(color: textColor),
        ),
        content: Text(
          'This feature is being built with the new centralized theme system. '
          'Stay tuned for authentication, matching, and chat features!',
          style: AppTextStyles.bodyMedium.copyWith(color: textColor),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.getPrimaryColor(
                isDarkTheme ? Brightness.dark : Brightness.light,
              ),
            ),
            child: Text(
              'OK',
              style: AppTextStyles.button.copyWith(
                color: AppColors.getPrimaryColor(
                  isDarkTheme ? Brightness.dark : Brightness.light,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🎨 Theme-Aware Onboarding Extensions - Helper methods for onboarding screen theming
extension OnboardingThemeExtensions on ConsumerState<OnboardingScreen> {
  /// Get theme-appropriate gradient
  LinearGradient get currentGradient {
    final brightness = ref.read(currentBrightnessProvider);
    return AppColors.getThemeGradient(brightness);
  }

  /// Get theme-appropriate primary color
  Color get currentPrimaryColor {
    final brightness = ref.read(currentBrightnessProvider);
    return AppColors.getPrimaryColor(brightness);
  }

  /// Get theme-appropriate text color
  Color get currentTextColor {
    final brightness = ref.read(currentBrightnessProvider);
    return AppColors.getPrimaryTextColor(brightness);
  }

  /// Get theme-appropriate secondary text color
  Color get currentSecondaryTextColor {
    final brightness = ref.read(currentBrightnessProvider);
    return AppColors.getSecondaryTextColor(brightness);
  }
}
