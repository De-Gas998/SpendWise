// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:financial_management_app/walletpages/bank_cards.dart';
import 'package:financial_management_app/walletpages/list_tile.dart';
import 'package:financial_management_app/walletpages/mini_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:financial_management_app/analysisPages/expense.dart';
import 'package:financial_management_app/analysisPages/helper_function.dart';
import 'package:financial_management_app/analysisPages/new_expense.dart';
import 'package:financial_management_app/barGraph/bar_graph.dart';
//import 'package:financial_management_app/analysisPages/helper_function.dart';
import 'package:financial_management_app/database/expense_database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  //page controller
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "My ",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                            children: [
                          TextSpan(
                            text: "Cards",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black87,
                            ),
                          )
                        ])),
                    // Row(
                    //   children: [
                    // Text("My ", style:
                    // TextStyle(fontSize: 28,
                    // fontWeight: FontWeight.bold),),
                    //     Text("Cards", style:
                    //     TextStyle(fontSize: 28),)
                    //   ],
                    // ),
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green.shade200),
                        child: Icon(Icons.add))
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                //cards
                Container(
                  height: 180,
                  child: PageView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      BankCard(
                          balance: 2345.17,
                          cardNumber: 663497789,
                          expiryMonth: 06,
                          expiryYear: 25,
                          color: Colors.green[300]),
                      BankCard(
                          balance: 1645.70,
                          cardNumber: 6789,
                          expiryMonth: 09,
                          expiryYear: 25,
                          color: Colors.deepPurple[300]),
                      BankCard(
                          balance: 2731.38,
                          cardNumber: 67647989,
                          expiryMonth: 04,
                          expiryYear: 25,
                          color: Colors.blue[300]),
                    ],
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect:
                      ExpandingDotsEffect(activeDotColor: Colors.grey.shade700),
                ),

                SizedBox(
                  height: 30,
                ),

                //3 buttons (send + pay + bills)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //send button
                              MiniContainer(
                                  iconImagePath: "images/send.png",
                                  buttonName: "Send"),

                              //pay button
                              MiniContainer(
                                  iconImagePath: "images/credit-cards.png",
                                  buttonName: "Pay"),

                              //bills button
                              MiniContainer(
                                  iconImagePath: "images/bills.png",
                                  buttonName: "Bills"),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        //column -> statistics + transactions
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(children: [
                            //statistics
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StatisticsView()));
                              },
                              child: MyListTile(
                                  iconImagePath: "images/analysis.png",
                                  tileTile: "Statistics",
                                  tileSubTitle: "Payment and Income"),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Transactions()));
                              },
                              child: MyListTile(
                                  iconImagePath: "images/lending.png",
                                  tileTile: "Transactions",
                                  tileSubTitle: "Transaction History"),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

// class StatisticsView extends StatelessWidget {
//   const StatisticsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

class StatisticsView extends StatefulWidget {
  //final void Function(BuildContext)? onEditPressed;
  //final void Function(BuildContext)? onDeletePressed;
  const StatisticsView({
    super.key,
    //required this.onEditPressed,
    //required this.onDeletePressed
  });

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  Future<Map<int, double>>? monthlyTotalsFuture;

  @override
  void initState() {
    //read database initialize startup
    Provider.of<ExpenseDatabase>(context, listen: false).readExpenses();

    // load futures
    refreshGraphData();

    super.initState();
  }

  //refresh graph data
  void refreshGraphData() {
    monthlyTotalsFuture = Provider.of<ExpenseDatabase>(context, listen: false)
        .calculateMonthlyTotals();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseDatabase>(builder: (context, value, child) {
      //get dates
      int startMonth = value.getStartMonth();
      int startYear = value.getStartYear();
      int currentMonth = DateTime.now().month;
      int currentYear = DateTime.now().year;

      //calculate the number of months since the first month
      int monthCount =
          calculateMonthCount(startYear, startMonth, currentYear, currentMonth);

      //only display the expenses for the current month

      //return UI
      return Scaffold(
        appBar: AppBar(
          title: Text("Expenses Statistics"),
          centerTitle: true,
          backgroundColor: Colors.green,
          surfaceTintColor: Colors.green,
        ),
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Graph UI
                Container(
                  height: 300,
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(.4),
                  ),
                  child: FutureBuilder(
                      future: value.monthlyTotalsFuture,
                      builder: (context, snapshot) {
                        //data is loaded
                        if (snapshot.connectionState == ConnectionState.done) {
                          final monthlyTotals = snapshot.data ?? {};

                          List<double> monthlySummary = List.generate(
                              monthCount,
                              (index) =>
                                  monthlyTotals[startMonth + index] ?? 0.0);
                          // print(monthlySummary);
                          return MyBarGraph(
                              monthlySummary: monthlySummary,
                              startMonth: startMonth);
                        }
                        //loading
                        else {
                          return const Center(child: Text("Loading"));
                        }
                      }),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                    ),
                    SizedBox(width: 15),
                    Text("Active")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                      SizedBox(width: 15),
                      Text("Inactive")
                    ],
                  ),
                ),

                Text(
                    "Expense monthly statistics bars indicators interpretation")
              ],
            ),
          ),
        ),
      );
    });
  }
}

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Transactions"),
      ),
      body: Consumer<ExpenseDatabase>(builder: (context, expense, c) {
        double perc = expense.totalBalance/100;
        print(perc);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularPercentIndicator(
                radius: 100,
                lineWidth: 10,
                percent: perc/100,
                progressColor: Colors.green,
                center: Text(
                  "$perc%",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
