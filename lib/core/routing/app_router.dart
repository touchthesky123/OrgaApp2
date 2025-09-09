import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/overview/pages/overview_page.dart';
import '../../features/projekte/pages/projekte_page.dart';
import '../../features/kalender/pages/kalender_page.dart';
import '../../features/routinen/pages/routinen_page.dart';
import '../../features/notizen/pages/notizen_page.dart';
import '../../features/einstellungen/pages/einstellungen_page.dart';
import '../../shared/widgets/main_navigation_scaffold.dart';
import '../models/navigation_item.dart';

/// Main navigation items for the app
final List<NavigationItem> navigationItems = [
  const NavigationItem(
    path: '/',
    label: 'Übersicht',
    icon: Icons.dashboard_outlined,
    selectedIcon: Icons.dashboard_rounded,
  ),
  const NavigationItem(
    path: '/projekte',
    label: 'Projekte',
    icon: Icons.folder_outlined,
    selectedIcon: Icons.folder_rounded,
    badge: '5',
  ),
  const NavigationItem(
    path: '/kalender',
    label: 'Kalender',
    icon: Icons.calendar_month_outlined,
    selectedIcon: Icons.calendar_month_rounded,
    badge: '3',
  ),
  const NavigationItem(
    path: '/routinen',
    label: 'Routinen',
    icon: Icons.repeat_outlined,
    selectedIcon: Icons.repeat_rounded,
  ),
  const NavigationItem(
    path: '/notizen',
    label: 'Notizen',
    icon: Icons.note_outlined,
    selectedIcon: Icons.note_rounded,
    badge: '12',
  ),
  const NavigationItem(
    path: '/einstellungen',
    label: 'Einstellungen',
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings_rounded,
  ),
];

/// Router configuration for the app
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainNavigationScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'overview',
          builder: (context, state) => const OverviewPage(),
        ),
        GoRoute(
          path: '/projekte',
          name: 'projekte',
          builder: (context, state) => const ProjektePage(),
        ),
        GoRoute(
          path: '/kalender',
          name: 'kalender',
          builder: (context, state) => const KalenderPage(),
        ),
        GoRoute(
          path: '/routinen',
          name: 'routinen',
          builder: (context, state) => const RoutinenPage(),
        ),
        GoRoute(
          path: '/notizen',
          name: 'notizen',
          builder: (context, state) => const NotizenPage(),
        ),
        GoRoute(
          path: '/einstellungen',
          name: 'einstellungen',
          builder: (context, state) => const EinstellungenPage(),
        ),
      ],
    ),
  ],
);