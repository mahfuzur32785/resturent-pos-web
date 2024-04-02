import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web/views/contact_us/contactus_contant_tablet.dart';
import 'package:web/views/contact_us/contactus_content_desktop.dart';
import 'package:web/views/contact_us/contactus_content_mobile.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const ContactUsContentMobile(),
      tablet: const ContactUsContentTablet(),
      desktop: const ContactUsContentDesktop(),
    );
  }
}
