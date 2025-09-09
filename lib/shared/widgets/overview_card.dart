import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/models/overview_item.dart';
import '../../core/constants/app_constants.dart';

/// Modern card widget for displaying overview items
/// Responsive and accessible with Material 3 design
class OverviewCard extends StatelessWidget {
  const OverviewCard({
    super.key,
    required this.item,
  });

  final OverviewItem item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHighest.withAlpha(50),
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(AppConstants.cardRadius),
        child: Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with icon and badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(AppConstants.smallPadding.w),
                      decoration: BoxDecoration(
                        color: item.color.withAlpha(30),
                        borderRadius: BorderRadius.circular(AppConstants.buttonRadius.r),
                      ),
                      child: Icon(
                        item.icon,
                        color: item.color,
                        size: 24.w,
                      ),
                    ),
                  ),
                  if (item.badge != null)
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.smallPadding.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          item.badge!,
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(height: AppConstants.defaultPadding.h),

              // Title
              Text(
                item.title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: AppConstants.smallPadding.h),

              // Subtitle
              Text(
                item.subtitle,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}