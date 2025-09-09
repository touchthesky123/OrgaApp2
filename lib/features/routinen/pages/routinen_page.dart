import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_constants.dart';

/// Routinen page for managing daily routines and habits
class RoutinenPage extends StatelessWidget {
  const RoutinenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Routinen'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Add new routine
            },
            icon: const Icon(Icons.add_rounded),
            tooltip: 'Neue Routine',
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
              'Meine Routinen',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: AppConstants.defaultPadding.h),

            // Daily progress
            Container(
              padding: EdgeInsets.all(AppConstants.defaultPadding.w),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(AppConstants.cardRadius.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.local_fire_department_rounded,
                    color: colorScheme.primary,
                    size: 32.w,
                  ),
                  SizedBox(width: AppConstants.defaultPadding.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Heutige Fortschritte',
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '3 von 5 Routinen abgeschlossen',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer.withAlpha(180),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircularProgressIndicator(
                    value: 0.6,
                    backgroundColor: colorScheme.primary.withAlpha(50),
                    valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppConstants.largePadding.h),

            // Routines list
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  final isCompleted = index < 3;
                  return Card(
                    margin: EdgeInsets.only(bottom: AppConstants.smallPadding.h),
                    child: ListTile(
                      leading: Checkbox(
                        value: isCompleted,
                        onChanged: (value) {
                          // TODO: Toggle routine completion
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      title: Text(
                        'Routine ${index + 1}',
                        style: TextStyle(
                          decoration: isCompleted ? TextDecoration.lineThrough : null,
                          color: isCompleted 
                              ? colorScheme.onSurfaceVariant 
                              : colorScheme.onSurface,
                        ),
                      ),
                      subtitle: Text(
                        isCompleted ? 'Abgeschlossen' : 'Ausstehend',
                        style: TextStyle(
                          color: isCompleted 
                              ? Colors.green 
                              : colorScheme.onSurfaceVariant,
                        ),
                      ),
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