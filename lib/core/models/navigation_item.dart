import 'package:flutter/material.dart';

/// Model representing a navigation item in the app
class NavigationItem {
  const NavigationItem({
    required this.path,
    required this.label,
    required this.icon,
    required this.selectedIcon,
    this.badge,
  });

  final String path;
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String? badge;

  NavigationItem copyWith({
    String? path,
    String? label,
    IconData? icon,
    IconData? selectedIcon,
    String? badge,
  }) {
    return NavigationItem(
      path: path ?? this.path,
      label: label ?? this.label,
      icon: icon ?? this.icon,
      selectedIcon: selectedIcon ?? this.selectedIcon,
      badge: badge ?? this.badge,
    );
  }
}