import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:web/constants/app_colors.dart';
import 'package:web/utils/constant.dart';
import 'package:web/utils/custom_image.dart';
import 'package:web/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/widgets/footer.dart';

class ContactUsContentDesktop extends StatefulWidget {
  const ContactUsContentDesktop({super.key});

  @override
  State<ContactUsContentDesktop> createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<ContactUsContentDesktop> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final msgCtrl = TextEditingController();

  final contactFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // margin: const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
            padding: const EdgeInsets.only(top: 50, bottom: 100, left: 16, right: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/home_bg2.jpg', // Replace this with your background image
                    // fit: BoxFit.cover,
                  ),
                  fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 80),
                  child: Text("CONTACT US",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                          letterSpacing: 10,
                          height: 1)),
                ),
                Row(
                  children: [
                    const Expanded(
                        child: CustomImage(
                      path: "assets/images/contact_us.jpg",
                      fit: BoxFit.fitHeight,
                    )),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Form(
                        key: contactFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Text(
                            //   "Contact Us",
                            //   style:
                            //       TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
                            // ),
                            // const SizedBox(
                            //   height: 30,
                            // ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    ///Name Section++++++++++++++++++++++++++++++++++
                                    const Row(
                                      children: [
                                        Text(
                                          "Full Name",
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    CustomTextField(
                                      text: "Enter your name",
                                      textEditingController: nameCtrl,
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      callback: (p0) {
                                        return "Please enter name";
                                      },
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),

                                    ///Email Section +++++++++++++++++++++++++++++++++++
                                    const Row(
                                      children: [
                                        Text(
                                          "Email",
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    CustomTextField(
                                      text: "Enter your email",
                                      textEditingController: emailCtrl,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      callback: (p0) {
                                        return "Please enter email";
                                      },
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),

                                    ///Description Section ++++++++++++++++++++++++++++++
                                    const Row(
                                      children: [
                                        Text(
                                          "Message",
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    CustomTextField(
                                      text: "Enter your message",
                                      textEditingController: msgCtrl,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                      maxLine: 4,
                                      callback: (p0) {
                                        return "Please enter message";
                                      },
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),

                                    SizedBox(
                                      height: 45,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            backgroundColor: navbarItemHoverColor,
                                        ),
                                        onPressed: () {
                                          if (contactFormKey.currentState!.validate()) {
                                            print("Valideddd");
                                          }
                                        },
                                        child: const Text(
                                          "Send Message",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Contact",
                                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                      ),
                                      const Text(
                                        "test@gmail.com",
                                        style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Text(
                                        "Address",
                                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                      ),
                                      const Text(
                                        "Dhaka, \nBasundhara",
                                        style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              launch('https://www.facebook.com/', isNewTab: true);
                                            },
                                            mouseCursor: MaterialStateMouseCursor.clickable,
                                            child: const CustomImage(
                                                path: "assets/images/facebook.png",
                                                height: 25,color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              launch('https://www.instagram.com/', isNewTab: true);
                                            },
                                            mouseCursor: MaterialStateMouseCursor.clickable,
                                            child: const CustomImage(
                                                path: "assets/images/instagram.png",
                                                height: 25,color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              launch('https://twitter.com/', isNewTab: true);
                                            },
                                            mouseCursor: MaterialStateMouseCursor.clickable,
                                            child: const CustomImage(
                                                path: "assets/images/twitter.png",
                                                height: 25,color: Colors.white),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Footer()
        ],
      ),
    );
  }

  Future<void> launch(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }

}
