import 'package:flutter/material.dart';

/// Model representing an overview item in the main interface
class OverviewItem {
  const OverviewItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.badge,
    this.onTap,
  });

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String? badge;
  final VoidCallback? onTap;

  OverviewItem copyWith({
    String? id,
    String? title,
    String? subtitle,
    IconData? icon,
    Color? color,
    String? badge,
    VoidCallback? onTap,
  }) {
    return OverviewItem(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      badge: badge ?? this.badge,
      onTap: onTap ?? this.onTap,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OverviewItem &&
        other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.icon == icon &&
        other.color == color &&
        other.badge == badge;
  }

  @override
  int get hashCode {
    return Object.hash(id, title, subtitle, icon, color, badge);
  }
}