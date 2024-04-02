import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web/views/reservation/reservation_contant_tablet.dart';
import 'package:web/views/reservation/reservation_content_desktop.dart';
import 'package:web/views/reservation/reservation_content_mobile.dart';

class ReservationView extends StatelessWidget {
  // const ReservationView({Key key}) : super(key: key);
  const ReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const ReservationContentMobile(),
      tablet: const ReservationContentTablet(),
      desktop: const ReservationContentDesktop(),
    );
  }
}
