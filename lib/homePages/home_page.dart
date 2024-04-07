// ignore_for_file: prefer_const_constructors

import 'package:financial_management_app/homePages/containers/big_container.dart';
import 'package:financial_management_app/homePages/containers/circular.dart';
import 'package:financial_management_app/homePages/containers/rectangle.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List accounts = [
    "MOMO",
    "GTBank",
    "Fidelity Bank",
    "Add Bank Card",
    "Add Manually"
  ];

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
                        children: const [
                          Text(
                            "Total balance",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "\$9000.00",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          )
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
                  Container(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: accounts.length,
                      itemBuilder: (context, index) {
                        return Circles(text: accounts[index]);
                      },
                    ),
                  ),

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
                              "Recent Transactions",
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
                          Text("  Link your transaction with spend wise card"),
                        ],
                      ),
                      //updates
                      Expanded(
                        child: ListView(
                          children: [
                            BigContainer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            BigContainer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            BigContainer()
                          ],
                        ),
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
