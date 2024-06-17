import 'package:financial_management_app/analysisPages/expense.dart';
import 'package:financial_management_app/analysisPages/helper_function.dart';
import 'package:financial_management_app/analysisPages/new_expense.dart';
import 'package:financial_management_app/barGraph/bar_graph.dart';
//import 'package:financial_management_app/analysisPages/helper_function.dart';
import 'package:financial_management_app/database/expense_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class AnalyticsPage extends StatefulWidget {
  //final void Function(BuildContext)? onEditPressed;
  //final void Function(BuildContext)? onDeletePressed;
  const AnalyticsPage({super.key,
  //required this.onEditPressed,
  //required this.onDeletePressed
  });

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
   onEditPressed (Map data){
     showDialog(context: context, 
            builder: (context) => CreateNewExpense(data: data,));
   }
  
   onDeletePressed (Map expense){
    showDialog(context: context, 
            builder: (context) => CreateNewExpense(data: expense,));
   }

  //text controllers

  //futures to load graph data
  Future<Map<int, double>>? _monthlyTotalsFuture;

  @override
  void initState() {
    //read database initialize startup
    Provider.of<ExpenseDatabase>(context, listen: false).readExpenses();

    // load futures
    refreshGraphData();

    super.initState();
  }

  //refresh graph data
  void refreshGraphData(){
    _monthlyTotalsFuture = Provider.of<ExpenseDatabase>(context, listen: false)
    .calculateMonthlyTotals();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseDatabase>(
        builder: (context, value, child) {
          //get dates
          int startMonth = value.getStartMonth();
          int startYear = value.getStartYear();
          int currentMonth = DateTime.now().month;
          int currentYear = DateTime.now().year;

          //calculate the number of months since the first month
          int monthCount = calculateMonthCount(
            startYear, startMonth, currentYear, currentMonth);

          //only display the expenses for the current month

          //return UI
          return Scaffold(
              appBar: AppBar(
                title: Text("Expenses Tracker"),
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.green,
                surfaceTintColor: Colors.green,
              ),
              backgroundColor: Colors.grey.shade200,
              body: SafeArea(
                child: Column(
                  children: [
                    //Graph UI
                    SizedBox(
                      height: 250,
                      child: FutureBuilder(
                        future: _monthlyTotalsFuture, 
                        builder: (context, snapshot){
                          //data is loaded
                          if(snapshot.connectionState == ConnectionState.done){
                            final monthlyTotals = snapshot.data ?? {};
                    
                            //create the list of monthly salary
                            List<double> monthlySummary = List.generate(monthCount, 
                            (index) => monthlyTotals[startMonth + index] ?? 0.0);
                    
                            return
                            MyBarGraph(
                              monthlySummary: monthlySummary, startMonth: startMonth);
                    
                          }
                          //loading
                          else {
                            return const Center(child: Text("Loading"));
                          }
                        }),
                    ),
              
                    //EXPENSE LIST UI
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.allExpense.length,
                          itemBuilder: (context, index) {
                            //get individual expense
                            Expense individualExpense =
                                value.allExpense.reversed.toList()[index];
                    
                            //return ListTile
                            return Card(
                              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                              child: Slidable(
                                endActionPane: ActionPane(
                                  motion: StretchMotion(), 
                                  children: [
                                    //settings option
                                    SlidableAction(
                                      backgroundColor: Colors.grey.shade700,
                                      foregroundColor: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      onPressed: (v){
                                        // print(v);
                                           onEditPressed({
                                        "name":individualExpense.name,
                                        "amount":individualExpense.account,
                                        "id":individualExpense.id
                                      });
                                      },
                    
                                      
                                    
                                    icon: Icons.edit,),
                    
                                    //delete option
                                     SlidableAction(
                                      backgroundColor: Colors.red.shade700,
                                      foregroundColor: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      onPressed: (v)async{
                                  await context.read<ExpenseDatabase>().deleteExpense(individualExpense.id);
                                      },
                                    icon: Icons.delete,)
                                  ]),
                                child: ListTile(
                                  title: Text(individualExpense.name),
                                  trailing: Text("GH\u20b2 ${individualExpense.account}"),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
        });
  }
}
