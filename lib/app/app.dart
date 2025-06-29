import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/app_router.dart';
import '../shared/constants/app_colors.dart';
import '../shared/constants/app_text_styles.dart';
import '../shared/constants/app_constants.dart';

/// 🎯 Main App Widget - Modern Flutter Architecture (2025)
/// This widget sets up the entire app with:
/// - Riverpod for state management
/// - go_router for navigation
/// - Material Design 3 theming
/// - Dark mode support
class HiccupApp extends ConsumerWidget {
  const HiccupApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🧭 Get the router from Riverpod
    final router = ref.watch(AppRouter.routerProvider);

    return MaterialApp.router(
      // 📱 App Configuration
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      
      // 🧭 Router Configuration
      routerConfig: router,
      
      // 🎨 Theme Configuration - Modern Material Design 3
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.system, // Follows system preference
      
      // 🌍 Future: Localization support
      // locale: const Locale('en', 'US'),
      // supportedLocales: const [
      //   Locale('en', 'US'),
      //   Locale('es', 'ES'),
      // ],
    );
  }

  /// 🌞 Light Theme - Modern and clean
  ThemeData _buildLightTheme() {
    return ThemeData(
      // 🎨 Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surfaceLight,
        background: AppColors.backgroundLight,
        error: AppColors.error,
      ),
      
      // ✍️ Typography
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.heading1,
        displayMedium: AppTextStyles.heading2,
        displaySmall: AppTextStyles.heading3,
        headlineMedium: AppTextStyles.heading4,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
      
      // 🎯 Component Themes
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundLight,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        titleTextStyle: AppTextStyles.heading3,
        centerTitle: true,
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          textStyle: AppTextStyles.button,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          elevation: AppConstants.elevationMedium,
        ),
      ),
      
      cardTheme: CardTheme(
        color: AppColors.cardBackground,
        elevation: AppConstants.elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
      ),
      
      // 📱 Visual Density
      visualDensity: VisualDensity.adaptivePlatformDensity,
      
      // ✨ Modern Material 3 features
      useMaterial3: true,
    );
  }

  /// 🌙 Dark Theme - Future-ready for dark mode
  ThemeData _buildDarkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        surface: AppColors.surfaceDark,
        background: AppColors.backgroundDark,
        error: AppColors.error,
      ),
      
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.heading1,
        displayMedium: AppTextStyles.heading2,
        displaySmall: AppTextStyles.heading3,
        headlineMedium: AppTextStyles.heading4,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
      
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
    );
  }
}