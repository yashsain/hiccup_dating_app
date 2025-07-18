import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io' show Platform;

import 'app/app.dart';
import 'platform/android/theme_config.dart';
import 'platform/ios/theme_config.dart';

/// 🚀 Main Entry Point - New Theme System Integration (2025)
///
/// This is where your Hiccup dating app begins with the new centralized theme system!
///
/// New features in Phase 1:
/// ✅ Centralized theme management
/// ✅ Automatic system theme detection
/// ✅ Platform-specific UI configurations
/// ✅ Single source of truth for all colors
/// ✅ Clean, maintainable architecture
/// ✅ Future-ready for manual theme switching
///
/// Following 2025 best practices:
/// ✅ Riverpod for state management
/// ✅ Clean architecture with separation of concerns
/// ✅ Platform-specific configurations
/// ✅ Modern UI/UX patterns
/// ✅ Performance optimizations

void main() async {
  // 🔧 Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 📱 Configure app for optimal experience with new theme system
  await _configureApp();

  // 🚀 Start the app with Riverpod and new theme system
  runApp(
    // 🎯 ProviderScope enables Riverpod throughout the entire app
    const ProviderScope(child: HiccupApp()),
  );
}

/// ⚙️ Configure app settings and platform-specific optimizations
Future<void> _configureApp() async {
  // 🎨 Configure platform-specific system UI
  await _configurePlatformSpecificSystemUI();

  // 📱 Set preferred orientations (portrait only for dating app)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 🔮 Future: Initialize other services here
  // - Firebase
  // - Analytics
  // - Crash reporting
  // - Push notifications
  // - Authentication
  // - Location services
}

/// 🎨 Configure platform-specific system UI
Future<void> _configurePlatformSpecificSystemUI() async {
  if (Platform.isAndroid) {
    // 🤖 Android-specific configuration
    await AndroidThemeConfig.configureSystemUi();

    // Set initial system UI overlay style for Android
    SystemChrome.setSystemUIOverlayStyle(
      AndroidThemeConfig.getSystemUiOverlayStyle(
        // Get initial brightness from system
        WidgetsBinding.instance.platformDispatcher.platformBrightness,
      ),
    );
  } else if (Platform.isIOS) {
    // 🍎 iOS-specific configuration
    await IOSThemeConfig.configureSystemUi();

    // Set initial system UI overlay style for iOS
    SystemChrome.setSystemUIOverlayStyle(
      IOSThemeConfig.getSystemUiOverlayStyle(
        // Get initial brightness from system
        WidgetsBinding.instance.platformDispatcher.platformBrightness,
      ),
    );
  }
}

/// 🎯 Production optimizations (enable for release builds)
///
/// Add these to your build configuration:
/// ```
/// flutter build apk --release --obfuscate --split-debug-info=build/debug-info
/// flutter build ios --release --obfuscate --split-debug-info=build/debug-info
/// ```
///
/// Benefits:
/// - Code obfuscation for security
/// - Smaller app size
/// - Better performance
/// - Debug info separation
/// - Optimized theme switching performance

/// 🔧 Debug Configuration - For development only
///
/// This configuration is only active in debug mode
/// and provides helpful debugging information for theme development.
class DebugConfig {
  static void configureDebugMode() {
    assert(() {
      // 🐛 Debug-only theme information
      debugPrint('🎨 Hiccup Theme System - Debug Mode');
      debugPrint('📱 Platform: ${Platform.operatingSystem}');
      debugPrint(
        '🌟 Current brightness: ${WidgetsBinding.instance.platformDispatcher.platformBrightness}',
      );
      debugPrint('✅ Theme system initialized successfully');

      return true;
    }());
  }
}

/// 🎭 Theme System Information - For debugging and development
///
/// This class provides information about the current theme system state
/// and is useful for debugging theme-related issues.
class ThemeSystemInfo {
  static Map<String, dynamic> getSystemInfo() {
    return {
      'platform': Platform.operatingSystem,
      'brightness': WidgetsBinding
          .instance
          .platformDispatcher
          .platformBrightness
          .toString(),
      'theme_system_version': '1.0.0',
      'last_updated': DateTime.now().toIso8601String(),
    };
  }

  static void printSystemInfo() {
    final info = getSystemInfo();
    debugPrint('🎨 Theme System Info:');
    info.forEach((key, value) {
      debugPrint('  $key: $value');
    });
  }
}

/// 🔍 Error Handling - For theme-related errors
///
/// This class handles errors that might occur during theme initialization
/// or switching, providing graceful fallbacks.
class ThemeErrorHandler {
  static void handleThemeError(dynamic error, StackTrace stackTrace) {
    // Log the error
    debugPrint('🚨 Theme System Error: $error');
    debugPrint('📍 Stack trace: $stackTrace');

    // In debug mode, show detailed error information
    assert(() {
      debugPrint('🔧 Debug info: ${ThemeSystemInfo.getSystemInfo()}');
      return true;
    }());

    // Provide fallback behavior
    _applyFallbackTheme();
  }

  static void _applyFallbackTheme() {
    // Apply a basic fallback theme if there are issues
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
  }
}
