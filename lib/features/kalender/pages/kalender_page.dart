import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_constants.dart';

/// Kalender page for managing schedules and events
class KalenderPage extends StatelessWidget {
  const KalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Kalender'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Add new event
            },
            icon: const Icon(Icons.add_rounded),
            tooltip: 'Neuer Termin',
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
              'Anstehende Termine',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: AppConstants.defaultPadding.h),

            // Calendar view placeholder
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withAlpha(30),
                borderRadius: BorderRadius.circular(AppConstants.cardRadius.r),
                border: Border.all(
                  color: colorScheme.outline.withAlpha(50),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 48.w,
                      color: colorScheme.primary,
                    ),
                    SizedBox(height: AppConstants.smallPadding.h),
                    Text(
                      'Kalenderansicht',
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppConstants.largePadding.h),

            // Events list
            Text(
              'Heute',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: AppConstants.smallPadding.h),

            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: AppConstants.smallPadding.h),
                    child: ListTile(
                      leading: Container(
                        width: 4.w,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      title: Text('Termin ${index + 1}'),
                      subtitle: Text('${9 + index}:00 - ${10 + index}:00'),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16.w,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      onTap: () {
                        // TODO: Open event details
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