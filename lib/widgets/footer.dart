import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/utils/custom_image.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/footer_bg.jpg"),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.55), BlendMode.darken),
      )),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "OPENING HOURES",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Monday - Friday",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          "09:00 - 22:00",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Saturday",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          "11:00 - 00:00",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sunday",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          "11:00 - 23:00",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "* Happy hour",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          "17:00 - 21:00",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomImage(
                        height: 80, path: "assets/images/bistro_logo.png"),
                    SizedBox(height: 20),
                    Text(
                      "Piazza della Signoria, 1050122 . Firenze . Italy",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    Text(
                      "M: booking@patiotime.com",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    Text(
                      "T: +39 055 1234567",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    SizedBox(height: 20),
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
                              height: 18),
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
                              height: 18),
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
                              height: 18),
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
                            height: 18,
                            color: Colors.white,
                          ),
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
                            path: "assets/images/youtube.png",
                            height: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Divider(color: Colors.grey.shade100, thickness: 0.2),
          Container(
            margin: const EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Restaurant & Cafe WP Theme",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white)),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // launchUrl(Uri.parse('https://www.facebook.com/'));
                      },
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      child: Text(
                        "Home",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // launchUrl(Uri.parse('https://www.instagram.com/'));
                      },
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      child: Text(
                        "Reservation",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // launchUrl(Uri.parse('https://twitter.com/'));
                      },
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // launchUrl(Uri.parse('https://pinterest.com/'));
                      },
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // launchUrl(Uri.parse('https://pinterest.com/'));
                      },
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      child: Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Text("© Copyright PatioTime 2022",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
