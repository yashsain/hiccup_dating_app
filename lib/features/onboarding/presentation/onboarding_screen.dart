import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/constants/app_constants.dart';

/// 👋 Onboarding Screen - Modern Landing Page (2025)
/// This is the first screen users see after the splash screen.
/// It provides a welcoming introduction to the Hiccup dating app.

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
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundLight,
              AppColors.primaryLight,
            ],
            stops: [0.0, 1.0],
          ),
        ),
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
                        child: _buildMainContent(),
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
                      child: _buildActionButtons(),
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
  
  /// 🎯 Build the main content section
  Widget _buildMainContent() {
    return Column(
      children: [
        // 💫 Hero illustration/icon
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: const Icon(
            Icons.waving_hand_rounded,
            size: 100,
            color: AppColors.primary,
          ),
        ),
        
        const SizedBox(height: 48),
        
        // 👋 Welcome message
        Text(
          'Hello there!',
          style: AppTextStyles.brandTitle.copyWith(
            color: AppColors.primary,
          ),
          textAlign: TextAlign.center,
        ),
        
        const SizedBox(height: 16),
        
        // 💭 Subtitle message
        Text(
          'Welcome to ${AppConstants.appName}',
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        
        const SizedBox(height: 24),
        
        // 📝 Description
        Text(
          'The modern way to find meaningful connections. '
          'Built with love using Flutter and the latest 2025 best practices.',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
        
        const SizedBox(height: 32),
        
        // ✨ Feature highlights
        _buildFeatureHighlights(),
      ],
    );
  }
  
  /// ✨ Build feature highlights
  Widget _buildFeatureHighlights() {
    return Column(
      children: [
        _buildFeatureItem(
          icon: Icons.security_rounded,
          text: 'Secure & Private',
        ),
        const SizedBox(height: 16),
        _buildFeatureItem(
          icon: Icons.favorite_rounded,
          text: 'Meaningful Matches',
        ),
        const SizedBox(height: 16),
        _buildFeatureItem(
          icon: Icons.chat_bubble_rounded,
          text: 'Real Conversations',
        ),
      ],
    );
  }
  
  /// 🎯 Build individual feature item
  Widget _buildFeatureItem({
    required IconData icon,
    required String text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
  
  /// 🎯 Build action buttons
  Widget _buildActionButtons() {
    return Column(
      children: [
        // 🎯 Primary action button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              // 🔮 Future: Navigate to registration/login
              _showComingSoonDialog();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              ),
              elevation: AppConstants.elevationMedium,
            ),
            child: Text(
              'Get Started',
              style: AppTextStyles.button,
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
              _showComingSoonDialog();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              ),
            ),
            child: Text(
              'I Already Have an Account',
              style: AppTextStyles.button.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
  
  /// 🔮 Show coming soon dialog (temporary)
  void _showComingSoonDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Coming Soon! 🚀'),
        content: const Text(
          'This feature is being built with modern Flutter architecture. '
          'Stay tuned for authentication, matching, and chat features!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}