import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/splash/presentation/splash_screen.dart';
import '../../features/main_navigation/presentation/main_navigation_screen.dart';
import '../../features/discovery/presentation/discovery_screen.dart';
import '../../features/chat/presentation/chat_screen.dart';
import '../../features/gifts/presentation/gifts_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';

/// 🧭 App Router - Modern Navigation Setup (2025)
/// Using go_router for declarative navigation with deep linking support
/// This setup is future-ready for authentication guards and complex navigation

class AppRouter {
  // 🚫 Private constructor
  AppRouter._();

  // 📍 Route Names - Type-safe navigation
  static const String splash = '/';

  // 🔮 Future routes (as you build features)
  static const String auth = '/auth';
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String home = '/home';
  // static const String profile = '/profile';
  static const String chat = '/chat';
  static const String matches = '/matches';

  // 🏠 Main Navigation Routes
  static const String mainNavigation = '/main';
  static const String discovery = '/main/discovery';
  static const String chats = '/main/chats';
  static const String gifts = '/main/gifts';
  static const String profile = '/main/profile';

  /// 🌟 Router Configuration
  /// Riverpod provider for the router - makes it easy to access and test
  /// 🌟 Router Configuration
  static final routerProvider = Provider<GoRouter>((ref) {
    return GoRouter(
      initialLocation: splash,
      debugLogDiagnostics: true,

      routes: [
        // 🚀 Splash Screen Route
        GoRoute(
          path: splash,
          name: 'splash',
          builder: (context, state) => const SplashScreen(),
        ),

        // 🏠 Main Navigation Shell
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainNavigationScreen(navigationShell: navigationShell);
          },
          branches: [
            // 🔍 Discovery Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: discovery,
                  name: 'discovery',
                  builder: (context, state) => const DiscoveryScreen(),
                ),
              ],
            ),

            // 💬 Chats Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: chats,
                  name: 'chats',
                  builder: (context, state) => const ChatScreen(),
                ),
              ],
            ),

            // 🎁 Gifts Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: gifts,
                  name: 'gifts',
                  builder: (context, state) => const GiftsScreen(),
                ),
              ],
            ),

            // 👤 Profile Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: profile,
                  name: 'profile',
                  builder: (context, state) => const ProfileScreen(),
                ),
              ],
            ),
          ],
        ),
      ],

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

      redirect: (context, state) {
        return null;
      },
    );
  });
}

/// 🎯 Router Extensions - Helper methods for type-safe navigation
extension AppRouterExtension on BuildContext {
  // 🚀 Navigation helpers - makes navigation cleaner throughout the app
  void goToSplash() => go(AppRouter.splash);

  // 🏠 Main navigation methods
  void goToDiscovery() => go(AppRouter.discovery);
  void goToChats() => go(AppRouter.chats);
  void goToGifts() => go(AppRouter.gifts);
  void goToProfile() => go(AppRouter.profile);

  // 🔮 Future navigation methods
  // void goToLogin() => go(AppRouter.login);
  // void goToRegister() => go(AppRouter.register);
  // void goToHome() => go(AppRouter.home);
}
