import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Custom typography scales for better visual hierarchy
class AppTypography {
  AppTypography._();

  /// Display text styles for large headings
  static TextStyle display({Color? color}) => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
    color: color,
  );

  /// Headline styles for section headers
  static TextStyle headline({Color? color}) => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.2,
    color: color,
  );

  /// Title styles for cards and components
  static TextStyle title({Color? color}) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.1,
    color: color,
  );

  /// Body text for general content
  static TextStyle body({Color? color}) => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.2,
    color: color,
  );

  /// Caption text for small details
  static TextStyle caption({Color? color}) => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.3,
    color: color,
  );

  /// Label text for buttons and chips
  static TextStyle label({Color? color, FontWeight? weight}) => TextStyle(
    fontSize: 11.sp,
    fontWeight: weight ?? FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.4,
    color: color,
  );

  /// Small text for badges and minimal info
  static TextStyle small({Color? color}) => TextStyle(
    fontSize: 9.sp,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.3,
    color: color,
  );
}