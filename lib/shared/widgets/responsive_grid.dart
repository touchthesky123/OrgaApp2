import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_constants.dart';

/// Responsive grid widget that adapts to different screen sizes
/// Provides optimal layout for mobile, tablet, and desktop
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.padding,
    this.spacing,
  });

  final List<Widget> children;
  final EdgeInsets? padding;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
        final effectiveSpacing = spacing ?? AppConstants.defaultPadding.w;
        final effectivePadding = padding ?? EdgeInsets.all(AppConstants.defaultPadding.w);

        return Padding(
          padding: effectivePadding,
          child: GridView.builder(
            itemCount: children.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: effectiveSpacing,
              mainAxisSpacing: effectiveSpacing,
              childAspectRatio: _getChildAspectRatio(constraints.maxWidth),
            ),
            itemBuilder: (context, index) => children[index],
          ),
        );
      },
    );
  }

  /// Determines the number of columns based on screen width
  int _getCrossAxisCount(double width) {
    if (width >= AppConstants.desktopBreakpoint) {
      return AppConstants.desktopGridColumns;
    } else if (width >= AppConstants.tabletBreakpoint) {
      return AppConstants.tabletGridColumns;
    } else {
      return AppConstants.mobileGridColumns;
    }
  }

  /// Adjusts aspect ratio based on screen size for better visual balance
  double _getChildAspectRatio(double width) {
    if (width >= AppConstants.desktopBreakpoint) {
      return 1.2; // Slightly wider cards on desktop
    } else if (width >= AppConstants.tabletBreakpoint) {
      return 1.1; // Balanced ratio for tablet
    } else {
      return 1.0; // Square-ish cards on mobile
    }
  }
}