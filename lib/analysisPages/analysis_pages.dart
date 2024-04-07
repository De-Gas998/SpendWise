import 'package:financial_management_app/analysisPages/expense.dart';
//import 'package:financial_management_app/analysisPages/helper_function.dart';
import 'package:financial_management_app/database/expense_database.dart';
import 'package:flutter/material.dart';
//import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  //text controllers
  
  @override
  void initState() {
    Provider.of<ExpenseDatabase>(context, listen: false).readExpenses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseDatabase>(builder: 
    (context, value, child) => Scaffold(
      backgroundColor: Colors.grey.shade200,
      
        body: ListView.builder(
          itemCount: value.allExpense.length,
          itemBuilder: (context, index){
           
            //get individual expense
            Expense individualExpense = value.allExpense.reversed.toList()[index];

            //return ListTile
            return ListTile(
              title: Text(individualExpense.name),
              trailing: Text("GH\u20b2 ${individualExpense.account}"),
            );
          }),
    )
    );
  }

  
}





