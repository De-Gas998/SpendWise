// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:financial_management_app/walletpages/bank_cards.dart';
import 'package:financial_management_app/walletpages/list_tile.dart';
import 'package:financial_management_app/walletpages/mini_container.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //send button
                      MiniContainer(
                          iconImagePath: "images/send.png", buttonName: "Send"),

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
                    MyListTile(
                        iconImagePath: "images/analysis.png",
                        tileTile: "Statistics",
                        tileSubTitle: "Payment and Income"),

                    SizedBox(
                      height: 20,
                    ),

                    MyListTile(
                        iconImagePath: "images/lending.png",
                        tileTile: "Transactions",
                        tileSubTitle: "Transaction History"),
                  ]),
                ),
              ],
            )),
      ),
    );
  }
}
