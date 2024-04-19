// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:financial_management_app/database/expense_database.dart';
import 'package:financial_management_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Rectangle extends StatefulWidget {
  Rectangle({
    super.key,
  });

  @override
  State<Rectangle> createState() => _RectangleState();
}

class _RectangleState extends State<Rectangle> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> expensesList = sharedPreferences.getStringList("expenses")!;
    return Wrap(
        spacing: 10,
        runSpacing: 15,
        children: List.generate(
          expensesList.length,
          (index) => Consumer<ExpenseDatabase>(builder: (context, expense, c) {
            return StatisticsCard(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (coontext) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    title: Text(
                        "Update ${homeStatatisticsList[index]['subtitle']}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: amountController,
                          decoration: InputDecoration(hintText: "Enter amount"),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel")),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              expensesList[index] =
                                  amountController.text.toString();
                              sharedPreferences.setStringList(
                                  "expenses", expensesList);
                            });
                            expense.getTotalBalane(
                                double.parse(amountController.text),
                                homeStatatisticsList[index]['subtitle']);
                            amountController.clear();
                            Navigator.pop(context);
                          },
                          child: Text("Update")),
                    ],
                  ),
                );
              },
              title: "\u20b2${expensesList[index]}",
              subTitle: homeStatatisticsList[index]['subtitle'],
              image: homeStatatisticsList[index]['image'],
            );
          }),
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
                          "$title",
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
