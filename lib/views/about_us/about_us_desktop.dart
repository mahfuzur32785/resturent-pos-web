// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class AboutUsDesktop extends StatefulWidget {
//   const AboutUsDesktop({super.key});
//
//   @override
//   State<AboutUsDesktop> createState() => _HomeContentDesktopState();
// }
//
// class _HomeContentDesktopState extends State<AboutUsDesktop> {
//
//   Completer<GoogleMapController> mapControllerCompleter = Completer();
//
//   double targetLatitude = 23.8127951;
//   double targetLongitude = 90.4288529;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         margin: const EdgeInsets.only(top: 30, bottom: 16, left: 16, right: 16),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//                 child: SizedBox(
//                   height: 300,
//                   child: GoogleMap(
//                     onMapCreated: (GoogleMapController controller) {
//                       mapControllerCompleter.complete(controller);
//                     },
//                     initialCameraPosition: CameraPosition(
//                       target: LatLng(
//                         targetLatitude,
//                         targetLongitude,
//                       ),
//                       zoom: 14.0,
//                     ),
//                     markers:  {
//                       Marker(
//                         markerId: MarkerId("MyLocation"),
//                         position: LatLng(
//                           targetLatitude,
//                           targetLongitude,
//                         ),
//                         infoWindow: InfoWindow(title: "My Location"),
//                       ),
//                     },
//                   ),
//                 ),
//             ),
//             const SizedBox(width: 20),
//             Expanded(
//                 child: Column(
//                   children: [
//                     const Text(
//                       "About Us",
//                       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                     ),
//                     const Text(
//                       "Welcome to \"Delicious Delights\" – a culinary haven nestled in the heart of the city, "
//                           "where gastronomic wonders await you at every turn. With a passion for crafting exquisite dishes "
//                           "and providing unparalleled dining experiences, we invite you to embark on a culinary journey like no other Our restaurant "
//                           "prides itself on using only the freshest, locally-sourced ingredients to create dishes that tantalize the taste buds and leave a"
//                           " lasting impression. Whether you're craving straditional comfort foods or innovative, modern creations, our diverse menu offers something to satisfy every palate.",
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
