import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loan_calculator/mainscreen.dart';

class Splashscreen extends StatefulWidget{
  const Splashscreen({super.key});

  @override
  State <Splashscreen> createState() => SplashscreenState();

}

class SplashscreenState extends State<Splashscreen>{
  
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/loan.png'),
                  fit: BoxFit.cover
                  ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("LOAN CALCULATOR",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                ),
                CircularProgressIndicator(),
                Text(
                  "Version 1.0",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
 @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const MainScreen()
      )
    )
  );
    
  }
}