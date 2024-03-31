import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()?onPress;
  const MyButton({super.key,
  required this.text,this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor:Colors.green, ),
        onPressed: onPress, child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(text,style: 
          TextStyle(color: Colors.white,
          fontSize: 18, fontWeight: FontWeight.bold),),
      )),
    );
    // Container(
    //   //color: Colors.green,
    //   height: 70,
    //   decoration: 
    // BoxDecoration(
    //   color: Colors.green,
    // borderRadius: BorderRadius.circular(8)),
    // child: Center(
      // child: Text(text, style: 
      // TextStyle(color: Colors.white,
      // fontSize: 18, fontWeight: FontWeight.bold),),
    // ),);
  }
}