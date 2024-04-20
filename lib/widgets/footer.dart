import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
          "assets/images/footer_bg.jpg"
        ),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("OPENING HOURES",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                  SizedBox(height: 20,),
                  Text("Monday - Friday",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),),
                  Text("Saturday",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),),
                  Text("Sunday",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),),
                ],
              ),
              Column(
                children: [
                  Text("OPENING HOURES",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                  SizedBox(height: 20,),
                  Text("Monday - Friday",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),),
                  Text("Saturday",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),),
                  Text("Sunday",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
