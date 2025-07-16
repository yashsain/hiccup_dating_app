import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/services/theme_provider.dart';
import 'widgets/hiccup_bottom_nav_bar.dart';

/// 🏠 Main Navigation Screen - Shell wrapper for bottom navigation (2025)
///
/// This screen provides:
/// - Persistent bottom navigation across all main tabs
/// - State preservation for each tab using StatefulNavigationShell
/// - Theme-aware styling consistent with Hiccup brand
/// - Platform-specific optimizations
///
/// Tabs: Discovery → Chats → Gifts → Profile
class MainNavigationScreen extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme information
    final currentBrightness = ref.watch(currentBrightnessProvider);

    return Scaffold(
      // 🎯 Display current tab's screen
      body: navigationShell,

      // 🏠 Custom Hiccup bottom navigation bar
      bottomNavigationBar: HiccupBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onDestinationSelected,
        brightness: currentBrightness,
      ),
    );
  }

  /// 🎯 Handle tab selection without resetting to root
  void _onDestinationSelected(int index) {
    // Navigate to the selected branch without resetting the stack
    navigationShell.goBranch(
      index,
      // Don't reset to initial location - preserve current screen
      initialLocation: false,
    );
  }
}
