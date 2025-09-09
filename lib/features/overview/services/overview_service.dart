import 'package:flutter/material.dart';
import '../../../core/models/overview_item.dart';

/// Service providing sample overview data for the main interface
/// In a real app, this would connect to a database or API
class OverviewService {
  OverviewService._();

  /// Gets sample overview items for demonstration
  static List<OverviewItem> getSampleOverviewItems() {
    return [
      OverviewItem(
        id: 'tasks',
        title: 'Aufgaben',
        subtitle: 'Verwalte deine täglichen To-Dos',
        icon: Icons.task_alt_rounded,
        color: Colors.blue,
        badge: '12',
        onTap: () {
          // TODO: Navigate to tasks page
        },
      ),
      OverviewItem(
        id: 'calendar',
        title: 'Kalender',
        subtitle: 'Termine und Events im Überblick',
        icon: Icons.calendar_month_rounded,
        color: Colors.green,
        badge: '3',
        onTap: () {
          // TODO: Navigate to calendar page
        },
      ),
      OverviewItem(
        id: 'notes',
        title: 'Notizen',
        subtitle: 'Wichtige Gedanken festhalten',
        icon: Icons.note_rounded,
        color: Colors.orange,
        onTap: () {
          // TODO: Navigate to notes page
        },
      ),
      OverviewItem(
        id: 'projects',
        title: 'Projekte',
        subtitle: 'Verwalte deine laufenden Projekte',
        icon: Icons.folder_rounded,
        color: Colors.purple,
        badge: '5',
        onTap: () {
          // TODO: Navigate to projects page
        },
      ),
      OverviewItem(
        id: 'routines',
        title: 'Routinen',
        subtitle: 'Tägliche Gewohnheiten verfolgen',
        icon: Icons.repeat_rounded,
        color: Colors.cyan,
        onTap: () {
          // TODO: Navigate to routines page
        },
      ),
      OverviewItem(
        id: 'contacts',
        title: 'Kontakte',
        subtitle: 'Wichtige Personen und Verbindungen',
        icon: Icons.people_rounded,
        color: Colors.teal,
        onTap: () {
          // TODO: Navigate to contacts page
        },
      ),
      OverviewItem(
        id: 'documents',
        title: 'Dokumente',
        subtitle: 'Dateien und Unterlagen verwalten',
        icon: Icons.description_rounded,
        color: Colors.indigo,
        badge: '24',
        onTap: () {
          // TODO: Navigate to documents page
        },
      ),
      OverviewItem(
        id: 'analytics',
        title: 'Statistiken',
        subtitle: 'Produktivität und Fortschritte',
        icon: Icons.analytics_rounded,
        color: Colors.red,
        onTap: () {
          // TODO: Navigate to analytics page
        },
      ),
      OverviewItem(
        id: 'settings',
        title: 'Einstellungen',
        subtitle: 'App-Konfiguration und Präferenzen',
        icon: Icons.settings_rounded,
        color: Colors.grey,
        onTap: () {
          // TODO: Navigate to settings page
        },
      ),
    ];
  }
}