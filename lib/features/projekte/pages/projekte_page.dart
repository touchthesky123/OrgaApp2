import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_constants.dart';
import '../models/project_category.dart';
import '../services/project_service.dart';
import '../widgets/project_category_folder.dart';

/// Projekte page for managing user projects with categories and drag & drop
class ProjektePage extends StatefulWidget {
  const ProjektePage({super.key});

  @override
  State<ProjektePage> createState() => _ProjektePageState();
}

class _ProjektePageState extends State<ProjektePage> {
  List<ProjectCategory> categories = [];

  @override
  void initState() {
    super.initState();
    categories = ProjectService.getSampleProjectCategories();
  }

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
            onPressed: _showAddCategoryDialog,
            icon: const Icon(Icons.create_new_folder_rounded),
            tooltip: 'Neue Kategorie',
          ),
          IconButton(
            onPressed: _showAddProjectDialog,
            icon: const Icon(Icons.add_rounded),
            tooltip: 'Neues Projekt',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with stats
          Padding(
            padding: EdgeInsets.all(AppConstants.defaultPadding.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Projektmanagement',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: AppConstants.smallPadding.h),
                Row(
                  children: [
                    _buildStatCard(
                      context,
                      'Kategorien',
                      '${categories.length}',
                      Icons.folder_rounded,
                      Colors.blue,
                    ),
                    SizedBox(width: AppConstants.defaultPadding.w),
                    _buildStatCard(
                      context,
                      'Projekte',
                      '${categories.fold<int>(0, (sum, cat) => sum + cat.projectCount)}',
                      Icons.assignment_rounded,
                      Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Categories with projects
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ProjectCategoryFolder(
                  category: category,
                  onToggleExpanded: () => _toggleCategoryExpansion(index),
                  onProjectReorder: (oldIndex, newIndex) => _reorderProjectsInCategory(index, oldIndex, newIndex),
                  onAcceptProject: (project) => _moveProjectToCategory(project, index),
                  onCategoryEdit: () => _editCategory(index),
                  onCategoryDelete: () => _deleteCategory(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(AppConstants.defaultPadding.w),
        decoration: BoxDecoration(
          color: color.withAlpha(30),
          borderRadius: BorderRadius.circular(AppConstants.cardRadius.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24.w),
            SizedBox(width: AppConstants.smallPadding.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  Text(
                    title,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleCategoryExpansion(int categoryIndex) {
    setState(() {
      categories[categoryIndex] = categories[categoryIndex].copyWith(
        isExpanded: !categories[categoryIndex].isExpanded,
      );
    });
  }

  void _reorderProjectsInCategory(int categoryIndex, int oldIndex, int newIndex) {
    setState(() {
      final category = categories[categoryIndex];
      final projects = List<Project>.from(category.projects);
      
      if (newIndex > oldIndex) newIndex--;
      final project = projects.removeAt(oldIndex);
      projects.insert(newIndex, project);
      
      categories[categoryIndex] = category.copyWith(projects: projects);
    });
  }

  void _moveProjectToCategory(Project project, int targetCategoryIndex) {
    setState(() {
      // Find and remove project from current category
      for (int i = 0; i < categories.length; i++) {
        final category = categories[i];
        final projectIndex = category.projects.indexWhere((p) => p.id == project.id);
        
        if (projectIndex != -1) {
          // Remove from current category
          final updatedProjects = List<Project>.from(category.projects);
          updatedProjects.removeAt(projectIndex);
          categories[i] = category.copyWith(projects: updatedProjects);
          break;
        }
      }
      
      // Add to target category
      final targetCategory = categories[targetCategoryIndex];
      final updatedTargetProjects = List<Project>.from(targetCategory.projects);
      updatedTargetProjects.add(project);
      categories[targetCategoryIndex] = targetCategory.copyWith(projects: updatedTargetProjects);
    });
  }

  void _editCategory(int index) {
    // TODO: Implement category editing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kategorie bearbeiten wird bald implementiert')),
    );
  }

  void _deleteCategory(int index) {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kategorie löschen'),
        content: Text('Möchten Sie die Kategorie "${categories[index].name}" wirklich löschen?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Abbrechen'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Löschen'),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true) {
        setState(() {
          categories.removeAt(index);
        });
      }
    });
  }

  void _showAddCategoryDialog() {
    // TODO: Implement add category dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Neue Kategorie hinzufügen wird bald implementiert')),
    );
  }

  void _showAddProjectDialog() {
    // TODO: Implement add project dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Neues Projekt hinzufügen wird bald implementiert')),
    );
  }
}