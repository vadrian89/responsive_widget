import 'package:flutter/material.dart';

import '../infrastructure/responsive_utils.dart';

/// A widget which build the appropriate widget based on internal set breakpoints.
class ResponsiveWidget extends StatelessWidget {
  /// Builds the widget appropriate for displaying on phones.
  ///
  /// It's called if [ResponsiveUtils.isPhone] returns `true`.
  final Widget Function(BuildContext context) phoneBuilder;

  /// Builds the widget appropriate for displaying on tablets.
  ///
  /// It's called if [ResponsiveUtils.isTablet] returns `true` and if an implemented is provided.
  /// It fallbacks to [phoneBuilder] if an implementation is not provided.
  final Widget Function(BuildContext context)? tabletBuilder;

  /// Builds the widget appropriate for displaying on desktops.
  ///
  /// It's called if [ResponsiveUtils.isDesktop] returns `true` and if an implemented is provided.
  /// It fallbacks to [tabletBuilder] if an implementation is not provided.
  final Widget Function(BuildContext context)? desktopBuilder;

  /// Initialise a new responsive widget.
  const ResponsiveWidget({
    Key? key,
    required this.phoneBuilder,
    this.tabletBuilder,
    this.desktopBuilder,
  }) : super(key: key);

  @protected
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, _) {
          if (ResponsiveUtils.isPhone(context)) {
            return phoneBuilder(context);
          }
          if (ResponsiveUtils.isTablet(context)) {
            return _tablet(context) ?? phoneBuilder(context);
          }
          return _desktop(context) ?? _tablet(context) ?? phoneBuilder(context);
        },
      );

  Widget? _tablet(BuildContext context) => (tabletBuilder != null) ? tabletBuilder!(context) : null;

  Widget? _desktop(BuildContext context) =>
      (desktopBuilder != null) ? desktopBuilder!(context) : null;
}
