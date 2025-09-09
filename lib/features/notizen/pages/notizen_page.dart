import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_constants.dart';

/// Notizen page for managing notes and ideas
class NotizenPage extends StatelessWidget {
  const NotizenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Notizen'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Search notes
            },
            icon: const Icon(Icons.search_rounded),
            tooltip: 'Suchen',
          ),
          IconButton(
            onPressed: () {
              // TODO: Add new note
            },
            icon: const Icon(Icons.add_rounded),
            tooltip: 'Neue Notiz',
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.defaultPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with quick stats
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Meine Notizen',
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.smallPadding.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '12 Notizen',
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstants.defaultPadding.h),

            // Filter chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChip(
                    label: const Text('Alle'),
                    selected: true,
                    onSelected: (selected) {},
                  ),
                  SizedBox(width: AppConstants.smallPadding.w),
                  FilterChip(
                    label: const Text('Wichtig'),
                    selected: false,
                    onSelected: (selected) {},
                  ),
                  SizedBox(width: AppConstants.smallPadding.w),
                  FilterChip(
                    label: const Text('Privat'),
                    selected: false,
                    onSelected: (selected) {},
                  ),
                  SizedBox(width: AppConstants.smallPadding.w),
                  FilterChip(
                    label: const Text('Arbeit'),
                    selected: false,
                    onSelected: (selected) {},
                  ),
                ],
              ),
            ),

            SizedBox(height: AppConstants.defaultPadding.h),

            // Notes grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.smallPadding.w,
                  mainAxisSpacing: AppConstants.smallPadding.h,
                  childAspectRatio: 1.2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final colors = [
                    Colors.yellow.shade100,
                    Colors.blue.shade100,
                    Colors.green.shade100,
                    Colors.pink.shade100,
                    Colors.orange.shade100,
                    Colors.purple.shade100,
                  ];
                  
                  return Card(
                    color: colors[index % colors.length],
                    child: InkWell(
                      onTap: () {
                        // TODO: Open note for editing
                      },
                      borderRadius: BorderRadius.circular(AppConstants.cardRadius.r),
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.defaultPadding.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Notiz ${index + 1}',
                                    style: textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (index == 0)
                                  Icon(
                                    Icons.star_rounded,
                                    size: 16.w,
                                    color: Colors.amber,
                                  ),
                              ],
                            ),
                            SizedBox(height: AppConstants.smallPadding.h),
                            Expanded(
                              child: Text(
                                'Das ist der Inhalt der Notiz ${index + 1}. Hier steht ein wichtiger Gedanke oder eine Idee...',
                                style: textTheme.bodySmall,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
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