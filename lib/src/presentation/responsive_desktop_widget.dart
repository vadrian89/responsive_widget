import 'package:flutter/material.dart';

import '../infrastructure/responsive_utils.dart';

/// A widget which differentiates between smaller and larger desktop screens.
class ResponsiveDesktopWidget extends StatelessWidget {
  /// Builds the widget appropriate for displaying on smaller screens (low res desktops or landscape tablets).
  ///
  /// It's called if [ResponsiveUtils.isLandscapeTablet] returns `true`.
  final Widget Function(BuildContext context) smallBuilder;

  /// Builds the widget appropriate for displaying on larger screens.
  ///
  /// It's called if [ResponsiveUtils.isLandscapeTablet] returns `false`.
  final Widget Function(BuildContext context) largeBuilder;

  /// Initialise a new responsive widget.
  const ResponsiveDesktopWidget({
    Key? key,
    required this.smallBuilder,
    required this.largeBuilder,
  }) : super(key: key);

  @protected
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, _) {
          if (!ResponsiveUtils.isDesktop(context)) {
            throw const NotDesktopException();
          }
          if (ResponsiveUtils.isLandscapeTablet(context)) {
            return smallBuilder(context);
          }
          return largeBuilder(context);
        },
      );
}

class NotDesktopException implements Exception {
  final String message;
  const NotDesktopException()
      : message = "The widget should be used only when building desktop widgets!";
}
