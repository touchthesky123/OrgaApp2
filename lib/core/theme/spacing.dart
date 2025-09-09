import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Consistent spacing system for the entire app
class AppSpacing {
  AppSpacing._();

  // Base spacing units
  static double get xs => 2.0.w;      // Extra small: 2px
  static double get sm => 4.0.w;      // Small: 4px  
  static double get md => 8.0.w;      // Medium: 8px
  static double get lg => 12.0.w;     // Large: 12px
  static double get xl => 16.0.w;     // Extra large: 16px
  static double get xxl => 20.0.w;    // 2X large: 20px
  static double get xxxl => 24.0.w;   // 3X large: 24px

  // Vertical spacing
  static double get verticalXs => 2.0.h;   
  static double get verticalSm => 4.0.h;   
  static double get verticalMd => 8.0.h;   
  static double get verticalLg => 12.0.h;  
  static double get verticalXl => 16.0.h;  
  static double get verticalXxl => 20.0.h; 
  static double get verticalXxxl => 24.0.h;

  // Component specific spacing
  static double get cardPadding => 12.0.w;
  static double get listItemPadding => 10.0.w;
  static double get buttonPadding => 14.0.w;
  static double get iconSpacing => 8.0.w;
  
  // Border radius
  static double get radiusXs => 2.0.r;
  static double get radiusSm => 4.0.r;
  static double get radiusMd => 8.0.r;
  static double get radiusLg => 12.0.r;
  static double get radiusXl => 16.0.r;
}