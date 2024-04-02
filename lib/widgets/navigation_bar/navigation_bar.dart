import 'package:flutter/material.dart';
import 'package:web/widgets/navigation_bar/navigation_bar_tablet_desktop.dart';
import 'package:web/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarr extends StatelessWidget {

  const NavigationBarr({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(scaffoldKey: scaffoldKey,),
      tablet: NavigationBarTabletDesktop(),
    );
  }
}
