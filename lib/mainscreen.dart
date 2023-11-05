import 'dart:math';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State <MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>{
  final TextEditingController _loanEditingControler = TextEditingController();
  final TextEditingController _yearsEditingControler = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  double P = 0.0, r = 0.0, n = 0.0, result = 0.0;
  late double screenHeight, screenwidth;

  @override
  Widget build (BuildContext context){
    screenHeight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Loan Calculator'),
        backgroundColor: Colors.brown,
        actions: [
          IconButton(onPressed: (){}
          , icon: const Icon(Icons.refresh))
        ]
        ),
        backgroundColor: Colors.grey,
        body: 
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight *0.30,
                width: screenwidth,
                child: Image.asset("assets/money.jpg", fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 8,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(children: [

                      TextFormField(
                        controller: _loanEditingControler,
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: const InputDecoration(
                          hintText: 'Please Enter Your Loan Amount in RM',
                          labelText: 'Loan amount',
                          labelStyle: TextStyle(),
                          icon: Icon(Icons.account_balance),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0)
                          )
                        ),
                      ),
                      TextField(
                        controller: _interestController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: const InputDecoration(
                          hintText: 'Please enter interest in percent',
                          labelText: 'Interest',
                          labelStyle: TextStyle(),
                          icon: Icon(Icons.percent),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0)
                          )
                        ),
                      ),
                      TextField(
                        controller: _yearsEditingControler,
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: const InputDecoration(
                          hintText: 'Please enter how many years',
                          labelText: 'Years',
                          labelStyle: TextStyle(),
                          icon: Icon(Icons.calendar_month),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          )
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: calculate,
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                ),
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 15),
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 8,
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      child:  Column(
                        children: [
                          Text(
                            'You need To Pay RM ${result.toStringAsFixed(2)} per month, your total loan is RM ${(result*n).toStringAsFixed(2)} and total interest is RM ${(result*n-P).toStringAsFixed(2)}'
                          )
                        ],
                      ),
                    ),
                  ),
                )
              
            ],
          ),
        ),
      ),
    );
  }

  void calculate() {
    P = double.parse(_loanEditingControler.text);
    r = double.parse(_interestController.text) /100 / 12;
    n = double.parse(_yearsEditingControler.text) *12;

    result = P * (r * pow(1 + r, n)) / (pow(1 + r, n) - 1);
    setState(() {});

    
  }
}