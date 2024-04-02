import 'package:flutter/material.dart';
import 'package:web/routing/routes_names.dart';
import 'package:web/utils/custom_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'navbar_item.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  NavigationBarTabletDesktop({super.key});

  final List isHovering = [
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: const EdgeInsets.all(10),
          // width: double.infinity,
          padding: const EdgeInsets.all(20),
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   // borderRadius: BorderRadius.circular(46),
          //   boxShadow: [
          //     BoxShadow(
          //       offset: const Offset(0, -2),
          //       blurRadius: 30,
          //       color: Colors.black.withOpacity(0.16),
          //     ),
          //   ],
          // ),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  NavBarItem('Home', HomeRoute, isHovering[0]),
                  const SizedBox(
                    width: 5,
                  ),
                  NavBarItem('Reservation', ReservationRoute, isHovering[1]),
                  const SizedBox(
                    width: 5,
                  ),
                  NavBarItem('Contact Us', ContactUsRoute, isHovering[2]),
                  const SizedBox(
                    width: 5,
                  ),
                  NavBarItem('About Us', AboutRoute, isHovering[3]),
                  const SizedBox(
                    width: 5,
                  ),
                  NavBarItem('Online Order', OnlineOder, isHovering[1]),
                ],
              ),
              CustomImage(path: "assets/images/p-logo.png",height: 30,),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('https://www.facebook.com/'));
                    },
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    child: const CustomImage(
                        path: "assets/images/facebook.png",
                        color: Colors.white,
                        height: 25),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('https://www.instagram.com/'));
                    },
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    child: const CustomImage(
                        path: "assets/images/instagram.png",
                        color: Colors.white,
                        height: 25),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('https://twitter.com/'));
                    },
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    child: const CustomImage(
                        path: "assets/images/twitter.png",
                        color: Colors.white,
                        height: 25),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('https://pinterest.com/'));
                    },
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    child: const CustomImage(
                        path: "assets/images/pinterest.png",
                        height: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {

                    },
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white,width: 2),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Text("Order Online", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(color: Colors.white, thickness: 0.2,)
      ],
    );
  }
}
