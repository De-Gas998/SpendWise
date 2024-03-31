import 'package:flutter/material.dart';

class Circles extends StatelessWidget {
  final String text;
  const Circles({super.key,
  required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(height: 80, width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[400]
          ),),

          const SizedBox(height: 10,),

          Text(text)
        ],
      ),
    );
  }
}