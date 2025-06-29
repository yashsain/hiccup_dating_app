import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/splash/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';

/// 🧭 App Router - Modern Navigation Setup (2025)
/// Using go_router for declarative navigation with deep linking support
/// This setup is future-ready for authentication guards and complex navigation

class AppRouter {
  // 🚫 Private constructor
  AppRouter._();
  
  // 📍 Route Names - Type-safe navigation
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  
  // 🔮 Future routes (as you build features)
  static const String auth = '/auth';
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String chat = '/chat';
  static const String matches = '/matches';
  
  /// 🌟 Router Configuration
  /// Riverpod provider for the router - makes it easy to access and test
  static final routerProvider = Provider<GoRouter>((ref) {
    return GoRouter(
      // 🎯 Initial location - starts with splash screen
      initialLocation: splash,
      
      // 🐛 Debug logging (disable in production)
      debugLogDiagnostics: true,
      
      // 📱 Routes configuration
      routes: [
        // 🚀 Splash Screen Route
        GoRoute(
          path: splash,
          name: 'splash',
          builder: (context, state) => const SplashScreen(),
        ),
        
        // 👋 Onboarding/Landing Route
        GoRoute(
          path: onboarding,
          name: 'onboarding',
          builder: (context, state) => const OnboardingScreen(),
        ),
        
        // 🔮 Future: Authentication Routes
        // GoRoute(
        //   path: auth,
        //   name: 'auth',
        //   routes: [
        //     GoRoute(
        //       path: 'login',
        //       name: 'login',
        //       builder: (context, state) => const LoginScreen(),
        //     ),
        //     GoRoute(
        //       path: 'register',
        //       name: 'register',
        //       builder: (context, state) => const RegisterScreen(),
        //     ),
        //   ],
        // ),
      ],
      
      // 🚫 Error handling - professional error pages
      errorBuilder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Oops!')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: ${state.error}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go(splash),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),
      
      // 🔄 Redirect logic (for authentication, onboarding, etc.)
      redirect: (context, state) {
        // 🔮 Future: Add authentication checks here
        // final isAuthenticated = ref.read(authProvider).isAuthenticated;
        // if (!isAuthenticated && state.location != auth) {
        //   return auth;
        // }
        return null; // No redirect for now
      },
    );
  });
}

/// 🎯 Router Extensions - Helper methods for type-safe navigation
extension AppRouterExtension on BuildContext {
  // 🚀 Navigation helpers - makes navigation cleaner throughout the app
  void goToSplash() => go(AppRouter.splash);
  void goToOnboarding() => go(AppRouter.onboarding);
  
  // 🔮 Future navigation methods
  // void goToLogin() => go(AppRouter.login);
  // void goToRegister() => go(AppRouter.register);
  // void goToHome() => go(AppRouter.home);
}