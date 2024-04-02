import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web/constants/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/home_bg2.jpg', // Replace this with your background image
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent, // Make the Scaffold background transparent
          body: SingleChildScrollView(
            child: Column(
              children: [
                ///Home Top Section
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/home_bg1.jpg",
                      ),
                      fit: BoxFit.cover,
                      // opacity: 0.8,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2),
                          BlendMode.darken
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 150,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(height: 1,width: 100,color: yellowColor,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text("WELCOME TO", style: TextStyle(color: yellowColor,fontWeight: FontWeight.bold,fontSize: 24)),
                                ),
                                Container(height: 1,width: 100,color: yellowColor,),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Text("PATIOTIME \nBISTRO", textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 80,letterSpacing: 10,height: 1)),
                            ),
                            Text("Pizza. Burger. Roasted. Coffee. Wine.", textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24))
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(height: 1,width: 100,color: yellowColor,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text("RISTORANTE", style: TextStyle(color: yellowColor,fontWeight: FontWeight.bold,fontSize: 24)),
                                ),
                                Container(height: 1,width: 100,color: yellowColor,),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text("PIZZA MENU", textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 60,letterSpacing: 10,height: 1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(height: 1,width: 100,color: yellowColor,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text("OUR BEST SELECTIONS", style: TextStyle(color: yellowColor,fontWeight: FontWeight.bold,fontSize: 18)),
                                ),
                                Container(height: 1,width: 100,color: yellowColor,),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
