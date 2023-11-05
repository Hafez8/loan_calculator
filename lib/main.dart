import 'package:flutter/material.dart';
import 'package:loan_calculator/splashscreen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super (key: key);

  Widget build (BuildContext context){
    return const MaterialApp(
      home: Splashscreen(),
    );
  }
}