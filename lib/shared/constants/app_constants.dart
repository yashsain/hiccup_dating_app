/// 🎯 App Constants - Central configuration for the entire app
/// This follows 2025 best practices for maintaining consistent values
class AppConstants {
  // 🚫 Private constructor - This class should not be instantiated
  AppConstants._();
  
  // 📱 App Information
  static const String appName = 'Hiccup';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Modern Dating App';
  
  // ⏱️ Timing Constants
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration debounceDelay = Duration(milliseconds: 500);
  
  // 📏 Layout Constants
  static const double borderRadius = 12.0;
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;
  
  // 📱 Responsive Breakpoints (for future tablet support)
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  
  // 🔐 Future: API Configuration (when you add backend)
  static const String baseUrl = 'https://api.hiccup.app';
  static const Duration apiTimeout = Duration(seconds: 30);
}