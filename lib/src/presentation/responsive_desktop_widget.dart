import 'package:flutter/material.dart';

import '../infrastructure/responsive_utils.dart';

/// A widget which differentiates between smaller and larger desktop screens.
class ResponsiveDesktopWidget extends StatelessWidget {
  /// Builds the widget appropriate for displaying on smaller screens (low res desktops or landscape tablets).
  ///
  /// It's called if [ResponsiveUtils.isLaptop] returns `true`.
  final Widget Function(BuildContext context) laptopBuilder;

  /// Builds the widget appropriate for displaying on larger screens.
  ///
  /// It's called if [ResponsiveUtils.isLaptop] returns `false`.
  final Widget Function(BuildContext context) desktopBuilder;

  /// Initialise a new responsive widget.
  const ResponsiveDesktopWidget({
    Key? key,
    required this.laptopBuilder,
    required this.desktopBuilder,
  }) : super(key: key);

  @protected
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, _) =>
            ResponsiveUtils.isLaptop(context) ? laptopBuilder(context) : desktopBuilder(context),
      );
}

class NotDesktopException implements Exception {
  final String message;
  const NotDesktopException()
      : message = "The widget should be used only when building desktop widgets!";
}
