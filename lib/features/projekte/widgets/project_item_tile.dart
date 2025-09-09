import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_constants.dart';
import '../models/project_category.dart';

/// Individual project tile with drag functionality and detailed information
class ProjectItemTile extends StatelessWidget {
  const ProjectItemTile({
    super.key,
    required this.project,
    this.isLast = false,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final Project project;
  final bool isLast;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Draggable<Project>(
      data: project,
      feedback: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(AppConstants.cardRadius.r),
        child: Container(
          width: 300.w,
          padding: EdgeInsets.all(AppConstants.defaultPadding.w),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(AppConstants.cardRadius.r),
            border: Border.all(color: colorScheme.outline),
          ),
          child: _buildProjectContent(context, isDragging: true),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: _buildProjectTile(context),
      ),
      child: _buildProjectTile(context),
    );
  }

  Widget _buildProjectTile(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        border: !isLast 
            ? Border(
                bottom: BorderSide(
                  color: colorScheme.outline.withAlpha(50),
                  width: 1,
                ),
              )
            : null,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding.w,
          vertical: AppConstants.smallPadding.h,
        ),
        leading: _buildPriorityIndicator(context),
        title: _buildProjectContent(context),
        trailing: _buildActionButtons(context),
        onTap: onTap,
      ),
    );
  }

  Widget _buildPriorityIndicator(BuildContext context) {
    return Container(
      width: 4.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: project.priorityColor,
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  Widget _buildProjectContent(BuildContext context, {bool isDragging = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and completion status
        Row(
          children: [
            Expanded(
              child: Text(
                project.title,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  decoration: project.isCompleted 
                      ? TextDecoration.lineThrough 
                      : null,
                  color: project.isCompleted 
                      ? colorScheme.onSurfaceVariant 
                      : colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (project.isCompleted)
              Icon(
                Icons.check_circle_rounded,
                color: Colors.green,
                size: 16.w,
              ),
          ],
        ),

        SizedBox(height: AppConstants.smallPadding.h * 0.5),

        // Description
        Text(
          project.description,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          maxLines: isDragging ? 3 : 2,
          overflow: TextOverflow.ellipsis,
        ),

        SizedBox(height: AppConstants.smallPadding.h),

        // Progress bar
        if (project.progress > 0)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fortschritt',
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    '${(project.progress * 100).toInt()}%',
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              LinearProgressIndicator(
                value: project.progress,
                backgroundColor: colorScheme.outline.withAlpha(50),
                valueColor: AlwaysStoppedAnimation<Color>(project.priorityColor),
              ),
              SizedBox(height: AppConstants.smallPadding.h),
            ],
          ),

        // Tags and due date
        Row(
          children: [
            // Tags
            if (project.tags.isNotEmpty)
              Expanded(
                child: Wrap(
                  spacing: 4.w,
                  runSpacing: 2.h,
                  children: project.tags.take(3).map((tag) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        tag,
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSecondaryContainer,
                          fontSize: 10.sp,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

            // Due date
            if (project.dueDate != null)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.smallPadding.w,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: _getDueDateColor(context).withAlpha(30),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 12.w,
                      color: _getDueDateColor(context),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      _formatDueDate(project.dueDate!),
                      style: textTheme.labelSmall?.copyWith(
                        color: _getDueDateColor(context),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Drag handle
        Icon(
          Icons.drag_handle_rounded,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          size: 20.w,
        ),
        // Menu button
        PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'edit':
                onEdit?.call();
                break;
              case 'delete':
                onDelete?.call();
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: ListTile(
                leading: Icon(Icons.edit_rounded),
                title: Text('Bearbeiten'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: ListTile(
                leading: Icon(Icons.delete_rounded),
                title: Text('Löschen'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
          icon: Icon(
            Icons.more_vert_rounded,
            size: 20.w,
          ),
        ),
      ],
    );
  }

  Color _getDueDateColor(BuildContext context) {
    if (project.dueDate == null) return Theme.of(context).colorScheme.onSurfaceVariant;
    
    final now = DateTime.now();
    final daysUntilDue = project.dueDate!.difference(now).inDays;
    
    if (daysUntilDue < 0) return Colors.red; // Überfällig
    if (daysUntilDue <= 3) return Colors.orange; // Bald fällig
    if (daysUntilDue <= 7) return Colors.amber; // Diese Woche
    return Colors.green; // Noch Zeit
  }

  String _formatDueDate(DateTime date) {
    final now = DateTime.now();
    final difference = date.difference(now).inDays;
    
    if (difference < 0) return 'Überfällig';
    if (difference == 0) return 'Heute';
    if (difference == 1) return 'Morgen';
    if (difference <= 7) return '${difference}d';
    return '${date.day}.${date.month}';
  }
}