import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/providers/theme_provider.dart';
import '../../../shared/widgets/overview_card.dart';
import '../../../shared/widgets/responsive_grid.dart';
import '../services/overview_service.dart';

/// Main overview page displaying all app sections in a modern grid layout
/// Responsive design adapts to different screen sizes automatically
class OverviewPage extends ConsumerWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final overviewItems = OverviewService.getSampleOverviewItems();

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // Modern app bar with gradient background
          SliverAppBar.large(
            backgroundColor: colorScheme.surface,
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppConstants.appName,
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    'Willkommen zurück! Hier ist deine Übersicht.',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              centerTitle: false,
              titlePadding: EdgeInsets.only(
                left: AppConstants.defaultPadding.w,
                bottom: AppConstants.defaultPadding.h,
              ),
            ),
            actions: [
              // Theme toggle button
              IconButton(
                onPressed: () {
                  ref.read(themeProvider.notifier).toggleTheme();
                },
                icon: Icon(
                  Theme.of(context).brightness == Brightness.dark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                ),
                tooltip: 'Theme wechseln',
              ),
              // Settings button
              IconButton(
                onPressed: () {
                  // TODO: Navigate to settings
                },
                icon: const Icon(Icons.settings_rounded),
                tooltip: 'Einstellungen',
              ),
              SizedBox(width: AppConstants.smallPadding.w),
            ],
          ),

          // Grid content
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ResponsiveGrid(
                children: overviewItems
                    .map((item) => OverviewCard(item: item))
                    .toList(),
              ),
            ),
          ),
        ],
      ),

      // Floating action button for quick actions
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Show quick action menu
          _showQuickActionMenu(context);
        },
        icon: const Icon(Icons.add_rounded),
        label: const Text('Neu'),
        tooltip: 'Schnellaktion',
      ),
    );
  }

  /// Shows a bottom sheet with quick action options
  void _showQuickActionMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => Container(
        width: double.infinity,
        padding: EdgeInsets.all(AppConstants.defaultPadding.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schnellaktionen',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: AppConstants.defaultPadding.h),
            
            // Quick action tiles
            ListTile(
              leading: const Icon(Icons.task_alt_rounded),
              title: const Text('Neue Aufgabe'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Create new task
              },
            ),
            ListTile(
              leading: const Icon(Icons.event_rounded),
              title: const Text('Neuer Termin'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Create new event
              },
            ),
            ListTile(
              leading: const Icon(Icons.note_add_rounded),
              title: const Text('Neue Notiz'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Create new note
              },
            ),
            
            SizedBox(height: AppConstants.defaultPadding.h),
          ],
        ),
      ),
    );
  }
}