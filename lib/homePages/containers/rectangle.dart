// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Rectangle extends StatelessWidget {

  const Rectangle({super.key,
  
  });

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [

        //first row
        Row(
          children: [
            Container(height: 60, width: 170,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(2, 2),
                  blurRadius: 6,
                  spreadRadius: 0.5
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(flex: 2,
                      child: Container(
                        //height: 10,width: 10,
                      decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Colors.green.shade100,),
                        child: Image.asset("images/sales.png", 
                        height:50,width:50,),
                      )),
                    Expanded(flex:3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$9000",
                              style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold),),
                              Icon(Icons.arrow_forward_ios_outlined,
                              size: 15,)
                            ],
                          ),
            
                          const SizedBox(height: 5,),
                          Text("Income"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20,),

            //bills
            Container(height: 60, width: 170,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(2, 2),
              blurRadius: 6,
              spreadRadius: 0.5
            )]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(flex: 2,
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Colors.green.shade100,),
                    child: Image.asset("images/bill.png", 
                    height:50,width:50,),
                  )),
                Expanded(flex:3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$1500",
                          style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios_outlined,
                          size: 15,)
                        ],
                      ),
        
                      const SizedBox(height: 5,),
                      Text("Bills"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )],
        ),

        const SizedBox(height: 20,),

        //second row
        Row(
          children: [
            Container(height: 60, width: 170,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(2, 2),
                  blurRadius: 6,
                  spreadRadius: 0.5
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(flex: 2,
                      child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Colors.green.shade100,),
                        child: Image.asset("images/expense.png", 
                        height:50,width:50,),
                      )),
                    Expanded(flex:3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$7000",
                              style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold),),
                              Icon(Icons.arrow_forward_ios_outlined,
                              size: 15,)
                            ],
                          ),
            
                          const SizedBox(height: 5,),
                          Text("Expenses"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20,),

            //savings
            Container(height: 60, width: 170,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(2, 2),
              blurRadius: 6,
              spreadRadius: 0.5
            )]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(flex: 2,
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Colors.green.shade100,),
                    child: Image.asset("images/piggy.png", 
                    height:50,width:50,),
                  )),
                Expanded(flex:3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$3500",
                          style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios_outlined,
                          size: 15,)
                        ],
                      ),
        
                      const SizedBox(height: 5,),
                      Text("Savings"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )],
        ),

        const SizedBox(height: 20,),

        //third row
        Row(
          children: [
            Container(height: 60, width: 170,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(2, 2),
                  blurRadius: 6,
                  spreadRadius: 0.5
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(flex: 2,
                      child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Colors.green.shade100,),
                        child: Image.asset("images/family.png", 
                        height:50,width:50,),
                      )),
                    Expanded(flex:3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("3",
                              style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold),),
                              Icon(Icons.arrow_forward_ios_outlined,
                              size: 15,)
                            ],
                          ),
            
                          const SizedBox(height: 5,),
                          Text("My family"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20,),

            //points
            Container(height: 60, width: 170,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(2, 2),
              blurRadius: 6,
              spreadRadius: 0.5
            )]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(flex: 2,
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Colors.green.shade100,),
                    child: Image.asset("images/surprise.png", 
                    height:50,width:50,),
                  )),
                Expanded(flex:3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$100",
                          style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios_outlined,
                          size: 15,)
                        ],
                      ),
        
                      const SizedBox(height: 5,),
                      Text("Points"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )],
        ),
      ],
    );
  }
}