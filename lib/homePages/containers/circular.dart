import 'package:flutter/material.dart';

class Circles extends StatelessWidget {
  final String text;
  const Circles({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[400],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(text)
        ],
      ),
    );
  }
}
