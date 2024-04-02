// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:web/utils/constant.dart';
// class OnlineOrderTablet extends StatefulWidget {
//   const OnlineOrderTablet({super.key});
//
//   @override
//   State<OnlineOrderTablet> createState() => _OnlineOrderTabletState();
// }
//
// class _OnlineOrderTabletState extends State<OnlineOrderTablet> {
//   CarouselController carouselController = CarouselController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         margin: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
//         height: 300,
//         child: Stack(
//           children: [
//             CarouselSlider(
//               carouselController: carouselController,
//               options: CarouselOptions(
//                 height: 300,
//                 viewportFraction: 1,
//                 enableInfiniteScroll: imagesList.length > 1,
//                 reverse: false,
//                 autoPlay: imagesList.length > 1,
//                 // autoPlay: false,
//                 autoPlayInterval: const Duration(seconds: 5),
//                 autoPlayAnimationDuration: const Duration(milliseconds: 1000),
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enlargeCenterPage: true,
//                 // onPageChanged: callbackFunction,
//                 scrollDirection: Axis.horizontal,
//               ),
//               items: imagesList
//                   .map((i) => Container(
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(16),
//                           child: Image(
//                             image: AssetImage(i["image"]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ))
//                   .toList(),
//             ),
//             // Positioned(
//             //   left: 0,
//             //   right: 0,
//             //   bottom: 4,
//             //   child: LayoutBuilder(builder: (context, constraints) {
//             //     if (imagesList.isEmpty) {
//             //       return const SizedBox();
//             //     }
//             //     return DotsIndicator(
//             //       dotsCount: imagesList.length,
//             //       key: UniqueKey(),
//             //       decorator: DotsDecorator(
//             //         activeColor: redColor,
//             //         color: Colors.white,
//             //         activeSize: const Size(10.0, 10.0),
//             //         size: const Size(10.0, 10.0),
//             //         activeShape: RoundedRectangleBorder(
//             //             borderRadius: BorderRadius.circular(5.0)),
//             //         shape: RoundedRectangleBorder(
//             //             borderRadius: BorderRadius.circular(5.0)),
//             //       ),
//             //       position: currentIndex,
//             //     );
//             //   }),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
