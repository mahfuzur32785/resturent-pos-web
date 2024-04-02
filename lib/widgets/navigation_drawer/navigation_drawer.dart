import 'package:flutter/material.dart';
import 'package:web/routing/routes_names.dart';
import 'package:web/widgets/navigation_drawer/drawer_item.dart';

class NavigationDrawerr extends StatelessWidget {
  // const NavigationDrawer({Key key}) : super(key: key);
  const NavigationDrawerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            color: Color(0xFF077bd7),
            alignment: Alignment.center,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'SKILL UP NOW',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                Text(
                  'TAP HERE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          DrawerItem('Home', Icons.home, HomeRoute),
          DrawerItem('Reservation', Icons.co_present, ReservationRoute),
          DrawerItem('Contact Us', Icons.contact_mail_sharp, ContactUsRoute),
          DrawerItem('About Us', Icons.help, AboutRoute),
          DrawerItem('Online Order', Icons.restaurant_outlined, OnlineOder),
        ],
      ),
    );
  }
}
