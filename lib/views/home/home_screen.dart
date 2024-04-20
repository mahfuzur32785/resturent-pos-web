import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:web/constants/app_colors.dart';
import 'package:web/utils/constant.dart';
import 'package:web/utils/custom_image.dart';
import 'package:web/widgets/footer.dart';

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
          backgroundColor:
              Colors.transparent, // Make the Scaffold background transparent
          body: CustomScrollView(
            slivers: [
              MultiSliver(children: [
                ///Home Top Section
                SliverToBoxAdapter(
                  child: Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                          "assets/images/home_bg1.jpg",
                        ),
                        fit: BoxFit.cover,
                        // opacity: 0.8,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.darken),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 150,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 1,
                                    width: 100,
                                    color: yellowColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text("WELCOME TO",
                                        style: TextStyle(
                                            color: yellowColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24)),
                                  ),
                                  Container(
                                    height: 1,
                                    width: 100,
                                    color: yellowColor,
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 30),
                                child: Text("PATIOTIME \nBISTRO",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 80,
                                        letterSpacing: 10,
                                        height: 1)),
                              ),
                              const Text("Pizza. Burger. Roasted. Coffee. Wine.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                ///Pizza Menu Section
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  sliver: SliverToBoxAdapter(
                  child: Container(
                    // height: size.height,
                    // width: size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: yellowColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text("RISTORANTE",
                                          style: TextStyle(
                                              color: yellowColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24)),
                                    ),
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: yellowColor,
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding:
                                  EdgeInsets.symmetric(vertical: 15),
                                  child: Text("PIZZA MENU",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 60,
                                          letterSpacing: 10,
                                          height: 1)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: yellowColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text("OUR BEST SELECTIONS",
                                          style: TextStyle(
                                              color: yellowColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    ),
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: yellowColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(35),
                            child: Column(
                                children:
                                List.generate(homeImagesList.length, (index) {
                                  if (index % 2 == 0) {
                                    return leftImageAndRightText(index);
                                  } else {
                                    return rightImageAndLeftText(index);
                                  }
                                })),
                          ),
                        ]),
                  ),
                ),
                ),

                ///Pasta Menu Section
                SliverToBoxAdapter(
                  child: Container(
                    // height: size.height,
                    // width: size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: yellowColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text("THE MOST POPULAR",
                                          style: TextStyle(
                                              color: yellowColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24)),
                                    ),
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: yellowColor,
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15),
                                  child: Text("FRESH PASTA",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 60,
                                          letterSpacing: 10,
                                          height: 1)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),

                        ]),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  sliver: SliverGrid(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 300,
                  ),
                  delegate:
                  SliverChildBuilderDelegate(childCount: 6,
                          (BuildContext context, int pIndex) {
                        return Container(
                          decoration: const BoxDecoration(
                            // color: Colors.red
                          ),
                          child: Column(
                            children: [
                              Flexible(
                                child: Image.network(
                                  "https://patiotime.loftocean.com/demo6/wp-content/uploads/sites/4/2022/04/menu-img-5.jpg", // Example image URL
                                  fit: BoxFit.cover, // Adjust the fit as needed
                                  width: double.infinity,
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("SPAGHETTI NAPOLETANA",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text("\$20",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text("Spaghetti with olive oil, touch of garlic, olives, capers, anchovies, "
                                  "Italian Herbs and Napolitanan sauce with fresh basil.",
                                  style: TextStyle(
                                    color: Color(0xff969292),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  )
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                ),

                ///More Menu Section
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      // height: size.height,
                      // width: size.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            const SizedBox(
                              height: 80,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: yellowColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text("THE FULL MENU",
                                          style: TextStyle(
                                              color: yellowColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24)),
                                    ),
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: yellowColor,
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15),
                                  child: Text("À LA CARTE",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 60,
                                          letterSpacing: 10,
                                          height: 1)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            ///Streat and Pizza
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IntrinsicWidth(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "STARTERS",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30,
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2,
                                            color: navbarItemHoverColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    ...List.generate(3, (index){
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 30),
                                        child: Row(
                                          children: [
                                            // Image.network("https://patiotime.loftocean.com/demo6/wp-content/uploads/sites/4/2022/04/menu-img-1.png"),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: const CustomImage(
                                                path: "https://patiotime.loftocean.com/demo6/wp-content/uploads/sites/4/2022/04/menu-img-1.png",
                                                height: 80,
                                                width: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(width: 20,),
                                            const Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("PURPLE CORN TOSTADA ........... \$30",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text("Ricotta, goat cheese, beetroot and datterini",
                                                    style: TextStyle(
                                                      color: Color(0xff969292),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14,
                                                    )
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    })
                                  ],
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IntrinsicWidth(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "PIZZAS",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30,
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2,
                                            color: navbarItemHoverColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    ...List.generate(3, (index){
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 30),
                                        child: Row(
                                          children: [
                                            // Image.network("https://patiotime.loftocean.com/demo6/wp-content/uploads/sites/4/2022/04/menu-img-1.png"),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: const CustomImage(
                                                path: "https://patiotime.loftocean.com/demo6/wp-content/uploads/sites/4/2022/04/menu-img-1.png",
                                                height: 80,
                                                width: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(width: 20,),
                                            const Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("PURPLE CORN TOSTADA ........... \$30",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text("Ricotta, goat cheese, beetroot and datterini",
                                                    style: TextStyle(
                                                      color: Color(0xff969292),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14,
                                                    )
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ],
                            ),
                            ///Two Button Section
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {

                                    },
                                    mouseCursor: MaterialStateMouseCursor.clickable,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                      decoration: BoxDecoration(
                                          color: navbarItemHoverColor,
                                          border: Border.all(color: navbarItemHoverColor,width: 2),
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                      child: const Text("VIEW FULL MENUE", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  InkWell(
                                    onTap: () {

                                    },
                                    mouseCursor: MaterialStateMouseCursor.clickable,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(color: Colors.white,width: 2),
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                      child: const Text("Order Online", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                  )

                                ],
                              ),
                            ),
                            ///GET DIRECTION SECTION
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.1),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Image.asset(
                                      "assets/images/oursalfe.jpg",
                                      height: 450,
                                    ),
                                  ),
                                  // SizedBox(height: 30),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                  Flexible(
                                    child: Image.asset(
                                      "assets/images/oursalfes.jpg",
                                      height: 450,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Text("WHERE TO FIND US",
                                                  style: TextStyle(
                                                      color: yellowColor,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 24)),
                                            ),
                                            Container(
                                              height: 1,
                                              width: 100,
                                              color: yellowColor,
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15),
                                          child: Text("VISIT OUR RESTAURANT",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 50,
                                              ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10,bottom: 20),
                                          child: Text("We see our customers as invited guests to a party, and we are the hosts.",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              )
                                          ),
                                        ),
                                        Text("We see our customers as invited guests to a party, and we are the hosts.",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            )
                                        ),
                                        SizedBox(height: 20,),
                                        InkWell(
                                          onTap: () {

                                          },
                                          mouseCursor: MaterialStateMouseCursor.clickable,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                            decoration: BoxDecoration(
                                                color: navbarItemHoverColor,
                                                border: Border.all(color: navbarItemHoverColor,width: 2),
                                                borderRadius: BorderRadius.circular(3)
                                            ),
                                            child: const Text("GET DIRECTION", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 50),

                          ]),
                    ),
                  ),
                ),

                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  sliver: SliverToBoxAdapter(
                    child: Footer(),
                  ),
                )
              ]),
            ],
          ),
        ),
      ],
    );
  }

  leftImageAndRightText(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CustomImage(path: "${homeImagesList[index]["image"]}",height: MediaQuery.of(context).size.height * 0.8),
        Flexible(
          child: Image.network(
            "${homeImagesList[index]["image"]}", // Example image URL
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        const SizedBox(width: 40),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${homeImagesList[index]["title"]}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      height: 1)),
              const SizedBox(height: 30),
              Text("${homeImagesList[index]["desc"]}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      height: 1,
                      fontStyle: FontStyle.italic)),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                      width: 130,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      alignment: Alignment.center,
                      child: const Text(
                        "REGULAR SIZE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      )),
                  const SizedBox(
                    width: 45,
                  ),
                  Text("\$${homeImagesList[index]["reg_price"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 36,
                          height: 1)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      width: 130,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      alignment: Alignment.center,
                      child: const Text(
                        "MEDIUM SIZE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      )),
                  const SizedBox(
                    width: 45,
                  ),
                  Text("\$${homeImagesList[index]["mid_size"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 36,
                          height: 1)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  rightImageAndLeftText(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${homeImagesList[index]["title"]}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      height: 1)),
              const SizedBox(height: 30),
              Text("${homeImagesList[index]["desc"]}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      height: 1,
                      fontStyle: FontStyle.italic)),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                      width: 130,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      alignment: Alignment.center,
                      child: const Text(
                        "REGULAR SIZE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      )),
                  const SizedBox(
                    width: 45,
                  ),
                  Text("\$${homeImagesList[index]["reg_price"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 36,
                          height: 1)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      width: 130,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      alignment: Alignment.center,
                      child: const Text(
                        "MEDIUM SIZE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      )),
                  const SizedBox(
                    width: 45,
                  ),
                  Text("\$${homeImagesList[index]["mid_size"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 36,
                          height: 1)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),

        Flexible(
          child: Image.network(
            "${homeImagesList[index]["image"]}", // Example image URL
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        // CustomImage(path: "${homeImagesList[index]["image"]}",height: MediaQuery.of(context).size.height * 0.8,)
      ],
    );
  }
}
