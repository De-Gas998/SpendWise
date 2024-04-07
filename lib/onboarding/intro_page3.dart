import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
          children: [SizedBox(height: 200,),
            Container(height: 250, width: 250,
          child: Image.asset("images/safe-box.png"),),
          SizedBox(height: 35,),
          Text("Safe and Secure", style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 15,),
          Text("Your data is highly secured and you have a high privacy.",
          style: TextStyle(color: Colors.grey.shade600,
          fontSize: 16),)],
            ),
        ),
      ),
    );
  }
}