import 'package:flutter/material.dart';

class My_TextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const My_TextField({super.key,
  required this.controller,
  required this.hintText,
  required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade500)
            ),
            fillColor: Colors.grey.shade300,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])
          ),);
  }
}