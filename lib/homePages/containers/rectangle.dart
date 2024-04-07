// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Rectangle extends StatelessWidget {
  const Rectangle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        runSpacing: 15,
        children: List.generate(
          homeStatatisticsList.length,
          (index) => StatisticsCard(
            onTap: () {
              // print(homeStatatisticsList[index]['title']);
            },
            title: homeStatatisticsList[index]['title'],
            subTitle: homeStatatisticsList[index]['subtitle'],
            image: homeStatatisticsList[index]['image'],
          ),
        ));
  }
}

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    super.key,
    this.title,
    this.subTitle,
    this.image,
    this.onTap,
  });
  final String? title;
  final String? subTitle;
  final String? image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 170,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(2, 2),
                  blurRadius: 6,
                  spreadRadius: 0.5)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    //height: 10,width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.shade100,
                    ),
                    child: Image.asset(
                      image!,
                      // "images/sales.png",
                      height: 35,
                      width: 35,
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$$title",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(subTitle!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> homeStatatisticsList = [
  {
    "title": "9000",
    "subtitle": "Income",
    "image": "images/sales.png",
  },
  {
    "title": "1500",
    "subtitle": "Bills",
    "image": "images/bill.png",
  },
  {
    "title": "9000",
    "subtitle": "Expenses",
    "image": "images/expense.png",
  },
  {
    "title": "9000",
    "subtitle": "Savings",
    "image": "images/piggy.png",
  },
  {
    "title": "9000",
    "subtitle": "My Family",
    "image": "images/family.png",
  },
  {
    "title": "9000",
    "subtitle": "Points",
    "image": "images/surprise.png",
  }
];
