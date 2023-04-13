// Flutter imports:
import 'package:flutter/material.dart';

///A fully Responsive Widget that we use for rendering Items on the screen
class KnowItResponsive extends StatelessWidget {
  // Mobile
  final Widget? smallMobile;
  final Widget? mediumMobile;
  final Widget mobile;

  // tablet
  final Widget? smallTablet;
  final Widget? mediumTablet;
  final Widget tablet;

  // desktops
  final Widget desktop;

  /// This is for App Wide Responsiveness
  const KnowItResponsive({
    Key? key,
    this.smallMobile,
    this.mediumMobile,
    required this.mobile,
    this.smallTablet,
    this.mediumTablet,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  ///If the `Current Screen Width` is for the `SmallMobile i.e <300`
  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 300;

  ///If the `Current Screen Width` is for a `MediumMobile i.e <400`
  static bool isMediumMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 400;

  ///If the `Current Screen Width` is for a `Mobile i.e >= 400 but < 600`
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= 400 &&
      MediaQuery.of(context).size.width < 600;

  ///If the `Current Screen Width` is for a `isTablet i.e  >= 600 but < 800`
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 800;

  ///If the `Current Screen Width` is for a `isMediumTablet i.e  >= 800 but < 1024`
  static bool isMediumTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1024;

  ///If the `Current Screen Width` is for a `isLargeTablet i.e  >= 600 but < 800`
  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024 &&
      MediaQuery.of(context).size.width < 1200;

  ///If the `Current Screen Width` is for a `isDesktop i.e  > 1200`
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return responsiveWidget(screenWidth: screenWidth);
  }

  /// This returns a widget according to screen size
  Widget responsiveWidget({required double screenWidth}) {
    // desktop
    if (screenWidth >= 1200) {
      return desktop;
    }
    // tablet
    else if (screenWidth >= 1024) {
      return tablet;
    }
    // mediumTablet
    else if (screenWidth >= 800) {
      return mediumTablet ?? tablet;
    }
    // smallTablet
    else if (screenWidth >= 600) {
      return smallTablet ?? tablet;
    }
    // mobile
    else if (screenWidth >= 400) {
      return mobile;
    }
    // mediumMobile
    else if (screenWidth > 300) {
      return mediumMobile ?? mobile;
    }
    // smallMobile
    else {
      return smallMobile ?? mobile;
    }
  }
}
