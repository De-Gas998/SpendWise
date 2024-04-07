import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String iconImagePath;
  final String tileTile;
  final String tileSubTitle;

  const MyListTile({super.key,
  required this.iconImagePath,
  required this.tileTile,
  required this.tileSubTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(iconImagePath),
                          ),
                        ),

                        SizedBox(width: 20,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tileTile, style: 
                            TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold),),
                            SizedBox(height: 8,),

                            Text(tileSubTitle, style: 
                            TextStyle(fontSize: 16,
                            color: Colors.grey.shade600),)
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios)
                  ],
    );
  }
}