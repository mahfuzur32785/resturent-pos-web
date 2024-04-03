import 'package:flutter/material.dart';
import 'package:web/views/online_order/model/product__model.dart';

const Color primaryColor = Color(0xFFFFffff);
const Color blackColor = Color(0xff0B2C3D);
const Color whiteColor = Color(0xFFFFFFFF);
const Color f4f4Color = Color(0xFFF4F4F4);
const Color borderColor = Color(0xFFB0D8FF);
const Color pDetailsColor = Color(0xFFF0F8FF);
const Color greenColor = Color(0xFF20c997);
const Color ashColor = Color(0xFFE7ECEF);
const Color ashTextColor = Color(0xff989eb1);
final Color grayColor = const Color(0xff0B2C3D).withOpacity(.3);
const Color iconThemeColor = Color(0xffffffff);
// const Color redColor = Color(0xffFF5200);
const Color redColor = Color(0xFF077bd7);
// const Color redColor = Color(0xffFFBB38);
const Color iconGreyColor = Color(0xff85959E);
const Color paragraphColor = Color(0xff18587A);
const Color bgGreyColor = Color(0xffE8EEF2);
const greenGradient = [redColor, redColor];

const kPrimaryColor = Color(0xFFFFC200);
const kTextcolor = Color(0xFF241424);
const kDarkButton = Color(0xFF372930);

const kDuration = Duration(milliseconds: 300);

final borderRadius = BorderRadius.circular(4);

var inputDecorationTheme = InputDecoration(
  isDense: true,
  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  hintStyle: const TextStyle(fontSize: 18, height: 1.667),
  border: OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: const BorderSide(color: ashColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: const BorderSide(color: ashColor),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: const BorderSide(color: ashColor),
  ),
  errorBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: const BorderSide(color: Colors.red)),
  fillColor: primaryColor,
  filled: true,
  focusColor: blackColor,
);

final gradientColors = [
  [redColor, redColor.withOpacity(0.7)],
  [const Color(0xff019BFE), const Color(0xff0077C1)],
  [const Color(0xff161632), const Color(0xff3D364E)],
  [const Color(0xffF6290C), const Color(0xffC70F16)],
  [const Color(0xff019BFE), const Color(0xff0077C1)],
  [const Color(0xff161632), const Color(0xff3D364E)],
  [const Color(0xffFFFFFF), const Color(0xffFFFFFF)],
];

navTextStyle({Color color = Colors.white}) {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: color);
}


/// Project needs ++++++++++++++++++++++++++++++++++++++++++++++++++++++

const guestList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "Custom"];

List imagesList = [
  {"image": "assets/images/image_2.jpg"},
  {"image": "assets/images/image_3.jpg"}
];

List homeImagesList = [
  {"image": "assets/images/pizza1.jpg","title":"Margherita", "desc": "Tomato sauce, Mozzarella cheese, oregano and fresh basil.", "reg_price": "29", "mid_size": "35"},
  {"image": "assets/images/pizza2.jpg", "title": "Classic Burrata", "desc": "Tomato sauce, Burrata, Parmesan & mozzarella cheese, Fresh Arugula. Ricotta cheese and fresh basil pesto.", "reg_price": "29", "mid_size": "35"},
  {"image": "assets/images/pizza2.jpg", "title": "Capricciosa", "desc": "Tomato sauce, Burrata, Parmesan & mozzarella cheese, Fresh Arugula. Ricotta cheese and fresh basil pesto.", "reg_price": "29", "mid_size": "35"},
  {"image": "assets/images/pizza2.jpg", "title": "Siciliana", "desc": "Tomato sauce, Burrata, Parmesan & mozzarella cheese, Fresh Arugula. Ricotta cheese and fresh basil pesto.", "reg_price": "29", "mid_size": "35"},

];

List<ProductModel> productsList = [
  ProductModel(
      id: "1",
      image: "assets/images/1.jpg",
      name: "Chicken",
      price: 100,
      qty: 1,
      totalPrice: 100,
      modifiers: [
        Modifier(
          id: "1",
          image: "assets/images/1.jpg",
          name: "Sas",
          price: 2,
          qty: 1,
          totalPrice: 2,
          isSelect: false,
        ),
        Modifier(
            id: "2",
            image: "assets/images/2.jpg",
            name: "Drink",
            price: 4,
            qty: 1,
            isSelect: false,
            totalPrice: 4),
        Modifier(
            id: "3",
            image: "assets/images/3.jpg",
            name: "Water",
            price: 3,
            qty: 1,
            isSelect: false,
            totalPrice: 3),
      ],
  ),
  ProductModel(
      id: "2",
      image: "assets/images/2.jpg",
      name: "Burger",
      price: 70,
      qty: 1,
      totalPrice: 70,
    modifiers: [
      Modifier(
        id: "1",
        image: "assets/images/1.jpg",
        name: "Chicken",
        price: 100,
        isSelect: false,
        qty: 1,
        totalPrice: 100,
      ),
      Modifier(
          id: "2",
          image: "assets/images/2.jpg",
          name: "Burger",
          price: 70,
          isSelect: false,
          qty: 1,
          totalPrice: 70),
      Modifier(
          id: "3",
          image: "assets/images/3.jpg",
          name: "Noddles",
          price: 120,
          isSelect: false,
          qty: 1,
          totalPrice: 120),
    ],
  ),
  ProductModel(
      id: "3",
      image: "assets/images/3.jpg",
      name: "Noddles",
      price: 120,
      qty: 1,
      totalPrice: 120,
    modifiers: [
      Modifier(
        id: "1",
        image: "assets/images/1.jpg",
        name: "Chicken",
        price: 100,
        qty: 1,
        totalPrice: 100,
      ),
      Modifier(
          id: "2",
          image: "assets/images/2.jpg",
          name: "Burger",
          price: 70,
          qty: 1,
          totalPrice: 70),
      Modifier(
          id: "3",
          image: "assets/images/3.jpg",
          name: "Noddles",
          price: 120,
          qty: 1,
          totalPrice: 120),
    ],
  ),
  ProductModel(
      id: "4",
      image: "assets/images/4.jpg",
      name: "Beef",
      price: 250,
      qty: 1,
      totalPrice: 250,
    modifiers: [
      Modifier(
        id: "1",
        image: "assets/images/1.jpg",
        name: "Chicken",
        price: 100,
        qty: 1,
        totalPrice: 100,
      ),
      Modifier(
          id: "2",
          image: "assets/images/2.jpg",
          name: "Burger",
          price: 70,
          qty: 1,
          totalPrice: 70),
      Modifier(
          id: "3",
          image: "assets/images/3.jpg",
          name: "Noddles",
          price: 120,
          qty: 1,
          totalPrice: 120),
    ],
  ),
  ProductModel(
      id: "5",
      image: "assets/images/5.jpg",
      name: "Pasta",
      price: 50,
      qty: 1,
      totalPrice: 50,
    modifiers: [
      Modifier(
        id: "1",
        image: "assets/images/1.jpg",
        name: "Chicken",
        price: 100,
        qty: 1,
        totalPrice: 100,
      ),
      Modifier(
          id: "2",
          image: "assets/images/2.jpg",
          name: "Burger",
          price: 70,
          qty: 1,
          totalPrice: 70),
      Modifier(
          id: "3",
          image: "assets/images/3.jpg",
          name: "Noddles",
          price: 120,
          qty: 1,
          totalPrice: 120),
    ],
  ),
];
