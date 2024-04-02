import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web/main.dart';
import 'package:web/utils/constant.dart';
import 'package:web/utils/custom_image.dart';
import 'package:web/utils/utils.dart';
import 'package:web/views/online_order/model/product__model.dart';
import 'package:web/widgets/custom_text_field.dart';

class OnlineOrder extends StatefulWidget {
  const OnlineOrder({super.key});

  @override
  State<OnlineOrder> createState() => _OnlineOeedrState();
}

class _OnlineOeedrState extends State<OnlineOrder> {
  final int initialPage = 0;
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  double quantity = 1;
  List<ProductModel> storedList = [];

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final pickupDeliveryAddressCtrl = TextEditingController();
  final timeCtrl = TextEditingController();
  String isPickupOrDelivery = 'pickup';

  @override
  void initState() {
    // TODO: implement initState 
    super.initState();
    getCartList();
  }

  void getCartList(){
    final jsonString = sharedPreferences.getString('cartList');
    if(jsonString!=null){
      storedList = List<dynamic>.from(jsonDecode(jsonString))
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }
  }

  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: mobileView(),
      tablet: tabletView(),
      desktop: desktopView(),
    );
  }

  Widget mobileView(){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 16, bottom: 16,left: 16,right: 16),
          child: Wrap(
            children: [
              // Stack(
              //   children: [
              //     CarouselSlider(
              //       carouselController: carouselController,
              //       options: CarouselOptions(
              //         height: 200,
              //         viewportFraction: 1,
              //         initialPage: initialPage,
              //         enableInfiniteScroll: imagesList.length > 1,
              //         reverse: false,
              //         autoPlay: imagesList.length > 1,
              //         // autoPlay: false,
              //         autoPlayInterval: const Duration(seconds: 5),
              //         autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              //         autoPlayCurve: Curves.fastOutSlowIn,
              //         enlargeCenterPage: true,
              //         onPageChanged: callbackFunction,
              //         scrollDirection: Axis.horizontal,
              //       ),
              //       items: imagesList.map((i) => Container(
              //         width: MediaQuery.of(context).size.width,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(16),
              //         ),
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(16),
              //           child: Image(image: AssetImage(i["image"]),
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       )).toList(),
              //     ),
              //     Positioned(
              //       left: 0,
              //       right: 0,
              //       bottom: 4,
              //       child: LayoutBuilder(
              //           builder: (context,constraints) {
              //             if (imagesList.isEmpty) {
              //               return const SizedBox();
              //             }
              //             return DotsIndicator(
              //               dotsCount: imagesList.length,
              //               key: UniqueKey(),
              //               decorator: DotsDecorator(
              //                 activeColor: redColor,
              //                 color: Colors.white,
              //                 activeSize: const Size(10.0, 10.0),
              //                 size: const Size(10.0, 10.0),
              //                 activeShape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(5.0)),
              //                 shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(5.0)),
              //               ),
              //               position: currentIndex,
              //             );
              //           }
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                // margin: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    /// const Text("Order Here",),
                    RichText(
                      text: const TextSpan(
                        text: "Order",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 25),
                        children: <TextSpan>[
                          TextSpan(text: " "),
                          TextSpan(
                              text:"Here",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF077bd7),
                                  fontSize: 25)),
                        ],
                      ),
                    ),
                    Container(
                      width: 70.0,
                      margin:
                      const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                      child: const Column(
                        children: [
                          Divider(
                            height: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40.0,
                      child: Divider(
                        height: 6,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 50,),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      // color: Colors.red,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Expanded(child: Text("Images",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,)),
                              Expanded(child: Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
                              Expanded(child: Text("Price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
                              Expanded(child: Text("Qty",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
                            ] ,
                          ),
                          const SizedBox(height: 20,),
                          Expanded(child: ListView.builder(
                            itemCount: productsList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Expanded(child: CustomImage(path: productsList[index].image,height: 50,)),
                                    Expanded(child: Text(productsList[index].name??"",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),textAlign: TextAlign.center)),
                                    Expanded(child: Text("\$${productsList[index].price}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),textAlign: TextAlign.center)),
                                    Expanded(child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          // onTap: () async {
                                          //   final cartBox = Hive.box<Product>('product');
                                          //
                                          //   var existingProduct = cartBox.values.firstWhere(
                                          //           (item) => (item).id == productsList[index].id,
                                          //       orElse: () => Product());
                                          //
                                          //   if (existingProduct != null) {
                                          //     (existingProduct as Product).qtn++;
                                          //     (existingProduct as Product).price += product.price;
                                          //     box.put(product.name, existingProduct);
                                          //   } else {
                                          //     box.put(product.name, product);
                                          //   }
                                          //
                                          //     print("cart items: ${cartBox.values.length}");
                                          //   // setState(() {
                                          //   // });
                                          // },
                                          ///
                                          // onTap: () {
                                          //   final productBox = Hive.box<Product>('product');
                                          //
                                          //   if(productBox.isEmpty){
                                          //
                                          //     final products = Product(
                                          //       id: productsList[index].id,
                                          //       name: productsList[index].name,
                                          //       img: productsList[index].image,
                                          //       qtn: quantity,
                                          //       price: productsList[index].price,
                                          //       totalPrice: (productsList[index].price * quantity),
                                          //     );
                                          //     productBox.add(products);
                                          //
                                          //   }else{
                                          //     // var item = productBox.values.toList().singleWhere((element) => element.id == productsList[index].id);
                                          //     var item = productBox.values.toList()[index].id == productsList[index].id;
                                          //     if(item){
                                          //       quantity++;
                                          //       productBox.values.toList()[index].totalPrice = (quantity * productBox.values.toList()[index].price!);
                                          //       productBox.put(index+1, productBox.values.toList()[index]);
                                          //     }
                                          //   }
                                          //   print("akhfdkjashf ${Hive.box<Product>('product').values.length}");
                                          //
                                          //   setState(() {
                                          //
                                          //   });
                                          //
                                          //   // getHiveList();
                                          //   // productBoxList[index].qtn = productBoxList[index].qtn!;
                                          //   // productBoxList[index].totalPrice = productBoxList[index].qtn! * productBoxList[index].price!;
                                          //   // Hive.box<Product>('product').put(index, Product(qtn: productBoxList[index].qtn));
                                          //   // Hive.box<Product>('product').put(index, Product(totalPrice: productBoxList[index].totalPrice));
                                          //   // productBoxList.add(productBox);
                                          //   // print("kjlasdfkjdsfjln ${productBoxList[index].totalPrice}");
                                          //
                                          // },
                                          onTap: () {
                                            addToCart(productsList[index]);
                                          },
                                          child: Container(
                                            height: 25,
                                            width: 25,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: redColor,
                                            ),
                                            child: const Icon(Icons.add,size: 18,color: Colors.white,),
                                          ),
                                        )
                                      ],
                                    )),
                                  ] ,
                                ),
                              );
                            },))
                        ],
                      ),

                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),

      floatingActionButton: InkWell(
        onTap: () {
          Utils.showCustomDialog(context, child: StatefulBuilder(builder: (context, setState) {
            return SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Wrap(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: "My",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                    fontSize: 25),
                                children: <TextSpan>[
                                  TextSpan(text: " "),
                                  TextSpan(
                                      text:"Cart",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF077bd7),
                                          fontSize: 25)),
                                ],
                              ),
                            ),
                            Container(
                              width: 70.0,
                              margin:
                              const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                              child: const Column(
                                children: [
                                  Divider(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 40.0,
                              child: Divider(
                                height: 6,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///Cart Section
                    storedList.isNotEmpty
                        ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Expanded(child: Text("Name",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center,)),
                            Expanded(child: Text("Qty",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center)),
                            Expanded(child: Text("",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center)),
                            Expanded(child: Text("Price",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center)),
                          ] ,
                        ),
                        const Divider(),
                        const SizedBox(height: 20,),
                        Wrap(
                          children: [
                            ...List.generate(storedList.length, (index) {
                              var grandTotal = storedList.fold(0.0, (p, e) => p + e.totalPrice!);
                              var modifiersTotal = storedList.fold(0.0, (p, e) => p + e.modifiers!.where((element) => element.isSelect==true).toList().fold(0, (pv, em) => pv + em.price!));
                              print("Modifier Price: ${modifiersTotal} and ${grandTotal}");

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:[
                                        Expanded(child: Text(storedList[index].name??"",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),textAlign: TextAlign.center)),
                                        Expanded(child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if(storedList[index].qty!>1) {
                                                  var quantity = storedList[index].qty! - 1;
                                                  var price = storedList[index].totalPrice! - storedList[index].price!;
                                                  ProductModel newProduct = ProductModel(id: storedList[index].id, price: storedList[index].price, qty: quantity,totalPrice: price, name: storedList[index].name, image: storedList[index].image, modifiers: storedList[index].modifiers);
                                                  storedList[index] = newProduct;
                                                  sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                  getCartList();
                                                  setState(() {

                                                  });
                                                }
                                                else{
                                                  print("fffffffffffffffffffffffffffffffffff");
                                                  storedList.removeAt(index);
                                                  sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                  getCartList();
                                                  setState(() {

                                                  });
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.grey.shade500,
                                                ),
                                                padding: const EdgeInsets.all(1),
                                                child: const Icon(Icons.remove,color: Colors.white,size: 15,),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              child: Text("${storedList[index].qty}",style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),textAlign: TextAlign.center),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                var quantity = storedList[index].qty! + 1;
                                                var price = storedList[index].totalPrice! + storedList[index].price!;
                                                ProductModel newProduct = ProductModel(id: storedList[index].id, price: storedList[index].price, qty: quantity,totalPrice: price, name: storedList[index].name, image: storedList[index].image,modifiers: storedList[index].modifiers);
                                                storedList[index] = newProduct;
                                                sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                getCartList();
                                                setState(() {

                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.grey.shade500,
                                                ),
                                                padding: const EdgeInsets.all(1),
                                                child: const Icon(Icons.add,color: Colors.white,size: 15,),
                                              ),
                                            ),
                                            // InkWell(
                                            //   onTap: () {
                                            //     if(storedList[index].qty!>1) {
                                            //       var quantity = storedList[index].qty! - 1;
                                            //       var price = storedList[index].totalPrice! - storedList[index].price!;
                                            //       ProductModel newProduct = ProductModel(id: storedList[index].id, price: storedList[index].price, qty: quantity,totalPrice: price, name: storedList[index].name, image: storedList[index].image);
                                            //       storedList[index] = newProduct;
                                            //       sharedPreferences.setString("cartList", jsonEncode(storedList));
                                            //       getCartList();
                                            //       setState(() {
                                            //
                                            //       });
                                            //     }
                                            //     else{
                                            //       print("fffffffffffffffffffffffffffffffffff");
                                            //       storedList.removeAt(index);
                                            //       sharedPreferences.setString("cartList", jsonEncode(storedList));
                                            //       getCartList();
                                            //       setState(() {
                                            //
                                            //       });
                                            //     }
                                            //   },
                                            //   child: Container(
                                            //     decoration: BoxDecoration(
                                            //       shape: BoxShape.circle,
                                            //       color: Colors.grey.shade500,
                                            //     ),
                                            //     padding: const EdgeInsets.all(1),
                                            //     child: const Icon(Icons.remove,color: Colors.white,size: 15,),
                                            //   ),
                                            // ),
                                            // Padding(
                                            //   padding: const EdgeInsets.symmetric(horizontal: 5),
                                            //   child: Text("${storedList[index].qty}",style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),textAlign: TextAlign.center),
                                            // ),
                                            // InkWell(
                                            //   onTap: () {
                                            //     var quantity = storedList[index].qty! + 1;
                                            //     var price = storedList[index].totalPrice! + storedList[index].price!;
                                            //     ProductModel newProduct = ProductModel(id: storedList[index].id, price: storedList[index].price, qty: quantity,totalPrice: price, name: storedList[index].name, image: storedList[index].image);
                                            //     storedList[index] = newProduct;
                                            //     sharedPreferences.setString("cartList", jsonEncode(storedList));
                                            //     getCartList();
                                            //     setState(() {
                                            //
                                            //     });
                                            //   },
                                            //   child: Container(
                                            //     decoration: BoxDecoration(
                                            //       shape: BoxShape.circle,
                                            //       color: Colors.grey.shade500,
                                            //     ),
                                            //     padding: const EdgeInsets.all(1),
                                            //     child: const Icon(Icons.add,color: Colors.white,size: 15,),
                                            //   ),
                                            // ),
                                          ],
                                        )),
                                        // const Expanded(child: Text("Modifiers",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),textAlign: TextAlign.center)),
                                        Expanded(child: InkWell(onTap: () {
                                          Utils.showCustomDialog(context,child: StatefulBuilder(builder: (context, setState) {
                                            return Container(
                                              // height: MediaQuery.of(context).size.height * 0.9,
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                padding: const EdgeInsets.all(16),
                                                child: Wrap(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: 20),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          const Text("Select Modifiers",style: TextStyle(
                                                              fontSize: 16,fontWeight: FontWeight.bold
                                                          ),),
                                                          InkWell(mouseCursor: MaterialStateMouseCursor.clickable,onTap: () {
                                                            Navigator.pop(context);
                                                          },child: Container(
                                                              padding: const EdgeInsets.all(6),
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: Colors.blue.shade800,
                                                              ),
                                                              child: const Icon(Icons.done,color: Colors.white,size: 25,)),

                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: MediaQuery.of(context).size.height * 0.6,
                                                      child: GridView.builder(
                                                        gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2, // Number of columns in the grid
                                                            crossAxisSpacing:10, // Spacing between columns
                                                            mainAxisSpacing: 10,
                                                            mainAxisExtent: 120// Spacing between rows
                                                        ),
                                                        itemBuilder: (context, indexN) {
                                                          // Build the individual grid item
                                                          return GestureDetector(
                                                            onTap: () {
                                                              setState(() {

                                                                storedList[index].modifiers?[indexN].isSelect = !storedList[index].modifiers![indexN].isSelect!;
                                                                // bool? data = storedList[index].modifiers?[indexN].isSelect = true;
                                                                // List<Modifier>? newModifiers = [Modifier(isSelect: data)];
                                                                print("cart items: ${sharedPreferences.getString("cartList")}");

                                                                ProductModel newProduct = ProductModel(
                                                                  id: storedList[index].id,
                                                                  price: storedList[index].price,
                                                                  qty: storedList[index].qty,
                                                                  totalPrice: storedList[index].totalPrice,
                                                                  name: storedList[index].name,
                                                                  image: storedList[index].image,
                                                                  modifiers: storedList[index].modifiers,
                                                                );
                                                                storedList[index] = newProduct;
                                                                sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                                getCartList();

                                                              });
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets.all(10),
                                                              decoration: BoxDecoration(
                                                                color: storedList[index].modifiers?[indexN].isSelect == true
                                                                    ? Colors.green.shade200
                                                                    : Colors.white,
                                                                borderRadius: BorderRadius.circular(5.0),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors.grey.withOpacity(0.5),
                                                                    spreadRadius: 1,
                                                                    blurRadius: 1,
                                                                    offset: const Offset(
                                                                        0, 1), // changes the position of the shadow
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Expanded(
                                                                    flex:5,
                                                                    child: CustomImage(
                                                                      path: storedList[index].modifiers![indexN].image,
                                                                      height: 30,
                                                                      width: double.infinity,
                                                                      // fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(height: 5),
                                                                  Expanded(
                                                                    flex:3,
                                                                    child: Container(
                                                                      child: Center(child: Column(
                                                                        children: [
                                                                          Text('${storedList[index].modifiers?[indexN].name}',overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 12.0),),
                                                                          Text('\$${storedList[index].modifiers?[indexN].price}',style: const TextStyle(fontSize: 12.0),),
                                                                        ],
                                                                      )),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        itemCount: storedList[index].modifiers!.length, // Number of items in the grid
                                                      ),
                                                    ),
                                                    // Padding(
                                                    //   padding: const EdgeInsets.only(bottom: 20),
                                                    //   child: Row(
                                                    //     mainAxisAlignment: MainAxisAlignment.end,
                                                    //     children: [
                                                    //       SizedBox(
                                                    //         height: 40,
                                                    //         child: ElevatedButton(
                                                    //           style: ElevatedButton.styleFrom(
                                                    //               shape: RoundedRectangleBorder(
                                                    //                 borderRadius: BorderRadius.circular(6),
                                                    //               ),
                                                    //               backgroundColor: Colors.red,
                                                    //               foregroundColor: Colors.black),
                                                    //           onPressed: () {
                                                    //             Navigator.pop(context);
                                                    //           },
                                                    //           child: const Text(
                                                    //             "Close",
                                                    //             style: TextStyle(color: Colors.white),
                                                    //           ),
                                                    //         ),
                                                    //       ),
                                                    //       SizedBox(
                                                    //         height: 40,
                                                    //         child: ElevatedButton(
                                                    //           style: ElevatedButton.styleFrom(
                                                    //               shape: RoundedRectangleBorder(
                                                    //                 borderRadius: BorderRadius.circular(6),
                                                    //               ),
                                                    //               backgroundColor: Colors.blueAccent.shade700,
                                                    //               foregroundColor: Colors.white),
                                                    //           onPressed: () {
                                                    //             Navigator.pop(context);
                                                    //           },
                                                    //           child: const Text(
                                                    //             "Submit",
                                                    //             style: TextStyle(color: Colors.white),
                                                    //           ),
                                                    //         ),
                                                    //       ),
                                                    //
                                                    //     ],
                                                    //   ),
                                                    // ),
                                                  ],
                                                ));
                                          },)).then((value){
                                            setState(() {

                                            });
                                          });
                                        },mouseCursor: MaterialStateMouseCursor.clickable,
                                          child: const Text("Modifiers",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                        )),
                                        Expanded(child: Text("\$${storedList[index].totalPrice! + storedList[index].modifiers!.where((element) => element.isSelect==true).toList().fold(0, (p, e) => p + e.price!)}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),textAlign: TextAlign.center)),
                                      ] ,
                                    ),

                                    const SizedBox(height: 10),
                                    Row(
                                      children: List.generate(storedList[index].modifiers?.where((element) => element.isSelect==true).length??[].length, (modifierIndex){
                                        return Stack(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(right: 10),
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              decoration: BoxDecoration(
                                                color: Colors.blue.shade100,
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Text("${storedList[index].modifiers?.where((element) => element.isSelect==true).toList()[modifierIndex].name}"),
                                            ),
                                            // Positioned(
                                            //   right: 0,
                                            //     top: -2,
                                            //     child: InkWell(
                                            //   onTap: () {
                                            //     setState(() {
                                            //
                                            //       storedList[index].modifiers?[modifierIndex].isSelect = false;
                                            //       // bool? data = storedList[index].modifiers?[indexN].isSelect = true;
                                            //       // List<Modifier>? newModifiers = [Modifier(isSelect: data)];
                                            //       print("cart items: ${sharedPreferences.getString("cartList")}");
                                            //
                                            //       ProductModel newProduct = ProductModel(
                                            //         id: storedList[index].id,
                                            //         price: storedList[index].price,
                                            //         qty: storedList[index].qty,
                                            //         totalPrice: storedList[index].totalPrice,
                                            //         name: storedList[index].name,
                                            //         image: storedList[index].image,
                                            //         modifiers: storedList[index].modifiers,
                                            //       );
                                            //       storedList[index] = newProduct;
                                            //       sharedPreferences.setString("cartList", jsonEncode(storedList));
                                            //       getCartList();
                                            //
                                            //     });
                                            //     },
                                            //   mouseCursor: MaterialStateMouseCursor.clickable,
                                            //   child: Icon(Icons.remove_circle,color: Colors.red,size: 15,),
                                            // ))
                                          ],
                                        );
                                      }),
                                    ),
                                    const Divider(),
                                    const SizedBox(height: 10,),
                                    Visibility(visible: index==storedList.length-1,child: Text("Subtotal: \$${grandTotal+modifiersTotal}",style: const TextStyle(fontWeight: FontWeight.bold),))

                                  ],
                                ),
                              );
                            },)
                          ],
                        )
                          ],
                        )
                        :
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Align(alignment: Alignment.topCenter,
                        child: Text("Your cart is empty",
                          style: TextStyle(fontSize: 14,color: Colors.red),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.black),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Close",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  backgroundColor: redColor,
                                  foregroundColor: Colors.black),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },));
        },
        mouseCursor: MaterialStateMouseCursor.clickable,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xFF077bd7),
                borderRadius: BorderRadius.circular(5)
              ),
              child: const Text("My\nCart",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            Positioned(
                top: -8,
                right: -1,
                child: Container(padding: const EdgeInsets.all(5),decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.white),child: Text(storedList.length<=9
                    ?"${storedList.length}"
                    : "9+",
                  style: const TextStyle(fontSize: 12,color: Colors.red,fontWeight: FontWeight.w600),)))
          ],
        ),
      ),
    );
  }

  Widget desktopView(){
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 16,left: 16,right: 16),
        child: Wrap(
          children: [
            // CarouselSlider(
            //   carouselController: carouselController,
            //   options: CarouselOptions(
            //     height: 350,
            //     viewportFraction: 1,
            //     enableInfiniteScroll: imagesList.length > 1,
            //     reverse: false,
            //     autoPlay: imagesList.length > 1,
            //     // autoPlay: false,
            //     autoPlayInterval: const Duration(seconds: 5),
            //     autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     enlargeCenterPage: true,
            //     // onPageChanged: callbackFunction,
            //     scrollDirection: Axis.horizontal,
            //   ),
            //   items: imagesList.map((i) => Container(
            //     width: MediaQuery.of(context).size.width,
            //     // height: 200,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(16),
            //     ),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(16),
            //       child: CustomImage(path: i["image"],
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   )).toList(),
            // ),

            Container(
              // margin: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  /// const Text("Order Here",),
                  RichText(
                    text: const TextSpan(
                      text: "Order",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 25),
                      children: <TextSpan>[
                        TextSpan(text: " "),
                        TextSpan(
                            text:"Here",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF077bd7),
                                fontSize: 25)),
                      ],
                    ),
                  ),
                  Container(
                    width: 70.0,
                    margin:
                    const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: const Column(
                      children: [
                        Divider(
                          height: 1,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40.0,
                    child: Divider(
                      height: 6,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50,),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        ///Product Add Section
                        Expanded(
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Expanded(child: Text("Images",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,)),
                                  Expanded(child: Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
                                  Expanded(child: Text("Price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
                                  Expanded(child: Text("Qty",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
                                ] ,
                              ),
                              const SizedBox(height: 20,),
                              Expanded(child: ListView.builder(
                                itemCount: productsList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:[
                                        Expanded(child: CustomImage(path: productsList[index].image,height: 50,)),
                                        Expanded(child: Text(productsList[index].name??"",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),textAlign: TextAlign.center)),
                                        Expanded(child: Text("\$${productsList[index].price}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),textAlign: TextAlign.center)),
                                        Expanded(child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              // onTap: () async {
                                              //   final cartBox = Hive.box<Product>('product');
                                              //
                                              //   var existingProduct = cartBox.values.firstWhere(
                                              //           (item) => (item).id == productsList[index].id,
                                              //       orElse: () => Product());
                                              //
                                              //   if (existingProduct != null) {
                                              //     (existingProduct as Product).qtn++;
                                              //     (existingProduct as Product).price += product.price;
                                              //     box.put(product.name, existingProduct);
                                              //   } else {
                                              //     box.put(product.name, product);
                                              //   }
                                              //
                                              //     print("cart items: ${cartBox.values.length}");
                                              //   // setState(() {
                                              //   // });
                                              // },
                                              ///
                                              // onTap: () {
                                              //   final productBox = Hive.box<Product>('product');
                                              //
                                              //   if(productBox.isEmpty){
                                              //
                                              //     final products = Product(
                                              //       id: productsList[index].id,
                                              //       name: productsList[index].name,
                                              //       img: productsList[index].image,
                                              //       qtn: quantity,
                                              //       price: productsList[index].price,
                                              //       totalPrice: (productsList[index].price * quantity),
                                              //     );
                                              //     productBox.add(products);
                                              //
                                              //   }else{
                                              //     // var item = productBox.values.toList().singleWhere((element) => element.id == productsList[index].id);
                                              //     var item = productBox.values.toList()[index].id == productsList[index].id;
                                              //     if(item){
                                              //       quantity++;
                                              //       productBox.values.toList()[index].totalPrice = (quantity * productBox.values.toList()[index].price!);
                                              //       productBox.put(index+1, productBox.values.toList()[index]);
                                              //     }
                                              //   }
                                              //   print("akhfdkjashf ${Hive.box<Product>('product').values.length}");
                                              //
                                              //   setState(() {
                                              //
                                              //   });
                                              //
                                              //   // getHiveList();
                                              //   // productBoxList[index].qtn = productBoxList[index].qtn!;
                                              //   // productBoxList[index].totalPrice = productBoxList[index].qtn! * productBoxList[index].price!;
                                              //   // Hive.box<Product>('product').put(index, Product(qtn: productBoxList[index].qtn));
                                              //   // Hive.box<Product>('product').put(index, Product(totalPrice: productBoxList[index].totalPrice));
                                              //   // productBoxList.add(productBox);
                                              //   // print("kjlasdfkjdsfjln ${productBoxList[index].totalPrice}");
                                              //
                                              // },
                                              onTap: () {
                                                addToCart(productsList[index]);
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: redColor,
                                                ),
                                                child: const Icon(Icons.add,size: 18,color: Colors.white,),
                                              ),
                                            )
                                          ],
                                        )),
                                      ] ,
                                    ),
                                  );
                                },))
                            ],
                          ),
                        ),

                        ///Cart Section
                        Expanded(
                          child: storedList.isNotEmpty
                              ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Expanded(child: Text("Name",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center,)),
                                  Expanded(child: Text("Qty",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center)),
                                  Expanded(child: Text("",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center)),
                                  Expanded(child: Text("Price",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center)),
                                ] ,
                              ),
                              const Divider(),
                              const SizedBox(height: 20,),
                              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                                var grandTotal = storedList.fold(0.0, (p, e) => p + e.totalPrice!);
                                var modifiersTotal = storedList.fold(0.0, (p, e) => p + e.modifiers!.where((element) => element.isSelect==true).toList().fold(0, (pv, em) => pv + em.price!));
                                print("Modifier Price: ${modifiersTotal} and ${grandTotal}");

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[
                                          Expanded(child: Text(storedList[index].name??"",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),textAlign: TextAlign.center)),
                                          Expanded(child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if(storedList[index].qty!>1) {
                                                    var quantity = storedList[index].qty! - 1;
                                                    var price = storedList[index].totalPrice! - storedList[index].price!;
                                                    ProductModel newProduct = ProductModel(id: storedList[index].id, price: storedList[index].price, qty: quantity,totalPrice: price, name: storedList[index].name, image: storedList[index].image, modifiers: storedList[index].modifiers);
                                                    storedList[index] = newProduct;
                                                    sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                    getCartList();
                                                    setState(() {

                                                    });
                                                  }
                                                  else{
                                                    print("fffffffffffffffffffffffffffffffffff");
                                                    storedList.removeAt(index);
                                                    sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                    getCartList();
                                                    setState(() {

                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.grey.shade500,
                                                  ),
                                                  padding: const EdgeInsets.all(1),
                                                  child: const Icon(Icons.remove,color: Colors.white,size: 15,),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: Text("${storedList[index].qty}",style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),textAlign: TextAlign.center),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  var quantity = storedList[index].qty! + 1;
                                                  var price = storedList[index].totalPrice! + storedList[index].price!;
                                                  ProductModel newProduct = ProductModel(id: storedList[index].id, price: storedList[index].price, qty: quantity,totalPrice: price, name: storedList[index].name, image: storedList[index].image,modifiers: storedList[index].modifiers);
                                                  storedList[index] = newProduct;
                                                  sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                  getCartList();
                                                  setState(() {

                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.grey.shade500,
                                                  ),
                                                  padding: const EdgeInsets.all(1),
                                                  child: const Icon(Icons.add,color: Colors.white,size: 15,),
                                                ),
                                              ),
                                            ],
                                          )),
                                          Expanded(child: InkWell(onTap: () {
                                            Utils.showCustomDialog(context,child: StatefulBuilder(builder: (context, setState) {
                                              return Container(
                                                  // height: MediaQuery.of(context).size.height * 0.9,
                                                  width: MediaQuery.of(context).size.width * 0.5,
                                                  padding: const EdgeInsets.all(16),
                                                  child: Wrap(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 20),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            const Text("Select Modifiers",style: TextStyle(
                                                              fontSize: 16,fontWeight: FontWeight.bold
                                                            ),),
                                                            InkWell(mouseCursor: MaterialStateMouseCursor.clickable,onTap: () {
                                                              Navigator.pop(context);
                                                            },child: Container(
                                                              padding: const EdgeInsets.all(6),
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: Colors.blue.shade800,
                                                              ),
                                                              child: const Icon(Icons.done,color: Colors.white,size: 25,)),

                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.6,
                                                        child: GridView.builder(
                                                          gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 5, // Number of columns in the grid
                                                              crossAxisSpacing:10, // Spacing between columns
                                                              mainAxisSpacing: 10,
                                                              mainAxisExtent: 120// Spacing between rows
                                                          ),
                                                          itemBuilder: (context, indexN) {
                                                            // Build the individual grid item
                                                            return GestureDetector(
                                                              onTap: () {
                                                                setState(() {

                                                                storedList[index].modifiers?[indexN].isSelect = !storedList[index].modifiers![indexN].isSelect!;
                                                                // bool? data = storedList[index].modifiers?[indexN].isSelect = true;
                                                                // List<Modifier>? newModifiers = [Modifier(isSelect: data)];
                                                                print("cart items: ${sharedPreferences.getString("cartList")}");

                                                                ProductModel newProduct = ProductModel(
                                                                    id: storedList[index].id,
                                                                    price: storedList[index].price,
                                                                    qty: storedList[index].qty,
                                                                    totalPrice: storedList[index].totalPrice,
                                                                    name: storedList[index].name,
                                                                    image: storedList[index].image,
                                                                    modifiers: storedList[index].modifiers,
                                                                );
                                                                storedList[index] = newProduct;
                                                                sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                                getCartList();

                                                                });
                                                              },
                                                              child: Container(
                                                                padding: const EdgeInsets.all(10),
                                                                decoration: BoxDecoration(
                                                                  color: storedList[index].modifiers?[indexN].isSelect == true
                                                                      ? Colors.green.shade200
                                                                      : Colors.white,
                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors.grey.withOpacity(0.5),
                                                                      spreadRadius: 1,
                                                                      blurRadius: 1,
                                                                      offset: const Offset(
                                                                          0, 1), // changes the position of the shadow
                                                                    ),
                                                                  ],
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Expanded(
                                                                      flex:5,
                                                                      child: CustomImage(
                                                                        path: storedList[index].modifiers![indexN].image,
                                                                        height: 30,
                                                                        width: double.infinity,
                                                                        // fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(height: 5),
                                                                    Expanded(
                                                                      flex:3,
                                                                      child: Container(
                                                                        child: Center(child: Column(
                                                                          children: [
                                                                            Text('${storedList[index].modifiers?[indexN].name}',overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 12.0),),
                                                                            Text('\$${storedList[index].modifiers?[indexN].price}',style: const TextStyle(fontSize: 12.0),),
                                                                          ],
                                                                        )),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          itemCount: storedList[index].modifiers!.length, // Number of items in the grid
                                                        ),
                                                      ),
                                                      // Padding(
                                                      //   padding: const EdgeInsets.only(bottom: 20),
                                                      //   child: Row(
                                                      //     mainAxisAlignment: MainAxisAlignment.end,
                                                      //     children: [
                                                      //       SizedBox(
                                                      //         height: 40,
                                                      //         child: ElevatedButton(
                                                      //           style: ElevatedButton.styleFrom(
                                                      //               shape: RoundedRectangleBorder(
                                                      //                 borderRadius: BorderRadius.circular(6),
                                                      //               ),
                                                      //               backgroundColor: Colors.red,
                                                      //               foregroundColor: Colors.black),
                                                      //           onPressed: () {
                                                      //             Navigator.pop(context);
                                                      //           },
                                                      //           child: const Text(
                                                      //             "Close",
                                                      //             style: TextStyle(color: Colors.white),
                                                      //           ),
                                                      //         ),
                                                      //       ),
                                                      //       SizedBox(
                                                      //         height: 40,
                                                      //         child: ElevatedButton(
                                                      //           style: ElevatedButton.styleFrom(
                                                      //               shape: RoundedRectangleBorder(
                                                      //                 borderRadius: BorderRadius.circular(6),
                                                      //               ),
                                                      //               backgroundColor: Colors.blueAccent.shade700,
                                                      //               foregroundColor: Colors.white),
                                                      //           onPressed: () {
                                                      //             Navigator.pop(context);
                                                      //           },
                                                      //           child: const Text(
                                                      //             "Submit",
                                                      //             style: TextStyle(color: Colors.white),
                                                      //           ),
                                                      //         ),
                                                      //       ),
                                                      //
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ));
                                            },)).then((value){
                                              setState(() {

                                              });
                                            });
                                          },mouseCursor: MaterialStateMouseCursor.clickable,
                                            child: const Text("Modifiers",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                          )),
                                          Expanded(child: Text("\$${storedList[index].totalPrice! + storedList[index].modifiers!.where((element) => element.isSelect==true).toList().fold(0, (p, e) => p + e.price!)}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),textAlign: TextAlign.center)),
                                        ] ,
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: List.generate(storedList[index].modifiers?.where((element) => element.isSelect==true).length??[].length, (modifierIndex){
                                        return Stack(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(right: 10),
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              decoration: BoxDecoration(
                                                color: Colors.blue.shade100,
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Text("${storedList[index].modifiers?.where((element) => element.isSelect==true).toList()[modifierIndex].name}"),
                                            ),
                                            // Positioned(
                                            //   right: 0,
                                            //     top: -2,
                                            //     child: InkWell(
                                            //   onTap: () {
                                            //     setState(() {
                                            //
                                            //       storedList[index].modifiers?[modifierIndex].isSelect = false;
                                            //       // bool? data = storedList[index].modifiers?[indexN].isSelect = true;
                                            //       // List<Modifier>? newModifiers = [Modifier(isSelect: data)];
                                            //       print("cart items: ${sharedPreferences.getString("cartList")}");
                                            //
                                            //       ProductModel newProduct = ProductModel(
                                            //         id: storedList[index].id,
                                            //         price: storedList[index].price,
                                            //         qty: storedList[index].qty,
                                            //         totalPrice: storedList[index].totalPrice,
                                            //         name: storedList[index].name,
                                            //         image: storedList[index].image,
                                            //         modifiers: storedList[index].modifiers,
                                            //       );
                                            //       storedList[index] = newProduct;
                                            //       sharedPreferences.setString("cartList", jsonEncode(storedList));
                                            //       getCartList();
                                            //
                                            //     });
                                            //     },
                                            //   mouseCursor: MaterialStateMouseCursor.clickable,
                                            //   child: Icon(Icons.remove_circle,color: Colors.red,size: 15,),
                                            // ))
                                          ],
                                        );
                                      }),
                                      ),
                                      const Divider(),
                                      Visibility(visible: index==storedList.length-1,child: Column(
                                        children: [
                                          Text("Subtotal: \$${grandTotal+modifiersTotal}",style: const TextStyle(fontWeight: FontWeight.bold),),
                                          const SizedBox(height: 20,),
                                          SizedBox(
                                            height: 40,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                backgroundColor: redColor,
                                                foregroundColor: Colors.black,
                                              ),
                                              onPressed: () {
                                                Utils.showCustomDialog(context,child: StatefulBuilder(builder: (context, setState) {
                                                  return Container(
                                                    height: MediaQuery.of(context).size.height * 0.9,
                                                      width: MediaQuery.of(context).size.width * 0.5,
                                                      padding: const EdgeInsets.all(16),
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const Padding(
                                                              padding: EdgeInsets.only(bottom: 20),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text("Confirm Order",style: TextStyle(
                                                                      fontSize: 16,fontWeight: FontWeight.bold
                                                                  ),),
                                                                  // InkWell(mouseCursor: MaterialStateMouseCursor.clickable,onTap: () {
                                                                  //   Navigator.pop(context);
                                                                  // }, child: Container(
                                                                  //     padding: const EdgeInsets.all(6),
                                                                  //     decoration: BoxDecoration(
                                                                  //       shape: BoxShape.circle,
                                                                  //       color: Colors.blue.shade800,
                                                                  //     ),
                                                                  //     child: const Icon(Icons.done,color: Colors.white,size: 25,)),
                                                                  //
                                                                  // )
                                                                ],
                                                              ),
                                                            ),
                                                        
                                                        
                                                            ///Name Section++++++++++++++++++++++++++++++++++
                                                            const Row(
                                                              children: [
                                                                Text(
                                                                  "Name",
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
                                                        
                                                            ///Phone Section ++++++++++++++++++++++++++++++++++
                                                            const Row(
                                                              children: [
                                                                Text(
                                                                  "Phone",
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
                                                              text: "Enter your phone",
                                                              textEditingController: phoneCtrl,
                                                              keyboardType: TextInputType.phone,
                                                              textInputAction: TextInputAction.next,
                                                              callback: (p0) {
                                                                return "Please enter phone";
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
                                                            ),
                                                            const SizedBox(
                                                              height: 16,
                                                            ),

                                                            ///Address Section +++++++++++++++++++++++++++++++++++
                                                            const Row(
                                                              children: [
                                                                Text(
                                                                  "Address",
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
                                                              text: "Enter your address",
                                                              textEditingController: addressCtrl,
                                                              keyboardType: TextInputType.streetAddress,
                                                              textInputAction: TextInputAction.next,
                                                              maxLine: 3,
                                                            ),
                                                            const SizedBox(
                                                              height: 16,
                                                            ),

                                                            ///isPickupOrDelivery
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                const Text(
                                                                  "Choose Option",
                                                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                                                ),
                                                                Wrap(
                                                                  alignment: WrapAlignment.start,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        setState(() {
                                                                          isPickupOrDelivery = "pickup";
                                                                        });
                                                                      },
                                                                      child: Row(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        children: [
                                                                          Radio(
                                                                              activeColor: redColor,
                                                                              value: "pickup",
                                                                              groupValue: isPickupOrDelivery,
                                                                              onChanged: (value) {
                                                                                setState(() {
                                                                                  isPickupOrDelivery = value.toString();
                                                                                });
                                                                              }),
                                                                          const Text("Pickup"),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        setState(() {
                                                                          isPickupOrDelivery = "delivery";
                                                                        });
                                                                      },
                                                                      child: Row(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        children: [
                                                                          Radio(
                                                                              activeColor: redColor,
                                                                              value: "delivery",
                                                                              groupValue: isPickupOrDelivery,
                                                                              onChanged: (value) {
                                                                                setState(() {
                                                                                  isPickupOrDelivery = value.toString();
                                                                                });
                                                                              }),
                                                                          const Text("Delivery"),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            if(isPickupOrDelivery=="pickup")
                                                              Column(
                                                              children: [
                                                                const SizedBox(
                                                                  height: 16,
                                                                ),
                                                                const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Pickup Address",
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
                                                                  text: "Enter pickup address",
                                                                  textEditingController: pickupDeliveryAddressCtrl,
                                                                  keyboardType: TextInputType.streetAddress,
                                                                  textInputAction: TextInputAction.next,
                                                                  maxLine: 3,
                                                                ),
                                                                const SizedBox(
                                                                  height: 16,
                                                                ),
                                                                const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Pickup Time",
                                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(color: Colors.red),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(height: 6),
                                                                TextFormField(
                                                                  textAlign: TextAlign.start,
                                                                  controller: timeCtrl,
                                                                  validator: (String? value) {
                                                                    if (value == "") {
                                                                      return 'Please select time';
                                                                    } else {
                                                                      return null;
                                                                    }
                                                                  },
                                                                  textInputAction: TextInputAction.next,
                                                                  keyboardType: TextInputType.text,
                                                                  readOnly: true,
                                                                  maxLines: 1,
                                                                  cursorColor: Colors.black87,
                                                                  onSaved: (String? val) {
                                                                    selectedTime = val;
                                                                  },
                                                                  onTap: () {
                                                                    selectTime(context);
                                                                  },
                                                                  decoration: const InputDecoration(
                                                                    suffix: Icon(
                                                                      Icons.calendar_month,
                                                                      color: Colors.black45,
                                                                      size: 20,
                                                                    ),
                                                                    hintText: 'hh:mm aa',
                                                                    filled: true,
                                                                    fillColor: Colors.white,
                                                                    contentPadding: EdgeInsets.symmetric(
                                                                        horizontal: 10, vertical: 5),
                                                                    border: OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(width: 1, color: Colors.black),
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(width: 1, color: Colors.black),
                                                                    ),
                                                                    enabledBorder: OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(width: 1, color: Colors.black),
                                                                    ),
                                                                    errorBorder: OutlineInputBorder(
                                                                        borderRadius:
                                                                        BorderRadius.all(Radius.circular(4)),
                                                                        borderSide: BorderSide(
                                                                          width: 1,
                                                                          color: Colors.red,
                                                                        )),
                                                                    focusedErrorBorder: UnderlineInputBorder(
                                                                      borderRadius:
                                                                      BorderRadius.all(Radius.circular(4)),
                                                                      borderSide: BorderSide(
                                                                        width: 1,
                                                                        color: Colors.red,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),

                                                            if(isPickupOrDelivery=="delivery")
                                                              Column(
                                                              children: [
                                                                const SizedBox(
                                                                  height: 16,
                                                                ),
                                                                const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Delivery Address",
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
                                                                  text: "Enter delivery address",
                                                                  textEditingController: pickupDeliveryAddressCtrl,
                                                                  keyboardType: TextInputType.streetAddress,
                                                                  textInputAction: TextInputAction.next,
                                                                  maxLine: 3,
                                                                ),
                                                              ],
                                                            ),


                                                            Padding(
                                                              padding: const EdgeInsets.only(bottom: 20,top: 20),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 40,
                                                                    child: ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(6),
                                                                          ),
                                                                          backgroundColor: Colors.red,
                                                                          foregroundColor: Colors.black),
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      child: const Text(
                                                                        "Close",
                                                                        style: TextStyle(color: Colors.white),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 10,),
                                                                  SizedBox(
                                                                    height: 40,
                                                                    child: ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(6),
                                                                          ),
                                                                          backgroundColor: Colors.blueAccent.shade700,
                                                                          foregroundColor: Colors.white),
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      child: const Text(
                                                                        "Submit",
                                                                        style: TextStyle(color: Colors.white),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ));
                                                },)).then((value){
                                                  setState(() {

                                                  });
                                                });
                                              },
                                              child: const Text(
                                                "Next",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ))

                                    ],
                                  ),
                                );
                              },itemCount: storedList.length,))
                            ],
                          )
                              : const Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Align(alignment: Alignment.topCenter,
                                    child: Text("Your cart is empty",
                                      style: TextStyle(fontSize: 14,color: Colors.red),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget tabletView(){
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 16,left: 16,right: 16),
        child: Wrap(
          children: [
            // CarouselSlider(
            //   carouselController: carouselController,
            //   options: CarouselOptions(
            //     height: 350,
            //     viewportFraction: 1,
            //     enableInfiniteScroll: imagesList.length > 1,
            //     reverse: false,
            //     autoPlay: imagesList.length > 1,
            //     // autoPlay: false,
            //     autoPlayInterval: const Duration(seconds: 5),
            //     autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     enlargeCenterPage: true,
            //     // onPageChanged: callbackFunction,
            //     scrollDirection: Axis.horizontal,
            //   ),
            //   items: imagesList.map((i) => Container(
            //     width: MediaQuery.of(context).size.width,
            //     // height: 200,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(16),
            //     ),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(16),
            //       child: CustomImage(path: i["image"],
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   )).toList(),
            // ),

            Container(
              // margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  /// const Text("Order Here",),
                  RichText(
                    text: const TextSpan(
                      text: "Order",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 25),
                      children: <TextSpan>[
                        TextSpan(text: " "),
                        TextSpan(
                            text:"Here",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF077bd7),
                                fontSize: 25)),
                      ],
                    ),
                  ),
                  Container(
                    width: 70.0,
                    margin:
                    const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: const Column(
                      children: [
                        Divider(
                          height: 1,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40.0,
                    child: Divider(
                      height: 6,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50,),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        ///Product Add Section
                        Expanded(
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Expanded(child: Text("Images",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,)),
                                  Expanded(child: Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
                                  Expanded(child: Text("Price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
                                  Expanded(child: Text("Qty",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center)),
                                ] ,
                              ),
                              const SizedBox(height: 20,),
                              Expanded(child: ListView.builder(
                                itemCount: productsList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:[
                                        Expanded(child: CustomImage(path: productsList[index].image,height: 50,)),
                                        Expanded(child: Text(productsList[index].name??"",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),textAlign: TextAlign.center)),
                                        Expanded(child: Text("\$${productsList[index].price}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),textAlign: TextAlign.center)),
                                        Expanded(child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              // onTap: () async {
                                              //   final cartBox = Hive.box<Product>('product');
                                              //
                                              //   var existingProduct = cartBox.values.firstWhere(
                                              //           (item) => (item).id == productsList[index].id,
                                              //       orElse: () => Product());
                                              //
                                              //   if (existingProduct != null) {
                                              //     (existingProduct as Product).qtn++;
                                              //     (existingProduct as Product).price += product.price;
                                              //     box.put(product.name, existingProduct);
                                              //   } else {
                                              //     box.put(product.name, product);
                                              //   }
                                              //
                                              //     print("cart items: ${cartBox.values.length}");
                                              //   // setState(() {
                                              //   // });
                                              // },
                                              ///
                                              // onTap: () {
                                              //   final productBox = Hive.box<Product>('product');
                                              //
                                              //   if(productBox.isEmpty){
                                              //
                                              //     final products = Product(
                                              //       id: productsList[index].id,
                                              //       name: productsList[index].name,
                                              //       img: productsList[index].image,
                                              //       qtn: quantity,
                                              //       price: productsList[index].price,
                                              //       totalPrice: (productsList[index].price * quantity),
                                              //     );
                                              //     productBox.add(products);
                                              //
                                              //   }else{
                                              //     // var item = productBox.values.toList().singleWhere((element) => element.id == productsList[index].id);
                                              //     var item = productBox.values.toList()[index].id == productsList[index].id;
                                              //     if(item){
                                              //       quantity++;
                                              //       productBox.values.toList()[index].totalPrice = (quantity * productBox.values.toList()[index].price!);
                                              //       productBox.put(index+1, productBox.values.toList()[index]);
                                              //     }
                                              //   }
                                              //   print("akhfdkjashf ${Hive.box<Product>('product').values.length}");
                                              //
                                              //   setState(() {
                                              //
                                              //   });
                                              //
                                              //   // getHiveList();
                                              //   // productBoxList[index].qtn = productBoxList[index].qtn!;
                                              //   // productBoxList[index].totalPrice = productBoxList[index].qtn! * productBoxList[index].price!;
                                              //   // Hive.box<Product>('product').put(index, Product(qtn: productBoxList[index].qtn));
                                              //   // Hive.box<Product>('product').put(index, Product(totalPrice: productBoxList[index].totalPrice));
                                              //   // productBoxList.add(productBox);
                                              //   // print("kjlasdfkjdsfjln ${productBoxList[index].totalPrice}");
                                              //
                                              // },
                                              onTap: () {
                                                addToCart(productsList[index]);
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: redColor,
                                                ),
                                                child: const Icon(Icons.add,size: 18,color: Colors.white,),
                                              ),
                                            )
                                          ],
                                        )),
                                      ] ,
                                    ),
                                  );
                                },))
                            ],
                          ),
                        ),

                        ///Cart Section
                        Expanded(
                          child: storedList.isNotEmpty
                              ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Expanded(child: Text("Name",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center,)),
                                  Expanded(child: Text("Qty",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center)),
                                  Expanded(child: Text("",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center)),
                                  Expanded(child: Text("Price",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),textAlign: TextAlign.center)),
                                ] ,
                              ),
                              const Divider(),
                              const SizedBox(height: 20,),
                              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                                var grandTotal = storedList.fold(0.0, (p, e) => p + e.totalPrice!);
                                var modifiersTotal = storedList.fold(0.0, (p, e) => p + e.modifiers!.where((element) => element.isSelect==true).toList().fold(0, (pv, em) => pv + em.price!));
                                print("Modifier Price: ${modifiersTotal} and ${grandTotal}");

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[
                                          Expanded(child: Text(storedList[index].name??"",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),textAlign: TextAlign.center)),
                                          Expanded(child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if(storedList[index].qty!>1) {
                                                    var quantity = storedList[index].qty! - 1;
                                                    var price = storedList[index].totalPrice! - storedList[index].price!;
                                                    ProductModel newProduct = ProductModel(id: storedList[index].id, price: storedList[index].price, qty: quantity,totalPrice: price, name: storedList[index].name, image: storedList[index].image, modifiers: storedList[index].modifiers);
                                                    storedList[index] = newProduct;
                                                    sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                    getCartList();
                                                    setState(() {

                                                    });
                                                  }
                                                  else{
                                                    print("fffffffffffffffffffffffffffffffffff");
                                                    storedList.removeAt(index);
                                                    sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                    getCartList();
                                                    setState(() {

                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.grey.shade500,
                                                  ),
                                                  padding: const EdgeInsets.all(1),
                                                  child: const Icon(Icons.remove,color: Colors.white,size: 15,),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: Text("${storedList[index].qty}",style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),textAlign: TextAlign.center),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  var quantity = storedList[index].qty! + 1;
                                                  var price = storedList[index].totalPrice! + storedList[index].price!;
                                                  ProductModel newProduct = ProductModel(id: storedList[index].id, price: storedList[index].price, qty: quantity,totalPrice: price, name: storedList[index].name, image: storedList[index].image,modifiers: storedList[index].modifiers);
                                                  storedList[index] = newProduct;
                                                  sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                  getCartList();
                                                  setState(() {

                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.grey.shade500,
                                                  ),
                                                  padding: const EdgeInsets.all(1),
                                                  child: const Icon(Icons.add,color: Colors.white,size: 15,),
                                                ),
                                              ),
                                            ],
                                          )),
                                          Expanded(child: InkWell(onTap: () {
                                            Utils.showCustomDialog(context,child: StatefulBuilder(builder: (context, setState) {
                                              return Container(
                                                // height: MediaQuery.of(context).size.height * 0.9,
                                                  width: MediaQuery.of(context).size.width * 0.5,
                                                  padding: const EdgeInsets.all(16),
                                                  child: Wrap(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 20),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            const Text("Select Modifiers",style: TextStyle(
                                                                fontSize: 16,fontWeight: FontWeight.bold
                                                            ),),
                                                            InkWell(mouseCursor: MaterialStateMouseCursor.clickable,onTap: () {
                                                              Navigator.pop(context);
                                                            },child: Container(
                                                                padding: const EdgeInsets.all(6),
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: Colors.blue.shade800,
                                                                ),
                                                                child: const Icon(Icons.done,color: Colors.white,size: 25,)),

                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.6,
                                                        child: GridView.builder(
                                                          gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 3, // Number of columns in the grid
                                                              crossAxisSpacing:10, // Spacing between columns
                                                              mainAxisSpacing: 10,
                                                              mainAxisExtent: 120// Spacing between rows
                                                          ),
                                                          itemBuilder: (context, indexN) {
                                                            // Build the individual grid item
                                                            return GestureDetector(
                                                              onTap: () {
                                                                setState(() {

                                                                  storedList[index].modifiers?[indexN].isSelect = !storedList[index].modifiers![indexN].isSelect!;
                                                                  // bool? data = storedList[index].modifiers?[indexN].isSelect = true;
                                                                  // List<Modifier>? newModifiers = [Modifier(isSelect: data)];
                                                                  print("cart items: ${sharedPreferences.getString("cartList")}");

                                                                  ProductModel newProduct = ProductModel(
                                                                    id: storedList[index].id,
                                                                    price: storedList[index].price,
                                                                    qty: storedList[index].qty,
                                                                    totalPrice: storedList[index].totalPrice,
                                                                    name: storedList[index].name,
                                                                    image: storedList[index].image,
                                                                    modifiers: storedList[index].modifiers,
                                                                  );
                                                                  storedList[index] = newProduct;
                                                                  sharedPreferences.setString("cartList", jsonEncode(storedList));
                                                                  getCartList();

                                                                });
                                                              },
                                                              child: Container(
                                                                padding: const EdgeInsets.all(10),
                                                                decoration: BoxDecoration(
                                                                  color: storedList[index].modifiers?[indexN].isSelect == true
                                                                      ? Colors.green.shade200
                                                                      : Colors.white,
                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors.grey.withOpacity(0.5),
                                                                      spreadRadius: 1,
                                                                      blurRadius: 1,
                                                                      offset: const Offset(
                                                                          0, 1), // changes the position of the shadow
                                                                    ),
                                                                  ],
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Expanded(
                                                                      flex:5,
                                                                      child: CustomImage(
                                                                        path: storedList[index].modifiers![indexN].image,
                                                                        height: 30,
                                                                        width: double.infinity,
                                                                        // fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(height: 5),
                                                                    Expanded(
                                                                      flex:3,
                                                                      child: Container(
                                                                        child: Center(child: Column(
                                                                          children: [
                                                                            Text('${storedList[index].modifiers?[indexN].name}',overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 12.0),),
                                                                            Text('\$${storedList[index].modifiers?[indexN].price}',style: const TextStyle(fontSize: 12.0),),
                                                                          ],
                                                                        )),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          itemCount: storedList[index].modifiers!.length, // Number of items in the grid
                                                        ),
                                                      ),
                                                      // Padding(
                                                      //   padding: const EdgeInsets.only(bottom: 20),
                                                      //   child: Row(
                                                      //     mainAxisAlignment: MainAxisAlignment.end,
                                                      //     children: [
                                                      //       SizedBox(
                                                      //         height: 40,
                                                      //         child: ElevatedButton(
                                                      //           style: ElevatedButton.styleFrom(
                                                      //               shape: RoundedRectangleBorder(
                                                      //                 borderRadius: BorderRadius.circular(6),
                                                      //               ),
                                                      //               backgroundColor: Colors.red,
                                                      //               foregroundColor: Colors.black),
                                                      //           onPressed: () {
                                                      //             Navigator.pop(context);
                                                      //           },
                                                      //           child: const Text(
                                                      //             "Close",
                                                      //             style: TextStyle(color: Colors.white),
                                                      //           ),
                                                      //         ),
                                                      //       ),
                                                      //       SizedBox(
                                                      //         height: 40,
                                                      //         child: ElevatedButton(
                                                      //           style: ElevatedButton.styleFrom(
                                                      //               shape: RoundedRectangleBorder(
                                                      //                 borderRadius: BorderRadius.circular(6),
                                                      //               ),
                                                      //               backgroundColor: Colors.blueAccent.shade700,
                                                      //               foregroundColor: Colors.white),
                                                      //           onPressed: () {
                                                      //             Navigator.pop(context);
                                                      //           },
                                                      //           child: const Text(
                                                      //             "Submit",
                                                      //             style: TextStyle(color: Colors.white),
                                                      //           ),
                                                      //         ),
                                                      //       ),
                                                      //
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ));
                                            },)).then((value){
                                              setState(() {

                                              });
                                            });
                                          },mouseCursor: MaterialStateMouseCursor.clickable,
                                            child: const Text("Modifiers",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                          )),
                                          Expanded(child: Text("\$${storedList[index].totalPrice! + storedList[index].modifiers!.where((element) => element.isSelect==true).toList().fold(0, (p, e) => p + e.price!)}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),textAlign: TextAlign.center)),
                                        ] ,
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: List.generate(storedList[index].modifiers?.where((element) => element.isSelect==true).length??[].length, (modifierIndex){
                                          return Stack(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(right: 10),
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade100,
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Text("${storedList[index].modifiers?.where((element) => element.isSelect==true).toList()[modifierIndex].name}"),
                                              ),
                                              // Positioned(
                                              //   right: 0,
                                              //     top: -2,
                                              //     child: InkWell(
                                              //   onTap: () {
                                              //     setState(() {
                                              //
                                              //       storedList[index].modifiers?[modifierIndex].isSelect = false;
                                              //       // bool? data = storedList[index].modifiers?[indexN].isSelect = true;
                                              //       // List<Modifier>? newModifiers = [Modifier(isSelect: data)];
                                              //       print("cart items: ${sharedPreferences.getString("cartList")}");
                                              //
                                              //       ProductModel newProduct = ProductModel(
                                              //         id: storedList[index].id,
                                              //         price: storedList[index].price,
                                              //         qty: storedList[index].qty,
                                              //         totalPrice: storedList[index].totalPrice,
                                              //         name: storedList[index].name,
                                              //         image: storedList[index].image,
                                              //         modifiers: storedList[index].modifiers,
                                              //       );
                                              //       storedList[index] = newProduct;
                                              //       sharedPreferences.setString("cartList", jsonEncode(storedList));
                                              //       getCartList();
                                              //
                                              //     });
                                              //     },
                                              //   mouseCursor: MaterialStateMouseCursor.clickable,
                                              //   child: Icon(Icons.remove_circle,color: Colors.red,size: 15,),
                                              // ))
                                            ],
                                          );
                                        }),
                                      ),
                                      const Divider(),
                                      Visibility(visible: index==storedList.length-1,child: Column(
                                        children: [
                                          Text("Subtotal: \$${grandTotal+modifiersTotal}",style: const TextStyle(fontWeight: FontWeight.bold),),
                                          const SizedBox(height: 20,),
                                          SizedBox(
                                            height: 40,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                backgroundColor: redColor,
                                                foregroundColor: Colors.black,
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                "Next",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ))

                                    ],
                                  ),
                                );
                              },itemCount: storedList.length,))
                            ],
                          )
                              : const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Align(alignment: Alignment.topCenter,
                              child: Text("Your cart is empty",
                                style: TextStyle(fontSize: 14,color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  addToCart(ProductModel productModel){

    if (storedList.isEmpty) {
      print("1111111111111111111111111");
      storedList.add(productModel);
    } else {
      if (storedList.any((product) => product.id == productModel.id)) {
        print("2222222222222222222222222");
        var existingProductIndex = storedList.indexWhere((product) => product.id == productModel.id);
        var existingProduct = storedList[existingProductIndex];
        var quantity = existingProduct.qty! + 1;
        var totalPrice = productModel.price! * quantity;
        ProductModel newProduct = ProductModel(id: productModel.id, price: productModel.price, totalPrice: totalPrice, qty: quantity, name: productModel.name, image: productModel.image, modifiers: productModel.modifiers);
        storedList[existingProductIndex] = newProduct;
      } else {
        print("3333333333333333333333333");
        storedList.add(productModel);
      }
    }

    sharedPreferences.setString("cartList", jsonEncode(storedList));
    print("cart item: ${sharedPreferences.getString("cartList")}");
    getCartList();

    print("productBoxList item: ${storedList.length}");
    setState(() {

    });
  }

  /// .......... time choose .....................
  var selectedTime;
  TimeOfDay fromSelectedTime = TimeOfDay.now();
  TimeOfDay toSelectedTime = TimeOfDay.now();
  selectTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: toSelectedTime,
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: redColor,
              onPrimary: Color(0xFF31A3DD),
              surface: Colors.white,
              onSurface: Color(0xFF000000),
            ),
            dialogBackgroundColor: Colors.blue[500],
          ),
          child: child!,
        );
      },
    );

    if (newTime != null) {
      fromSelectedTime = newTime;
      timeCtrl
        ..text = newTime.format(context)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: timeCtrl.text.length, affinity: TextAffinity.upstream));
      selectedTime = timeCtrl.text;
      setState(() {});
    }
  }

}
