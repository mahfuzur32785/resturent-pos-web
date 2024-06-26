import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web/utils/constant.dart';
import 'package:web/utils/custom_image.dart';
import 'package:web/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactUsContentTablet extends StatefulWidget {
  const ContactUsContentTablet({super.key});

  @override
  State<ContactUsContentTablet> createState() => _ContactUsContentTabletState();
}

class _ContactUsContentTabletState extends State<ContactUsContentTablet> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final msgCtrl = TextEditingController();

  final contactFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        if (screenWidth > 600 && screenWidth < 800){
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
              child: Row(
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
                          const Text(
                            "Contact Us",
                            style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
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
                                            style: TextStyle(fontWeight: FontWeight.bold),
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
                                            style: TextStyle(fontWeight: FontWeight.bold),
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
                                            style: TextStyle(fontWeight: FontWeight.bold),
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
                                              backgroundColor: const Color(0xFF077bd7),
                                              foregroundColor: Colors.black),
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
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "test@gmail.com",
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Text(
                                      "Address",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "Dhaka, \nBasundhara",
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
                                              height: 25),
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
                                              height: 25),
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
                                              height: 25),
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
            ),
          );
        }
        else{
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
              child: Form(
                key: contactFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CustomImage(
                        path: "assets/images/contact_us.jpg",
                        fit: BoxFit.fitHeight,
                        height: 200,
                      ),
                    ),


                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Center(
                        child: Text(
                          "Contact Us",
                          style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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
                                      style: TextStyle(fontWeight: FontWeight.bold),
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
                                      style: TextStyle(fontWeight: FontWeight.bold),
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
                                      style: TextStyle(fontWeight: FontWeight.bold),
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
                                        backgroundColor: const Color(0xFF077bd7),
                                        foregroundColor: Colors.black),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "test@gmail.com",
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                "Address",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Dhaka, \nBasundhara",
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
                                        height: 25),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launch('https://www.instagram.com/', isNewTab: true);
                                    },
                                    mouseCursor: MaterialStateMouseCursor.clickable,
                                    child: const CustomImage(
                                        path: "assets/images/instagram.png",
                                        height: 25),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launch('https://twitter.com/', isNewTab: true);
                                    },
                                    mouseCursor: MaterialStateMouseCursor.clickable,
                                    child: const CustomImage(
                                        path: "assets/images/twitter.png",
                                        height: 25),
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
          );
        }
      }
    );
  }

  Future<void> launch(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }

}
