import 'package:financial_management_app/analysisPages/expense.dart';
import 'package:financial_management_app/analysisPages/helper_function.dart';
import 'package:financial_management_app/database/expense_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateNewExpense extends StatefulWidget {

  CreateNewExpense({super.key,
  this.data,
  });

   Map? data;
   

  @override
  State<CreateNewExpense> createState() => _CreateNewExpenseState();
}

class _CreateNewExpenseState extends State<CreateNewExpense> {

  late TextEditingController? nameController;

  late TextEditingController? amountController;
@override
  void initState() {
    super.initState();
    widget.data=widget.data??{"name":"","amount":""};
    nameController=TextEditingController(text: widget.data!['name']);
    amountController=TextEditingController(text: widget.data!['amount'].toString());
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseDatabase>(
      builder: (context,c,child) {
        return AlertDialog(

            title: widget.data!['name'].isNotEmpty?Text("Update expanse"): Text("New expense"),
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
              _createNewExpenseButton(context,widget.data!['name']),

              //delete button
              // _deleteExpenseButton()
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
      nameController!.clear();
      amountController!.clear();
    },
    child: Text("Cancel"),);
  }

  //SAVE BUTTON
  Widget _createNewExpenseButton (context, text){
    return MaterialButton(onPressed: () async{
      //only save if there is something in the textfield to save
      if (nameController!.text.isNotEmpty &&
      amountController!.text.isNotEmpty){
        //pop box
        Navigator.pop(context);

        //create a new expense
        Expense newExpense = Expense(
          name: nameController!.text, 
          account: convertStringToDouble(amountController!.text), 
          date: DateTime.now());

        //save to db
  widget.data!['name'].isEmpty?  await Provider.of<ExpenseDatabase>(context, listen: false).createNewExpense(newExpense):await Provider.of<ExpenseDatabase>(context, listen: false).updateExpense( widget.data!['id'] ,newExpense);

        //refresh page
        //refreshGraphData();
        
        // await context.read<ExpenseDatabase>().createNewExpense(newExpense);

        //clear controllers
        nameController!.clear();
        amountController!.clear();
      }
    },
    child:  Text(text.isEmpty? "Save":"Update"),
    );
  }

  //DELETE BUTTON
  Widget _deleteExpenseButton(int id){
    return MaterialButton(
      onPressed: () async{
        //pop box
        Navigator.pop(context);

        //delete expense from db
        await context.read<ExpenseDatabase>().deleteExpense(id);
    },
    child: Text("Delete"),);
  }
}

