import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
          children: [SizedBox(height: 200,),
            Container(height: 250, width: 250,
          child: Image.asset("images/safe and secure.png"),),
          SizedBox(height: 35,),
          Text("Better Financial Management", style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 15,),
          Text("Manage your monthly financial and make your life better!",
          style: TextStyle(color: Colors.grey.shade600,
          fontSize: 16),)],
            ),
        ),
      ),
    );
  }
}