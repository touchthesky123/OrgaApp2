/// Application constants and configuration values
class AppConstants {
  AppConstants._();

  // App Information
  static const String appName = 'OrgaApp';
  static const String appDescription = 'Modern organization app for productivity';
  static const String appVersion = '1.0.0';

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double cardRadius = 16.0;
  static const double buttonRadius = 12.0;

  // Responsive breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  // Animation durations
  static const Duration shortAnimation = Duration(milliseconds: 150);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Grid configurations
  static const int mobileGridColumns = 2;
  static const int tabletGridColumns = 3;
  static const int desktopGridColumns = 4;
}