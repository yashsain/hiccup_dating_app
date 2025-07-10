import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io' show Platform;

import 'router/app_router.dart';
import '../shared/constants/app_constants.dart';
import '../shared/services/theme_provider.dart';
import '../platform/android/theme_config.dart';
import '../platform/ios/theme_config.dart';

/// 🎯 Main App Widget - New Theme System Integration (2025)
///
/// This widget now uses:
/// - Centralized theme service for all styling
/// - Riverpod theme provider for state management
/// - Platform-specific theme adaptations
/// - Automatic system theme detection
/// - Single source of truth for all colors and styling
///
/// Key improvements:
/// - ✅ Change one color, update entire app
/// - ✅ Automatic light/dark theme switching
/// - ✅ Platform-specific system UI handling
/// - ✅ Clean, maintainable architecture
/// - ✅ Future-ready for manual theme switching
class HiccupApp extends ConsumerWidget {
  const HiccupApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎭 Watch theme providers
    final themeMode = ref.watch(themeProvider);
    final lightTheme = ref.watch(lightThemeProvider);
    final darkTheme = ref.watch(darkThemeProvider);
    final currentBrightness = ref.watch(currentBrightnessProvider);

    // 🧭 Get the router from Riverpod
    final router = ref.watch(AppRouter.routerProvider);

    // 🎨 Apply platform-specific theme adaptations
    final adaptedLightTheme = _adaptThemeForPlatform(lightTheme);
    final adaptedDarkTheme = _adaptThemeForPlatform(darkTheme);

    // 🔄 Update system UI overlay style when theme changes
    ref.listen<Brightness>(currentBrightnessProvider, (previous, next) {
      if (previous != next) {
        _handleThemeChange(next);
      }
    });

    return MaterialApp.router(
      // 📱 App Configuration
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,

      // 🧭 Router Configuration
      routerConfig: router,

      // 🎨 Theme Configuration - NEW CENTRALIZED SYSTEM
      theme: adaptedLightTheme,
      darkTheme: adaptedDarkTheme,
      themeMode: themeMode,

      // 🎯 Builder - Handle theme changes and system UI
      builder: (context, child) {
        // Ensure system UI is updated when app builds
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _handleThemeChange(currentBrightness);
        });

        return child ?? const SizedBox.shrink();
      },

      // 🌍 Future: Localization support (Phase 2)
      // locale: const Locale('en', 'US'),
      // supportedLocales: const [
      //   Locale('en', 'US'),
      //   Locale('es', 'ES'),
      // ],
    );
  }

  /// 🎨 Adapt theme for current platform
  ThemeData _adaptThemeForPlatform(ThemeData theme) {
    if (Platform.isAndroid) {
      return AndroidThemeConfig.adaptThemeForAndroid(theme);
    } else if (Platform.isIOS) {
      return IOSThemeConfig.adaptThemeForIOS(theme);
    }

    // Default: return theme as-is for other platforms
    return theme;
  }

  /// 🔄 Handle theme changes across platforms
  void _handleThemeChange(Brightness brightness) {
    if (Platform.isAndroid) {
      AndroidThemeConfig.handleThemeChange(brightness);
    } else if (Platform.isIOS) {
      IOSThemeConfig.handleThemeChange(brightness);
    }
  }
}

/// 🎭 Theme-Aware App Widget - For widgets that need theme context
///
/// This is a helper widget that provides theme context to child widgets
/// without requiring them to use Consumer widgets directly.
class ThemeAwareApp extends ConsumerWidget {
  final Widget child;

  const ThemeAwareApp({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Provide theme context to child widgets
    final currentBrightness = ref.watch(currentBrightnessProvider);

    return Theme(
      data: Theme.of(context),
      child: Builder(
        builder: (context) {
          // 🔄 Update system UI when theme changes
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Platform.isAndroid) {
              AndroidThemeConfig.handleThemeChange(currentBrightness);
            } else if (Platform.isIOS) {
              IOSThemeConfig.handleThemeChange(currentBrightness);
            }
          });

          return child;
        },
      ),
    );
  }
}

/// 🎯 Theme Context Extensions - Helper extensions for theme access
extension ThemeContextExtensions on BuildContext {
  /// Get current theme brightness
  Brightness get themeBrightness => Theme.of(this).brightness;

  /// Check if current theme is dark
  bool get isDarkTheme => themeBrightness == Brightness.dark;

  /// Check if current theme is light
  bool get isLightTheme => themeBrightness == Brightness.light;

  /// Get primary color from current theme
  Color get primaryColor => Theme.of(this).colorScheme.primary;

  /// Get secondary color from current theme
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  /// Get surface color from current theme
  Color get surfaceColor => Theme.of(this).colorScheme.surface;

  /// Get background color from current theme
  Color get backgroundColor => Theme.of(this).colorScheme.surface;

  /// Get primary text color from current theme
  Color get primaryTextColor => Theme.of(this).colorScheme.onSurface;

  /// Get secondary text color from current theme
  Color get secondaryTextColor =>
      Theme.of(this).colorScheme.onSurface.withOpacity(0.6);
}
