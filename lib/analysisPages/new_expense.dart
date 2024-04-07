import 'package:financial_management_app/analysisPages/expense.dart';
import 'package:financial_management_app/analysisPages/helper_function.dart';
import 'package:financial_management_app/database/expense_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateNewExpense extends StatefulWidget {
  CreateNewExpense({super.key});

  @override
  State<CreateNewExpense> createState() => _CreateNewExpenseState();
}

class _CreateNewExpenseState extends State<CreateNewExpense> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController amountController = TextEditingController();
@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseDatabase>(
      builder: (context,c,child) {
        return AlertDialog(
            title: Text("New expense"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name"
                  ),
                ),

                TextField(
                  controller: amountController,
                  decoration: InputDecoration(
                    hintText: "Amount"
                  ),
                )
              ],
            ),
            actions: [
              //cancel button
              _cancelButton(context),

              //save button
              _createNewExpenseButton(context)
            ],
          );
      }


      
    );
  }

  //CANCEL BUTTON
  Widget _cancelButton (context){
    return MaterialButton(onPressed: (){
      //pop box
      Navigator.pop(context);

      //clear controllers
      nameController.clear();
      amountController.clear();
    },
    child: Text("Cancel"),);
  }

  //SAVE BUTTON
  Widget _createNewExpenseButton (context){
    return MaterialButton(onPressed: () async{
      //only save if there is something in the textfield to save
      if (nameController.text.isNotEmpty &&
      amountController.text.isNotEmpty){
        //pop box
        Navigator.pop(context);

        //create a new expense
        Expense newExpense = Expense(
          name: nameController.text, 
          account: convertStringToDouble(amountController.text), 
          date: DateTime.now());

        //save to do
    await Provider.of<ExpenseDatabase>(context, listen: false).createNewExpense(newExpense);
        
        // await context.read<ExpenseDatabase>().createNewExpense(newExpense);

        //clear controllers
        nameController.clear();
        amountController.clear();
      }
    },
    child: const Text("Save"),
    );
  }
}

