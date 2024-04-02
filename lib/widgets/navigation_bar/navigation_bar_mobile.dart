import 'package:flutter/material.dart';
import 'package:web/utils/custom_image.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          }
        ),
        const CustomImage(
          path: 'assets/images/logo.png',
          height: 80,
          width: 150,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
