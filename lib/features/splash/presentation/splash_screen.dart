import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/constants/app_constants.dart';
import '../../../app/router/app_router.dart';

/// 🚀 Splash Screen - Modern Implementation (2025)
/// This screen appears while the app loads and provides a smooth transition
/// to the main app. It follows current best practices for splash screens.

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
    
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeIn),
    );
    
    // Text animations
    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeIn),
    );
    
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
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
    return Scaffold(
      // 🎨 Gradient background for modern look
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
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
                        child: _buildLogo(),
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
                        child: _buildBrandText(),
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
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.white,
                        ),
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
  
  /// 🎯 Build the logo widget
  Widget _buildLogo() {
    // 🔮 For now, we'll use an icon. Replace with your actual logo image
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Icon(
        Icons.favorite_rounded,
        size: 60,
        color: AppColors.primary,
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
    //         color: Colors.black.withOpacity(0.1),
    //         blurRadius: 20,
    //         offset: const Offset(0, 10),
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
  
  /// ✍️ Build the brand text
  Widget _buildBrandText() {
    return Column(
      children: [
        Text(
          AppConstants.appName.toUpperCase(),
          style: AppTextStyles.brandTitle.copyWith(
            color: AppColors.white,
            shadows: [
              const Shadow(
                offset: Offset(0, 2),
                blurRadius: 8,
                color: Colors.black26,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Find Your Perfect Match',
          style: AppTextStyles.brandSubtitle.copyWith(
            color: AppColors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}