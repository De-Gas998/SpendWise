// ignore_for_file: prefer_const_constructors

import 'package:financial_management_app/analysisPages/expense.dart';
import 'package:financial_management_app/database/expense_database.dart';
import 'package:financial_management_app/homePages/containers/big_container.dart';
import 'package:financial_management_app/homePages/containers/rectangle.dart';

import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List accounts = [
    "MOMO",
    "GTBank",
    "Fidelity Bank",
    "Add Bank Card",
    "Add Manually"
  ];
  @override
  void initState() {
    getTotalTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Column(
                children: [
                  //Account balance display
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total balance",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Consumer<ExpenseDatabase>(
                              builder: (context, expense, c) {
                            return Text(
                              "GH\u20b2 ${expense.totalBalance}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            );
                          })
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications,
                            size: 25,
                          ))
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //bank cards
                  // Container(
                  //   height: 110,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: accounts.length,
                  //     itemBuilder: (context, index) {
                  //       return Circles(text: accounts[index]);
                  //     },
                  //   ),
                  // ),

                  const Divider(
                    thickness: 1,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),

              //app features
              Rectangle(),

              // const SizedBox(
              //   height: 10,
              // ),

              //recent transactions
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  //decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(8),
                  // border:
                  // Border.all(width: 1, color: Colors.grey.shade400)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Expenses",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "See All   >",
                              style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      //link your transaction
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "NEW",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Text("  Get your most recent expenses on SpendWise"),
                        ],
                      ),
                      //updates
                      Expanded(
                        child: Consumer<ExpenseDatabase>(
                            builder: (context, expense, c) {
                          return expense.allExpense.isEmpty
                              ? Center(
                                  child: Text("No Recent Expenses"),
                                )
                              : ListView.builder(
                                  itemCount: expense.allExpense.length,
                                  itemBuilder: (context, index) {
                                    Expense individualExpense = expense
                                        .allExpense.reversed
                                        .toList()[index];

                                    return BigContainer(
                                      individualExpense: individualExpense,
                                    );
                                  });
                          // ListView(
                          //   children: [
                          //     // BigContainer(),
                          //     // BigContainer(),
                          //     // BigContainer()
                          //   ],
                          // );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

getTotalTransaction() async {
  final SmsQuery query = SmsQuery();
  List<SmsMessage> _messages = [];
  var permission = await Permission.sms.status;
  if (permission.isGranted) {
    _messages = await query.querySms(
      kinds: [
        SmsQueryKind.draft,
        SmsQueryKind.sent,
      ],
      // address: '+254712345789',
      count: 10,
    );
    debugPrint('sms inbox messages: ${_messages.length}');
  } else {
    await Permission.sms.request();
  }

  double sum = 0.0;
  double subtract = 0.0;

  for (SmsMessage payment in _messages) {
    if (payment.body!.contains('received for')) {
      String extractedAmount = extractAmount(payment.body!);
      if (extractedAmount.isNotEmpty) {
        double amount =
            double.tryParse(extractedAmount.replaceAll(',', '')) ?? 0.0;
        sum += amount;
        print("RECIEVED::::::::::::::::::::::;");
        print(sum);
      }

      // print(sum);
    } else {
      if (payment.body!.contains("Bills") ||
          payment.body!.contains("Expenses") ||
          payment.body!.contains("Family")) {
        String extractedAmount = extractAmount(payment.body!);
        if (extractedAmount.isNotEmpty) {
          double amount =
              double.tryParse(extractedAmount.replaceAll(',', '')) ?? 0.0;
          subtract += amount;
          print("OTHERS");
          print(amount);
        }
      }
    }
  }
}

String extractAmount(String payment) {
  RegExp regExp = RegExp(r'GHS\s?([\d.,]+)');
  RegExpMatch? match = regExp.firstMatch(payment);
  if (match != null) {
    return match.group(1)!;
  } else {
    return '';
  }
}
