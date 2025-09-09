import 'package:flutter/material.dart';
import '../models/project_category.dart';

/// Service providing sample project data and management functionality
class ProjectService {
  ProjectService._();

  /// Gets sample project categories with projects
  static List<ProjectCategory> getSampleProjectCategories() {
    return [
      ProjectCategory(
        id: 'work',
        name: 'Arbeit',
        description: 'Berufliche Projekte und Aufgaben',
        color: Colors.blue,
        icon: Icons.work_rounded,
        projects: [
          Project(
            id: 'work_1',
            title: 'Website Redesign',
            description: 'Komplette Überarbeitung der Firmen-Website',
            priority: ProjectPriority.high,
            progress: 0.7,
            dueDate: DateTime.now().add(const Duration(days: 14)),
            tags: ['Web', 'Design', 'Frontend'],
          ),
          Project(
            id: 'work_2',
            title: 'API Integration',
            description: 'Integration der neuen Payment-API',
            priority: ProjectPriority.medium,
            progress: 0.3,
            dueDate: DateTime.now().add(const Duration(days: 21)),
            tags: ['Backend', 'API'],
          ),
        ],
      ),
      ProjectCategory(
        id: 'personal',
        name: 'Persönlich',
        description: 'Private Projekte und Hobbys',
        color: Colors.green,
        icon: Icons.person_rounded,
        projects: [
          Project(
            id: 'personal_1',
            title: 'Flutter App',
            description: 'Entwicklung einer persönlichen Produktivitäts-App',
            priority: ProjectPriority.medium,
            progress: 0.5,
            tags: ['Flutter', 'Mobile'],
          ),
          Project(
            id: 'personal_2',
            title: 'Garten renovieren',
            description: 'Neugestaltung des Hintergartens',
            priority: ProjectPriority.low,
            progress: 0.1,
            dueDate: DateTime.now().add(const Duration(days: 60)),
            tags: ['Garten', 'Renovierung'],
          ),
        ],
      ),
      ProjectCategory(
        id: 'learning',
        name: 'Lernen',
        description: 'Weiterbildung und neue Fähigkeiten',
        color: Colors.orange,
        icon: Icons.school_rounded,
        projects: [
          Project(
            id: 'learning_1',
            title: 'React lernen',
            description: 'Grundlagen und fortgeschrittene Konzepte',
            priority: ProjectPriority.medium,
            progress: 0.4,
            tags: ['JavaScript', 'React', 'Web'],
          ),
        ],
      ),
      ProjectCategory(
        id: 'health',
        name: 'Gesundheit',
        description: 'Fitness und Wohlbefinden',
        color: Colors.red,
        icon: Icons.favorite_rounded,
        projects: [
          Project(
            id: 'health_1',
            title: '10k Lauf Training',
            description: 'Vorbereitung auf den 10km Lauf im Herbst',
            priority: ProjectPriority.high,
            progress: 0.6,
            dueDate: DateTime.now().add(const Duration(days: 45)),
            tags: ['Laufen', 'Fitness'],
          ),
        ],
      ),
      // Leere Kategorie für Drag & Drop Demo
      ProjectCategory(
        id: 'archive',
        name: 'Archiv',
        description: 'Abgeschlossene und archivierte Projekte',
        color: Colors.grey,
        icon: Icons.archive_rounded,
        projects: [],
      ),
    ];
  }

  /// Creates a new project category
  static ProjectCategory createCategory({
    required String name,
    String? description,
    required Color color,
    required IconData icon,
  }) {
    return ProjectCategory(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      description: description,
      color: color,
      icon: icon,
      projects: [],
    );
  }

  /// Creates a new project
  static Project createProject({
    required String title,
    required String description,
    required ProjectPriority priority,
    DateTime? dueDate,
    List<String> tags = const [],
  }) {
    return Project(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      priority: priority,
      dueDate: dueDate,
      tags: tags,
    );
  }
}