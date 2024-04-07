import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
          children: [SizedBox(height: 200,),
            Container(height: 250, width: 250,
          child: Image.asset("images/money-exchange.png"),),
          SizedBox(height: 35,),
          Text("Track Your Money in Real Time", style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 15,),
          Text("track your daily expenses and remember your bills easily",
          style: TextStyle(color: Colors.grey.shade600,
          fontSize: 16),)],
            ),
        ),
      ),
    );
  }
}