import 'dart:async';

import 'package:fitness_app/screen/homeScreen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
 @override
  void initState() {
    Timer(Duration(seconds: 2), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen())) ;});
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBFBFB),
      //#505050
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset("assets/cover.jpg",height:double.infinity,width:double.infinity,fit: BoxFit.cover,),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(bottom: 100),
                  alignment: Alignment.bottomCenter,
                  height: 400,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end:  Alignment.topCenter,

                          colors: [
                            Colors.black,
                            Colors.black,
                            Colors.black54,
                            Colors.black12,
                            Colors.transparent

                          ]
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("Let's Achive Your Desire\nBody Shape",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                      SizedBox(height: 10),
                      CircularProgressIndicator(
                      color: Colors.blueGrey,
                      backgroundColor: Colors.orange,
                    )
                    ],
                  ),
                ))
          ],
        ),

      )
    );
  }
}
