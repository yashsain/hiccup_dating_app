import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/chat/presentation/chat_screen.dart';
import '../../features/discovery/presentation/discovery_screen.dart';
import '../../features/gifts/presentation/gifts_screen.dart';
import '../../features/main_navigation/presentation/main_navigation_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/screens/profile_edit_screen.dart'; // NEW IMPORT
import '../../features/splash/presentation/splash_screen.dart';

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

  // ✏️ NEW: Profile Edit Route
  static const String profileEdit = '/main/profile/edit';

  /// 🌟 Router Configuration
  /// Riverpod provider for the router - makes it easy to access and test
  /// 🌟 Router Configuration
  static final routerProvider = Provider<GoRouter>(
    (ref) => GoRouter(
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
          builder: (context, state, navigationShell) =>
              MainNavigationScreen(navigationShell: navigationShell),
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

            // 👤 Profile Branch (UPDATED)
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: profile,
                  name: 'profile',
                  builder: (context, state) => const ProfileScreen(),
                  routes: [
                    // ✏️ NEW: Profile Edit Sub-route
                    GoRoute(
                      path: 'edit',
                      name: 'profileEdit',
                      builder: (context, state) {
                        // Extract profile ID from query parameters or use default
                        final profileId =
                            state.uri.queryParameters['profileId'] ??
                            'alex_chen_001';

                        return ProfileEditScreen(profileId: profileId);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],

      // 🚫 Error handling for unknown routes
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Page Not Found',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'The page "${state.matchedLocation}" does not exist.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go(mainNavigation),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  // ============================================================================
  // 🎯 NAVIGATION HELPER METHODS
  // ============================================================================

  /// 🚀 Navigate to splash screen
  static void goToSplash(BuildContext context) {
    context.go(splash);
  }

  /// 🏠 Navigate to main navigation (default tab)
  static void goToMainNavigation(BuildContext context) {
    context.go(mainNavigation);
  }

  /// 🔍 Navigate to discovery
  static void goToDiscovery(BuildContext context) {
    context.go(discovery);
  }

  /// 💬 Navigate to chats
  static void goToChats(BuildContext context) {
    context.go(chats);
  }

  /// 🎁 Navigate to gifts
  static void goToGifts(BuildContext context) {
    context.go(gifts);
  }

  /// 👤 Navigate to profile
  static void goToProfile(BuildContext context) {
    context.go(profile);
  }

  /// ✏️ NEW: Navigate to profile edit
  static void goToProfileEdit(BuildContext context, {String? profileId}) {
    if (profileId != null) {
      context.go('$profileEdit?profileId=$profileId');
    } else {
      context.go(profileEdit);
    }
  }

  /// ✏️ NEW: Push profile edit (modal style)
  static void pushProfileEdit(BuildContext context, {String? profileId}) {
    if (profileId != null) {
      context.push('$profileEdit?profileId=$profileId');
    } else {
      context.push(profileEdit);
    }
  }
}

// ============================================================================
// 📋 IMPLEMENTATION NOTES
// ============================================================================

/// **🎯 NEW CHANGES MADE:**
/// - ✅ Added ProfileEditScreen import
/// - ✅ Added profileEdit route constant
/// - ✅ Added edit sub-route under profile branch
/// - ✅ Added navigation helper methods for profile edit
/// - ✅ Support for profile ID parameter passing
/// - ✅ Both push (modal) and go (navigation) options
/// 
/// **🏗️ ROUTE STRUCTURE:**
/// ```
/// /main/profile          → ProfileScreen
/// /main/profile/edit     → ProfileEditScreen
/// ```
/// 
/// **🔄 USAGE EXAMPLES:**
/// ```dart
/// // Navigate to edit (replace current)
/// AppRouter.goToProfileEdit(context, profileId: 'user123');
/// 
/// // Push edit (modal style)
/// AppRouter.pushProfileEdit(context, profileId: 'user123');
/// 
/// // From within ProfileScreen:
/// context.push('/main/profile/edit?profileId=alex_chen_001');
/// ```
/// 
/// **⚡ BENEFITS:**
/// - Clean URL structure with sub-routes
/// - Profile ID parameter support
/// - Modal and navigation options
/// - Type-safe navigation helpers
/// - Future-ready for deep linking