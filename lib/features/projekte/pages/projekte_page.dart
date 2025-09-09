import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_constants.dart';

/// Projekte page for managing user projects
class ProjektePage extends StatelessWidget {
  const ProjektePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Projekte'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Add new project
            },
            icon: const Icon(Icons.add_rounded),
            tooltip: 'Neues Projekt',
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.defaultPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Meine Projekte',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: AppConstants.defaultPadding.h),

            // Project list placeholder
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: AppConstants.smallPadding.h),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple.withAlpha(30),
                        child: Icon(
                          Icons.folder_rounded,
                          color: Colors.purple,
                        ),
                      ),
                      title: Text('Projekt ${index + 1}'),
                      subtitle: Text('Beschreibung des Projekts ${index + 1}'),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          // Handle menu selection
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: ListTile(
                              leading: Icon(Icons.edit_rounded),
                              title: Text('Bearbeiten'),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: ListTile(
                              leading: Icon(Icons.delete_rounded),
                              title: Text('Löschen'),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // TODO: Open project details
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}