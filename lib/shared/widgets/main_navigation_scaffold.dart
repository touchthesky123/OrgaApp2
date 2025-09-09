import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';
import '../../core/routing/app_router.dart';

/// Main navigation scaffold that provides adaptive navigation
/// Uses BottomNavigationBar on mobile and NavigationRail on larger screens
class MainNavigationScaffold extends StatelessWidget {
  const MainNavigationScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final useRail = constraints.maxWidth >= AppConstants.tabletBreakpoint;
        final currentPath = GoRouterState.of(context).matchedLocation;
        final currentIndex = _getCurrentIndex(currentPath);

        if (useRail) {
          return _buildNavigationRailLayout(context, currentIndex);
        } else {
          return _buildBottomNavigationLayout(context, currentIndex);
        }
      },
    );
  }

  /// Build layout with NavigationRail for tablets and desktop
  Widget _buildNavigationRailLayout(BuildContext context, int currentIndex) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: _onDestinationSelected,
            labelType: NavigationRailLabelType.selected,
            backgroundColor: colorScheme.surface,
            destinations: navigationItems.map((item) {
              final index = navigationItems.indexOf(item);
              return NavigationRailDestination(
                icon: Badge(
                  label: item.badge != null ? Text(item.badge!) : null,
                  isLabelVisible: item.badge != null,
                  child: Icon(
                    currentIndex == index ? item.selectedIcon : item.icon,
                  ),
                ),
                label: Text(item.label),
              );
            }).toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }

  /// Build layout with BottomNavigationBar for mobile
  Widget _buildBottomNavigationLayout(BuildContext context, int currentIndex) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: navigationItems.map((item) {
          final index = navigationItems.indexOf(item);
          return NavigationDestination(
            icon: Badge(
              label: item.badge != null ? Text(item.badge!) : null,
              isLabelVisible: item.badge != null,
              child: Icon(
                currentIndex == index ? item.selectedIcon : item.icon,
              ),
            ),
            label: item.label,
          );
        }).toList(),
      ),
    );
  }

  /// Handle navigation destination selection
  void _onDestinationSelected(int index) {
    if (index < navigationItems.length) {
      final destination = navigationItems[index];
      final context = navigatorKey.currentContext;
      if (context != null && context.mounted) {
        context.go(destination.path);
      }
    }
  }

  /// Get current navigation index based on route path
  int _getCurrentIndex(String currentPath) {
    for (int i = 0; i < navigationItems.length; i++) {
      if (navigationItems[i].path == currentPath) {
        return i;
      }
    }
    return 0; // Default to overview
  }
}

/// Global navigator key for navigation
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();