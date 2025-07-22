import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiccup_dating_app/features/profile/domain/entities/poll_entity.dart';
import 'package:hiccup_dating_app/features/profile/domain/entities/prompt_entity.dart';
import 'package:hiccup_dating_app/features/profile/domain/entities/media_entity.dart';
import 'profile_providers.dart';
import '../../domain/usecases/profile_data.dart';

/// 🎯 Profile Integration Demo - Complete Data Flow Example (2025)
///
/// This demo shows how to use the complete profile data system with Riverpod.
/// It demonstrates all the key patterns you'll use throughout your app.
///
/// **What This Demo Shows:**
/// ✅ Automatic demo data initialization
/// ✅ Profile retrieval with error handling
/// ✅ Real-time data updates
/// ✅ All profile content (prompts, media, interests, badges)
/// ✅ Statistics and analytics
/// ✅ Backend-ready architecture
///
/// **Perfect for:**
/// - Understanding the complete data flow
/// - Testing profile functionality
/// - Learning Riverpod patterns
/// - Validating backend swap readiness
/// - Demo presentations
///
/// **Usage:**
/// ```dart
/// // Add to your app for testing
/// Navigator.push(context, MaterialPageRoute(
///   builder: (context) => const ProfileIntegrationDemo(),
/// ));
/// ```
class ProfileIntegrationDemo extends ConsumerWidget {
  const ProfileIntegrationDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Integration Demo'),
        backgroundColor: Colors.red.shade400,
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DemoDataSection(),
            SizedBox(height: 24),
            _AllProfilesSection(),
            SizedBox(height: 24),
            _SingleProfileSection(),
            SizedBox(height: 24),
            _ProfileContentSection(),
            SizedBox(height: 24),
            _AnalyticsSection(),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// 📊 DEMO DATA INITIALIZATION SECTION
// ============================================================================

class _DemoDataSection extends ConsumerWidget {
  const _DemoDataSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final demoDataInit = ref.watch(initializeDemoDataProvider);
    final healthCheck = ref.watch(demoDataHealthCheckProvider);
    final stats = ref.watch(databaseStatisticsProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.storage, color: Colors.blue.shade600),
                const SizedBox(width: 8),
                const Text(
                  'Demo Data System',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Demo Data Initialization Status
            demoDataInit.when(
              data: (initialized) => _StatusRow(
                'Demo Data Initialized',
                initialized,
                initialized ? 'Ready for testing!' : 'Failed to initialize',
              ),
              loading: () => const _LoadingRow('Initializing demo data...'),
              error: (error, stack) =>
                  _ErrorRow('Initialization failed: $error'),
            ),

            const SizedBox(height: 8),

            // Health Check Status
            healthCheck.when(
              data: (healthy) => _StatusRow(
                'Data Health Check',
                healthy,
                healthy
                    ? 'All systems operational'
                    : 'Data integrity issues detected',
              ),
              loading: () => const _LoadingRow('Checking data health...'),
              error: (error, stack) => _ErrorRow('Health check failed: $error'),
            ),

            const SizedBox(height: 16),

            // Database Statistics
            stats.when(
              data: (statistics) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Database Statistics:',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: statistics.entries
                        .map(
                          (entry) => Chip(
                            label: Text('${entry.key}: ${entry.value}'),
                            backgroundColor: Colors.blue.shade50,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              loading: () => const _LoadingRow('Loading statistics...'),
              error: (error, stack) => _ErrorRow('Stats failed: $error'),
            ),

            const SizedBox(height: 16),

            // Refresh Button
            ElevatedButton.icon(
              onPressed: () {
                ref.invalidate(initializeDemoDataProvider);
                ref.invalidate(demoDataHealthCheckProvider);
                ref.invalidate(databaseStatisticsProvider);
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh Demo Data'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// 👥 ALL PROFILES SECTION
// ============================================================================

class _AllProfilesSection extends ConsumerWidget {
  const _AllProfilesSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProfiles = ref.watch(allDemoProfilesProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.people, color: Colors.green.shade600),
                const SizedBox(width: 8),
                const Text(
                  'All Demo Profiles',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),

            allProfiles.when(
              data: (profiles) => Column(
                children: [
                  Text(
                    'Found ${profiles.length} demo profiles:',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  ...profiles.map((profile) => _ProfileTile(profile)),
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) =>
                  _ErrorRow('Failed to load profiles: $error'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// 👤 SINGLE PROFILE DETAILED SECTION
// ============================================================================

class _SingleProfileSection extends ConsumerWidget {
  const _SingleProfileSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use Alex Chen as example profile
    const profileId = 'alex_chen_001';
    final profile = ref.watch(profileProvider(profileId));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person, color: Colors.purple.shade600),
                const SizedBox(width: 8),
                const Text(
                  'Single Profile Example',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),

            profile.when(
              data: (profileData) {
                if (profileData == null) {
                  return const Text('Profile not found');
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_ProfileDetailCard(profileData as ProfileData)],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) =>
                  _ErrorRow('Failed to load profile: $error'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// 📋 PROFILE CONTENT SECTION
// ============================================================================

class _ProfileContentSection extends ConsumerWidget {
  const _ProfileContentSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const profileId = 'alex_chen_001';

    final prompts = ref.watch(profilePromptsProvider(profileId));
    final poll = ref.watch(profileActivePollProvider(profileId));
    final media = ref.watch(profileMediaProvider(profileId));
    final interests = ref.watch(profileInterestsProvider(profileId));
    final badges = ref.watch(profileVisibleBadgesProvider(profileId));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.content_paste, color: Colors.orange.shade600),
                const SizedBox(width: 8),
                const Text(
                  'Profile Content (Alex Chen)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Prompts
            _ContentSection(
              title: 'Prompts',
              icon: Icons.question_answer,
              asyncValue: prompts,
              itemBuilder: (prompt) =>
                  '${(prompt as PromptEntity?)?.question ?? 'N/A'}: ${(prompt)?.response ?? 'N/A'}',
            ),

            const SizedBox(height: 12),

            // Active Poll
            _ContentSection(
              title: 'Active Poll',
              icon: Icons.poll,
              asyncValue: poll,
              itemBuilder: (pollData) => pollData != null
                  ? '${(pollData as PollEntity?)?.question ?? 'N/A'} (${(pollData as PollEntity?)?.options.length ?? 0} options)'
                  : 'No active poll',
              isSingle: true,
            ),

            const SizedBox(height: 12),

            // Media
            _ContentSection(
              title: 'Media',
              icon: Icons.photo_library,
              asyncValue: media,
              itemBuilder: (mediaItem) {
                final item = mediaItem as MediaEntity?;
                return '${item?.type.name ?? 'unknown'}: ${item?.caption ?? 'No caption'}';
              },
            ),

            const SizedBox(height: 12),

            // Interests
            _ContentSection(
              title: 'Interests',
              icon: Icons.favorite,
              asyncValue: interests,
              itemBuilder: (interest) {
                final i = interest as dynamic;
                return '${i.interest ?? 'unknown'} (${i.category?.name ?? 'uncategorized'})';
              },
            ),

            const SizedBox(height: 12),

            // Badges
            _ContentSection(
              title: 'Badges',
              icon: Icons.military_tech,
              asyncValue: badges,
              itemBuilder: (badge) {
                final b = badge as dynamic;
                return '${b.badge ?? 'unknown'} (${b.type?.name ?? 'unknown'})';
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// 📊 ANALYTICS SECTION
// ============================================================================

class _AnalyticsSection extends ConsumerWidget {
  const _AnalyticsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const profileId = 'alex_chen_001';
    final statistics = ref.watch(profileStatisticsProvider(profileId));
    final verifiedProfiles = ref.watch(verifiedProfilesProvider);
    final premiumProfiles = ref.watch(premiumProfilesProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.analytics, color: Colors.indigo.shade600),
                const SizedBox(width: 8),
                const Text(
                  'Analytics & Statistics',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Profile Statistics
            statistics.when(
              data: (stats) {
                if (stats == null) return const Text('No statistics available');

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Alex Chen Profile Stats:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: stats.entries
                          .map(
                            (entry) => Chip(
                              label: Text('${entry.key}: ${entry.value}'),
                              backgroundColor: Colors.indigo.shade50,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                );
              },
              loading: () => const _LoadingRow('Loading statistics...'),
              error: (error, stack) => _ErrorRow('Stats failed: $error'),
            ),

            const SizedBox(height: 16),

            // Global Statistics
            Row(
              children: [
                Expanded(
                  child: verifiedProfiles.when(
                    data: (profiles) => _StatCard(
                      'Verified Profiles',
                      profiles.length.toString(),
                      Icons.verified,
                      Colors.green,
                    ),
                    loading: () => const _StatCard(
                      'Verified',
                      '...',
                      Icons.verified,
                      Colors.grey,
                    ),
                    error: (_, __) => const _StatCard(
                      'Verified',
                      'Error',
                      Icons.error,
                      Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: premiumProfiles.when(
                    data: (profiles) => _StatCard(
                      'Premium Profiles',
                      profiles.length.toString(),
                      Icons.star,
                      Colors.amber,
                    ),
                    loading: () => const _StatCard(
                      'Premium',
                      '...',
                      Icons.star,
                      Colors.grey,
                    ),
                    error: (_, __) => const _StatCard(
                      'Premium',
                      'Error',
                      Icons.error,
                      Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// 🎨 HELPER WIDGETS
// ============================================================================

class _StatusRow extends StatelessWidget {
  final String label;
  final bool status;
  final String message;

  const _StatusRow(this.label, this.status, this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          status ? Icons.check_circle : Icons.error,
          color: status ? Colors.green : Colors.red,
          size: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(
                message,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoadingRow extends StatelessWidget {
  final String message;

  const _LoadingRow(this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        const SizedBox(width: 8),
        Text(message),
      ],
    );
  }
}

class _ErrorRow extends StatelessWidget {
  final String message;

  const _ErrorRow(this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.error, color: Colors.red, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(message, style: TextStyle(color: Colors.red.shade700)),
        ),
      ],
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final Map<String, dynamic> profile;

  const _ProfileTile(this.profile);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.shade100,
        child: Text(
          (profile['name'] as String?)
                  ?.toString()
                  .substring(0, 1)
                  .toUpperCase() ??
              '?',
          style: TextStyle(
            color: Colors.blue.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(profile['name'] as String? ?? 'Unknown'),
      subtitle: Text('${profile['age']} • ${profile['location']}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (profile['photo_verification'] == 1)
            Icon(Icons.verified, color: Colors.green, size: 16),
          if (profile['premium'] != null)
            Icon(Icons.star, color: Colors.amber, size: 16),
        ],
      ),
    );
  }
}

class _ProfileDetailCard extends StatelessWidget {
  final ProfileData profileData;

  const _ProfileDetailCard(this.profileData);

  @override
  Widget build(BuildContext context) {
    final profile = profileData.profile;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.purple.shade100,
                child: Text(
                  profile.name.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade800,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${profile.age} • ${profile.location}',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    if (profile.bio != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        profile.bio!,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: [
              Chip(
                label: Text('${profileData.prompts.length} prompts'),
                backgroundColor: Colors.blue.shade50,
              ),
              Chip(
                label: Text('${profileData.media.length} media'),
                backgroundColor: Colors.green.shade50,
              ),
              Chip(
                label: Text('${profileData.interests.length} interests'),
                backgroundColor: Colors.orange.shade50,
              ),
              Chip(
                label: Text('${profileData.badges.length} badges'),
                backgroundColor: Colors.purple.shade50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContentSection<T> extends StatelessWidget {
  final String title;
  final IconData icon;
  final AsyncValue<dynamic> asyncValue;
  final String Function(T) itemBuilder;
  final bool isSingle;

  const _ContentSection({
    required this.title,
    required this.icon,
    required this.asyncValue,
    required this.itemBuilder,
    this.isSingle = false,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
      const SizedBox(height: 4),
      asyncValue.when(
        data: (data) {
          if (isSingle) {
            return Text(
              '• ${itemBuilder(data as T)}',
              style: const TextStyle(fontSize: 12),
            );
          } else {
            final items = data as List<T>;
            if (items.isEmpty) {
              return Text(
                'No $title found',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .take(3)
                  .map(
                    (item) => Text(
                      '• ${itemBuilder(item)}',
                      style: const TextStyle(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                  .toList(),
            );
          }
        },
        loading: () =>
            Text('Loading $title...', style: const TextStyle(fontSize: 12)),
        error: (error, stack) => Text(
          'Error loading $title',
          style: TextStyle(fontSize: 12, color: Colors.red.shade600),
        ),
      ),
    ],
  );
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard(this.title, this.value, this.icon, this.color);

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: color.withOpacity(0.3)),
    ),
    child: Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
