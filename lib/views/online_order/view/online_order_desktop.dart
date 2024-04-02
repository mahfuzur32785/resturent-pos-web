// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:web/services/hive_product_adapter.dart';
// import 'package:web/utils/constant.dart';
// import 'package:web/utils/custom_image.dart';
// import 'package:web/utils/utils.dart';
//
// class OnlineOrderDesktop extends StatefulWidget {
//   const OnlineOrderDesktop({super.key});
//
//   @override
//   State<OnlineOrderDesktop> createState() => _OnlineOrderDesktopState();
// }
//
// class _OnlineOrderDesktopState extends State<OnlineOrderDesktop> {
//
//   CarouselController carouselController = CarouselController();
//
//   double quantity = 1;
//   bool isAlreadyAdded = false;
//
//   List<Product> productBoxList = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getHiveList();
//   }
//
//   getHiveList(){
//     productBoxList = Hive.box<Product>('product').values.toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         margin: const EdgeInsets.only(top: 16, bottom: 16,left: 16,right: 16),
//         child: Wrap(
//           children: [
//             CarouselSlider(
//               carouselController: carouselController,
//               options: CarouselOptions(
//                 height: 350,
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
//               items: imagesList.map((i) => Container(
//                     width: MediaQuery.of(context).size.width,
//                     // height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(16),
//                       child: CustomImage(path: i["image"],
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   )).toList(),
//             ),
//
//             Container(
//               margin: const EdgeInsets.only(top: 80),
//               child: Column(
//                 children: [
//                   /// const Text("Order Here",),
//                   RichText(
//                     text: const TextSpan(
//                       text: "Order",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w900,
//                           color: Colors.black,
//                           fontSize: 25),
//                       children: <TextSpan>[
//                         TextSpan(text: " "),
//                         TextSpan(
//                             text:"Here",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w900,
//                                 color: Color(0xFF077bd7),
//                                 fontSize: 25)),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 70.0,
//                     margin:
//                     const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
//                     child: const Column(
//                       children: [
//                         Divider(
//                           height: 1,
//                           color: Colors.black,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 40.0,
//                     child: Divider(
//                       height: 6,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 50,),
//
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.8,
//                     // color: Colors.red,
//                     child: Row(
//                       children: [
//                         ///Product Add Section
//                         Expanded(
//                           child: Column(
//                               children: [
//                                 const Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children:[
//                                   Expanded(child: Text("Images",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,)),
//                                   Expanded(child: Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
//                                   Expanded(child: Text("Price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
//                                   Expanded(child: Text("Qty",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
//                                 ] ,
//                                 ),
//                                 const SizedBox(height: 20,),
//                                 Expanded(child: ListView.builder(
//                                   itemCount: productsList.length,
//                                   itemBuilder: (context, index) {
//                                   return Padding(
//                                     padding: const EdgeInsets.only(bottom: 10),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children:[
//                                         Expanded(child: CustomImage(path: productsList[index].image,height: 50,)),
//                                         Expanded(child: Text(productsList[index].name??"",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),textAlign: TextAlign.center)),
//                                         Expanded(child: Text("${productsList[index].price}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),textAlign: TextAlign.center)),
//                                         Expanded(child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             InkWell(
//                                               onTap: () {
//                                                 final productBox = Hive.box<Product>('product');
//
//                                                   setState(() {
//                                                     final products = Product(
//                                                       id: productsList[index].id,
//                                                       name: productsList[index].name,
//                                                       img: productsList[index].image,
//                                                       qtn: quantity,
//                                                       price: productsList[index].price,
//                                                       totalPrice: (productsList[index].price! * quantity),
//                                                     );
//                                                     productBox.add(products);
//                                                     getHiveList();
//                                                     print("akhfdkjashf ${Hive.box<Product>('product').values.length}");
//                                                   });
//
//                                               },
//                                               child: Container(
//                                                 height: 25,
//                                                 width: 25,
//                                                 decoration: const BoxDecoration(
//                                                   shape: BoxShape.circle,
//                                                   color: redColor,
//                                                 ),
//                                                 child: const Icon(Icons.add,size: 18,color: Colors.white,),
//                                               ),
//                                             )
//                                           ],
//                                         )),
//                                       ] ,
//                                     ),
//                                   );
//                                 },))
//                               ],
//                             ),
//                         ),
//                         ///Cart Section
//                         Expanded(
//                           child: productBoxList.isNotEmpty
//                           ? Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children:[
//                                     Expanded(child: Text("Name",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center,)),
//                                     Expanded(child: Text("Qty",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center)),
//                                     Expanded(child: Text("Price",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center)),
//                                   ] ,
//                                   ),
//                                   const Divider(),
//                                   const SizedBox(height: 20,),
//                                   Expanded(child: ListView.builder(itemBuilder: (context, index) {
//                                     var grandTotal = productBoxList.fold(0.0, (p, e) => p + e.totalPrice!);
//                                     return Padding(
//                                       padding: const EdgeInsets.only(bottom: 10),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.end,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children:[
//                                               Expanded(child: Text(productBoxList[index].name??"",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),textAlign: TextAlign.center)),
//                                               Expanded(child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                 children: [
//                                                   InkWell(
//                                                     onTap: () {
//                                                       if(productBoxList[index].qtn!>1) {
//                                                         setState(() {
//                                                           productBoxList[index].qtn = productBoxList[index].qtn! - 1;
//                                                           Hive.box<Product>('product').put(index, Product(qtn: productBoxList[index].qtn));
//                                                           productBoxList[index].totalPrice = productBoxList[index].qtn! * productBoxList[index].price!;
//                                                           Hive.box<Product>('product').put(index, Product(totalPrice: productBoxList[index].totalPrice));
//                                                         });
//                                                       }
//                                                       else{
//                                                         print("fffffffffffffffffffffffffffffffffff");
//                                                         productBoxList.removeAt(index);
//                                                         setState(() {
//
//                                                         });
//                                                       }
//                                                     },
//                                                     child: Container(
//                                                       decoration: BoxDecoration(
//                                                         shape: BoxShape.circle,
//                                                         color: Colors.grey.shade500,
//                                                       ),
//                                                       padding: const EdgeInsets.all(1),
//                                                       child: const Icon(Icons.remove,color: Colors.white,size: 15,),
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                                                     child: Text("${productBoxList[index].qtn}",style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),textAlign: TextAlign.center),
//                                                   ),
//                                                   InkWell(
//                                                     onTap: () {
//                                                       setState(() {
//                                                         productBoxList[index].qtn = productBoxList[index].qtn! +1;
//                                                         Hive.box<Product>('product').put(index, Product(qtn: productBoxList[index].qtn));
//                                                         productBoxList[index].totalPrice = productBoxList[index].qtn! * productBoxList[index].price!;
//                                                         Hive.box<Product>('product').put(index, Product(totalPrice: productBoxList[index].totalPrice));
//                                                       });
//                                                     },
//                                                     child: Container(
//                                                       decoration: BoxDecoration(
//                                                         shape: BoxShape.circle,
//                                                         color: Colors.grey.shade500,
//                                                       ),
//                                                       padding: const EdgeInsets.all(1),
//                                                       child: const Icon(Icons.add,color: Colors.white,size: 15,),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               )),
//                                               Expanded(child: Text("${productBoxList[index].totalPrice}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),textAlign: TextAlign.center)),
//                                             ] ,
//                                           ),
//                                           const Divider(),
//                                           const SizedBox(height: 10,),
//                                           Visibility(visible: index==productBoxList.length-1,child: Text("Subtotal: $grandTotal",style: const TextStyle(fontWeight: FontWeight.bold),))
//
//                                         ],
//                                       ),
//                                     );
//                                   },itemCount: productBoxList.length,))
//                                 ],
//                               )
//                           :
//                           const Padding(
//                             padding: EdgeInsets.only(top: 20),
//                             child: Align(alignment: Alignment.topCenter,
//                                 child: Text("Your cart is empty",
//                                   style: TextStyle(fontSize: 14,color: Colors.red),
//                                 ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }
