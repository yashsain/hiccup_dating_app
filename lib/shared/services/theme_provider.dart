import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme_service.dart';

/// 🎭 Theme Provider - Centralized Theme State Management (2025)
///
/// This provider manages:
/// - Automatic system theme detection
/// - Theme state throughout the app
/// - System UI overlay style updates
/// - Future: Manual theme switching, persistence
///
/// Usage:
/// ```dart
/// final themeMode = ref.watch(themeProvider);
/// final currentBrightness = ref.watch(currentBrightnessProvider);
/// ```

/// 🎯 Theme Notifier - Handles theme state changes
class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.system;

  ThemeNotifier() {
    _initializeTheme();
  }

  /// Initialize theme system
  void _initializeTheme() {
    // For Phase 1: Always use system theme
    // Phase 2 will add manual switching and persistence
    _updateSystemUiOverlayStyle();
  }

  /// Update system UI overlay style based on current theme
  void _updateSystemUiOverlayStyle() {
    // Get current brightness from system
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    // Apply system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(
      ThemeService.getSystemUiOverlayStyle(brightness),
    );
  }

  /// Force update system UI overlay style
  void updateSystemUiOverlayStyle(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(
      ThemeService.getSystemUiOverlayStyle(brightness),
    );
  }

  // 🔮 FUTURE METHODS (Phase 2)

  /// Set theme to light mode (Future: Phase 2)
  void setLightTheme() {
    // Will be implemented in Phase 2
    state = ThemeMode.light;
    _updateSystemUiOverlayStyle();
  }

  /// Set theme to dark mode (Future: Phase 2)
  void setDarkTheme() {
    // Will be implemented in Phase 2
    state = ThemeMode.dark;
    _updateSystemUiOverlayStyle();
  }

  /// Set theme to system mode (Future: Phase 2)
  void setSystemTheme() {
    // Will be implemented in Phase 2
    state = ThemeMode.system;
    _updateSystemUiOverlayStyle();
  }

  /// Toggle between light and dark themes (Future: Phase 2)
  void toggleTheme() {
    // Will be implemented in Phase 2
    switch (state) {
      case ThemeMode.light:
        setDarkTheme();
        break;
      case ThemeMode.dark:
        setLightTheme();
        break;
      case ThemeMode.system:
        // When system, toggle to opposite of current brightness
        final brightness =
            WidgetsBinding.instance.platformDispatcher.platformBrightness;
        if (brightness == Brightness.light) {
          setDarkTheme();
        } else {
          setLightTheme();
        }
        break;
    }
  }
}

/// 🎭 Theme Provider - Main theme state provider
final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

/// 🌟 Current Brightness Provider - Tracks actual brightness being used
final currentBrightnessProvider = Provider<Brightness>((ref) {
  final themeMode = ref.watch(themeProvider);

  switch (themeMode) {
    case ThemeMode.light:
      return Brightness.light;
    case ThemeMode.dark:
      return Brightness.dark;
    case ThemeMode.system:
      // Get brightness from system
      return WidgetsBinding.instance.platformDispatcher.platformBrightness;
  }
});

/// 🎨 Light Theme Provider - Provides light theme data
final lightThemeProvider = Provider<ThemeData>((ref) {
  return ThemeService.getLightTheme();
});

/// 🌙 Dark Theme Provider - Provides dark theme data
final darkThemeProvider = Provider<ThemeData>((ref) {
  return ThemeService.getDarkTheme();
});

/// 🔄 System UI Overlay Style Provider - Provides current system UI style
final systemUiOverlayStyleProvider = Provider<SystemUiOverlayStyle>((ref) {
  final brightness = ref.watch(currentBrightnessProvider);
  return ThemeService.getSystemUiOverlayStyle(brightness);
});

/// 🎯 Theme Helper Methods - Utility methods for theme operations
class ThemeHelper {
  /// Check if current theme is dark
  static bool isDarkTheme(WidgetRef ref) {
    final brightness = ref.watch(currentBrightnessProvider);
    return brightness == Brightness.dark;
  }

  /// Check if current theme is light
  static bool isLightTheme(WidgetRef ref) {
    final brightness = ref.watch(currentBrightnessProvider);
    return brightness == Brightness.light;
  }

  /// Get current theme brightness
  static Brightness getCurrentBrightness(WidgetRef ref) {
    return ref.watch(currentBrightnessProvider);
  }

  /// Get themed color based on current brightness
  static Color getThemedColor(
    WidgetRef ref,
    Color lightColor,
    Color darkColor,
  ) {
    final brightness = ref.watch(currentBrightnessProvider);
    return brightness == Brightness.light ? lightColor : darkColor;
  }

  /// Update system UI overlay style
  static void updateSystemUiOverlayStyle(WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final brightness = ref.read(currentBrightnessProvider);
    themeNotifier.updateSystemUiOverlayStyle(brightness);
  }
}

/// 📱 Theme-Aware Widget Mixin - For widgets that need theme updates
mixin ThemeAware<T extends StatefulWidget> on State<T> {
  late WidgetRef _ref;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Update system UI overlay style when theme changes
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final container = ProviderScope.containerOf(context);
        final brightness = container.read(currentBrightnessProvider);
        SystemChrome.setSystemUIOverlayStyle(
          ThemeService.getSystemUiOverlayStyle(brightness),
        );
      });
    }
  }

  /// Get current theme brightness
  Brightness get currentBrightness {
    final container = ProviderScope.containerOf(context);
    return container.read(currentBrightnessProvider);
  }

  /// Check if current theme is dark
  bool get isDarkTheme => currentBrightness == Brightness.dark;

  /// Check if current theme is light
  bool get isLightTheme => currentBrightness == Brightness.light;
}
