import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/providers/theme_provider.dart';

/// Einstellungen page for app configuration and preferences
class EinstellungenPage extends ConsumerWidget {
  const EinstellungenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final currentTheme = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Einstellungen'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppConstants.defaultPadding.w),
        children: [
          // App Settings Section
          _buildSectionHeader(context, 'App-Einstellungen'),
          
          // Theme Settings
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.palette_rounded,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Design'),
                  subtitle: Text(_getThemeModeText(currentTheme)),
                  trailing: SegmentedButton<ThemeMode>(
                    segments: const [
                      ButtonSegment(
                        value: ThemeMode.light,
                        icon: Icon(Icons.light_mode_rounded, size: 16),
                      ),
                      ButtonSegment(
                        value: ThemeMode.dark,
                        icon: Icon(Icons.dark_mode_rounded, size: 16),
                      ),
                      ButtonSegment(
                        value: ThemeMode.system,
                        icon: Icon(Icons.brightness_auto_rounded, size: 16),
                      ),
                    ],
                    selected: {currentTheme},
                    onSelectionChanged: (selection) {
                      final newTheme = selection.first;
                      switch (newTheme) {
                        case ThemeMode.light:
                          ref.read(themeProvider.notifier).setLightTheme();
                          break;
                        case ThemeMode.dark:
                          ref.read(themeProvider.notifier).setDarkTheme();
                          break;
                        case ThemeMode.system:
                          ref.read(themeProvider.notifier).setSystemTheme();
                          break;
                      }
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.notifications_rounded,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Benachrichtigungen'),
                  subtitle: const Text('Push-Benachrichtigungen verwalten'),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {
                      // TODO: Toggle notifications
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.language_rounded,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Sprache'),
                  subtitle: const Text('Deutsch'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    // TODO: Language selection
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: AppConstants.largePadding.h),

          // Data & Privacy Section
          _buildSectionHeader(context, 'Daten & Datenschutz'),
          
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.backup_rounded,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Backup'),
                  subtitle: const Text('Daten sichern und wiederherstellen'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    // TODO: Backup settings
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.sync_rounded,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Synchronisierung'),
                  subtitle: const Text('Geräteübergreifende Synchronisation'),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {
                      // TODO: Toggle sync
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.privacy_tip_rounded,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Datenschutz'),
                  subtitle: const Text('Datenschutzrichtlinien anzeigen'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    // TODO: Show privacy policy
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: AppConstants.largePadding.h),

          // About Section
          _buildSectionHeader(context, 'Über die App'),
          
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.info_rounded,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Version'),
                  subtitle: Text('${AppConstants.appVersion} (Build 1)'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    // TODO: Show version details
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.feedback_rounded,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Feedback'),
                  subtitle: const Text('Bewertung abgeben oder Feedback senden'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    // TODO: Send feedback
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.help_rounded,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Hilfe'),
                  subtitle: const Text('Häufig gestellte Fragen und Support'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    // TODO: Show help
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    
    return Padding(
      padding: EdgeInsets.only(
        left: AppConstants.smallPadding.w,
        bottom: AppConstants.smallPadding.h,
        top: AppConstants.smallPadding.h,
      ),
      child: Text(
        title,
        style: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: colorScheme.primary,
        ),
      ),
    );
  }

  String _getThemeModeText(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Hell';
      case ThemeMode.dark:
        return 'Dunkel';
      case ThemeMode.system:
        return 'System';
    }
  }
}