import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web/locator.dart';
import 'package:web/routing/router.dart';
import 'package:web/routing/routes_names.dart';
import 'package:web/services/navigation_service.dart';
import 'package:web/widgets/centered_view.dart';
import 'package:web/widgets/navigation_bar/navigation_bar.dart';
import 'package:web/widgets/navigation_drawer/navigation_drawer.dart';

class LayoutTemplate extends StatelessWidget {
  // const LayoutTemplate({Key key}) : super(key: key);
   LayoutTemplate({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          key: scaffoldKey,
          drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? const NavigationDrawerr()
              : null,
          backgroundColor: Colors.white,
          body: CenteredView(
            child: Column(
              // alignment: Alignment.center,
              // clipBehavior: Clip.none,
              children: <Widget>[
                NavigationBarr(scaffoldKey: scaffoldKey),
                Expanded(
                  child: Navigator(
                    key: locator<NavigationService>().navigatorKey,
                    onGenerateRoute: generateRoute,
                    initialRoute: HomeRoute,
                  ),
                ),
                // Positioned(
                //   top: 10,
                //   left: 0,
                //   right: 0,
                //   child: NavigationBarr(scaffoldKey: scaffoldKey),
                // ),

              ],
            ),
          ),
        );
      }
    );
  }
}
