import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'shared/constants/app_colors.dart';

/// 🚀 Main Entry Point - Modern Flutter App (2025)
/// This is where your Hiccup dating app begins!
/// 
/// Following 2025 best practices:
/// ✅ Riverpod for state management
/// ✅ Clean architecture
/// ✅ Modern UI/UX
/// ✅ Platform-specific optimizations
/// ✅ Future-ready structure

void main() async {
  // 🔧 Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // 📱 Configure app for optimal experience
  await _configureApp();
  
  // 🚀 Start the app with Riverpod
  runApp(
    // 🎯 ProviderScope enables Riverpod throughout the entire app
    const ProviderScope(
      child: HiccupApp(),
    ),
  );
}

/// ⚙️ Configure app settings and platform-specific optimizations
Future<void> _configureApp() async {
  // 📱 Set system UI overlay style (status bar, navigation bar)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // ⚫ Status bar (top)
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      
      // ⚫ Navigation bar (bottom - Android)
      systemNavigationBarColor: AppColors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
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