import 'package:flutter/material.dart';

class MiniContainer extends StatelessWidget {
  final String iconImagePath;
  final String buttonName;

  const MiniContainer({super.key,
  required this.iconImagePath,
  required this.buttonName
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 30,
                color: Colors.grey.shade50,
                spreadRadius: 10,

              )]
          ),
          child: Center(child: Image.asset(iconImagePath)),
        ),

        SizedBox(height: 10,),

        Text(buttonName, 
        style: 
        TextStyle(fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade700),)
      ],
    );
  }
}