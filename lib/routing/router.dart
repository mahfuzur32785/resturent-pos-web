import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web/routing/routes_names.dart';
import 'package:web/views/about_us/about_view.dart';
import 'package:web/views/contact_us/contact_us_view.dart';
import 'package:web/views/home/home_screen.dart';
import 'package:web/views/online_order/view/online_order.dart';
import 'package:web/views/reservation/reservation_view.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(const HomeView(), settings.name??"");
    case OnlineOder:
      return _getPageRoute(const OnlineOrder(), settings.name??"");
    case ContactUsRoute:
      return _getPageRoute(const ContactUsView(), settings.name??"");
    case AboutRoute:
      return _getPageRoute(const AboutView(), settings.name??"");
    case ReservationRoute:
      return _getPageRoute(const ReservationView(), settings.name??"");
    default:
  }
  return null;
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) =>
      child!,
      settings: RouteSettings(name: routeName),
      // transitionsBuilder: (
      //     BuildContext context,
      //     Animation<double> animation,
      //     Animation<double> secondaryAnimation,
      //     Widget child,
      //     ) =>
      //     FadeTransition(
      //       opacity: animation,
      //       child: child,
      //     ),
  );
}
