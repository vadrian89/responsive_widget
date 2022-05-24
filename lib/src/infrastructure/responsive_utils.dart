import 'package:flutter/material.dart';

/// Utility class used to provide helper functions to detect and manage different platforms.
///
/// More info on supporting multiple screens can be found at: https://developer.android.com/guide/topics/large-screens/support-different-screen-sizes
class ResponsiveUtils {
  const ResponsiveUtils._();

  /// Checks if the device is a phone based on the device's width.
  ///
  /// Based on the Android developer guide if it has less than 600 dp it means it's a phone (99.96% of phones in portrait).
  static bool isPhone(BuildContext context) => MediaQuery.of(context).size.width < 600;

  /// Checks if the device is a tabled in portrait mode based on the device's width.
  ///
  /// Based on the Android developer guide if it has 840+ dp width is a tablet in landscape.
  /// This means that if it's less then 840 is a tablet in portrait or phone in landscape.
  /// Both cases will be treated the same way.
  static bool isTablet(BuildContext context) =>
      !isPhone(context) && MediaQuery.of(context).size.width < 840;

  /// Checks if the device is a landscape tablet or small screen desktop.
  ///
  /// Sometimes we need to differentiate if the screen is smaller or larger.
  /// Such a case is to show a [NavigationRail] on smaller screens while preferring a full [Drawer] on larger screens.
  /// We will treat larger screens as those which have screens of 1280+ dp.
  static bool isLandscapeTablet(BuildContext context) => MediaQuery.of(context).size.width < 1280;

  /// Checks if the device is a desktop based on the device's width.
  ///
  /// Based on the Android developer guide if it has 840+ dp width is a tablet in landscape.
  /// For convenience we will treat tablets in landscape and desktop the same way.
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 840;
}
