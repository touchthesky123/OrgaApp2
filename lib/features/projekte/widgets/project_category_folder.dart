import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/spacing.dart';
import '../models/project_category.dart';
import 'project_item_tile.dart';

/// Visual folder representation for project categories with drag & drop support
class ProjectCategoryFolder extends StatelessWidget {
  const ProjectCategoryFolder({
    super.key,
    required this.category,
    required this.onToggleExpanded,
    required this.onProjectReorder,
    required this.onAcceptProject,
    this.onCategoryTap,
    this.onCategoryEdit,
    this.onCategoryDelete,
  });

  final ProjectCategory category;
  final VoidCallback onToggleExpanded;
  final Function(int oldIndex, int newIndex) onProjectReorder;
  final Function(Project project) onAcceptProject;
  final VoidCallback? onCategoryTap;
  final VoidCallback? onCategoryEdit;
  final VoidCallback? onCategoryDelete;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.verticalSm,
      ),
      child: Column(
        children: [
          // Category Header (Folder-like)
          DragTarget<Project>(
            onWillAcceptWithDetails: (details) => details.data.id != category.id,
            onAcceptWithDetails: (details) => onAcceptProject(details.data),
            builder: (context, candidateData, rejectedData) {
              final isHovering = candidateData.isNotEmpty;
              
              return AnimatedContainer(
                duration: AppConstants.shortAnimation,
                decoration: BoxDecoration(
                  color: isHovering 
                      ? category.color.withAlpha(50)
                      : colorScheme.surface,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppConstants.cardRadius.r),
                    bottom: category.isExpanded 
                        ? Radius.zero 
                        : Radius.circular(AppConstants.cardRadius.r),
                  ),
                  border: isHovering 
                      ? Border.all(color: category.color, width: 2)
                      : null,
                ),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: category.color.withAlpha(30),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    ),
                    child: Icon(
                      category.icon,
                      color: category.color,
                      size: 16.w,
                    ),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          category.name,
                          style: AppTypography.title(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                      // Project count badge
                      if (category.projectCount > 0)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: AppSpacing.xs,
                          ),
                          decoration: BoxDecoration(
                            color: category.color,
                            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                          ),
                          child: Text(
                            '${category.projectCount}',
                            style: AppTypography.small(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  subtitle: category.description != null
                      ? Text(
                          category.description!,
                          style: AppTypography.caption(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        )
                      : null,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit button
                      IconButton(
                        onPressed: onCategoryEdit,
                        icon: const Icon(Icons.edit_rounded),
                        iconSize: 16.w,
                        tooltip: 'Kategorie bearbeiten',
                      ),
                      // Delete button
                      IconButton(
                        onPressed: onCategoryDelete,
                        icon: const Icon(Icons.delete_rounded),
                        iconSize: 16.w,
                        tooltip: 'Kategorie löschen',
                      ),
                      // Expand/Collapse button
                      IconButton(
                        onPressed: onToggleExpanded,
                        icon: AnimatedRotation(
                          turns: category.isExpanded ? 0.5 : 0,
                          duration: AppConstants.shortAnimation,
                          child: const Icon(Icons.keyboard_arrow_down_rounded),
                        ),
                        tooltip: category.isExpanded ? 'Einklappen' : 'Ausklappen',
                      ),
                    ],
                  ),
                  onTap: onCategoryTap,
                ),
              );
            },
          ),

          // Projects List (when expanded)
          if (category.isExpanded)
            AnimatedContainer(
              duration: AppConstants.mediumAnimation,
              child: category.projects.isEmpty
                  ? _buildEmptyState(context)
                  : _buildProjectsList(context),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withAlpha(30),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppConstants.cardRadius.r),
        ),
        border: Border.all(
          color: colorScheme.outline.withAlpha(50),
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_open_rounded,
            size: 32.w,
            color: colorScheme.onSurfaceVariant.withAlpha(150),
          ),
          SizedBox(height: AppConstants.smallPadding.h),
          Text(
            'Keine Projekte',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            'Projekte hier hineinziehen',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant.withAlpha(150),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppConstants.cardRadius.r),
        ),
      ),
      child: ReorderableListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: category.projects.length,
        onReorder: onProjectReorder,
        itemBuilder: (context, index) {
          final project = category.projects[index];
          return ProjectItemTile(
            key: ValueKey(project.id),
            project: project,
            isLast: index == category.projects.length - 1,
          );
        },
      ),
    );
  }
}