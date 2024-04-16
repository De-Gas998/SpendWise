// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BigContainer extends StatelessWidget {
  const BigContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5,),
        Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(shape: BoxShape.circle,
                          color: Colors.green.shade200,),
                    child: Icon(
                      Icons.medical_services_outlined,
                      //size: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Medical Centre",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Health",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "-\$7",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Oct 27, 2022",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
        
        Divider(
                                thickness: 1,
                                color: Colors.grey.shade500,
                              ),
                            
                            
      ],
    );
  }
}
