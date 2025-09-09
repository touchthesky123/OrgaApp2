import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Theme state notifier for managing app-wide theme mode
class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);

  /// Toggles between light and dark theme
  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  /// Sets theme to light mode
  void setLightTheme() {
    state = ThemeMode.light;
  }

  /// Sets theme to dark mode
  void setDarkTheme() {
    state = ThemeMode.dark;
  }

  /// Sets theme to system default
  void setSystemTheme() {
    state = ThemeMode.system;
  }
}

/// Global theme provider for the entire app
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(),
);