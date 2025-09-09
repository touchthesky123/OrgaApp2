import 'package:flutter/material.dart';

/// Model representing a project category (folder-like structure)
class ProjectCategory {
  const ProjectCategory({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
    this.description,
    this.projects = const [],
    this.isExpanded = true,
  });

  final String id;
  final String name;
  final String? description;
  final Color color;
  final IconData icon;
  final List<Project> projects;
  final bool isExpanded;

  int get projectCount => projects.length;

  ProjectCategory copyWith({
    String? id,
    String? name,
    String? description,
    Color? color,
    IconData? icon,
    List<Project>? projects,
    bool? isExpanded,
  }) {
    return ProjectCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      projects: projects ?? this.projects,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectCategory && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Model representing a project within a category
class Project {
  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    this.progress = 0.0,
    this.dueDate,
    this.tags = const [],
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final String description;
  final ProjectPriority priority;
  final double progress; // 0.0 to 1.0
  final DateTime? dueDate;
  final List<String> tags;
  final bool isCompleted;

  Color get priorityColor {
    switch (priority) {
      case ProjectPriority.high:
        return Colors.red;
      case ProjectPriority.medium:
        return Colors.orange;
      case ProjectPriority.low:
        return Colors.green;
    }
  }

  Project copyWith({
    String? id,
    String? title,
    String? description,
    ProjectPriority? priority,
    double? progress,
    DateTime? dueDate,
    List<String>? tags,
    bool? isCompleted,
  }) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      progress: progress ?? this.progress,
      dueDate: dueDate ?? this.dueDate,
      tags: tags ?? this.tags,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Project && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

enum ProjectPriority { high, medium, low }