// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:financial_management_app/settingsPage/pages/add.dart';
import 'package:financial_management_app/settingsPage/pages/recommend.dart';
import 'package:financial_management_app/settingsPage/pages/saving_goals.dart';
import 'package:financial_management_app/settingsPage/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  //final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              // leading: IconButton(onPressed: (){},
              // icon: Icon(Icons.arrow_back_ios,
              // color: Colors.black,)),
              title: Center(
                child: Text(
                  "Goals",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green,
                    ))
              ]),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 120,
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Monthly Budget",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "\$668.98",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                      Center(
                        child: CircularPercentIndicator(
                          radius: 35,
                          lineWidth: 8,
                          percent: 0.65,
                          progressColor: Colors.white,
                          center: Text(
                            "65%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                child: TabBar(tabs: [
                  TabItem(
                    title: "Savings Goal",
                  ),
                  TabItem(
                    title: "Recommend",
                  ),
                  TabItem(
                    title: "Add",
                  )
                ]),
              ),
              Expanded(
                child: TabBarView(
                    children: [SavingGoals(), Recommend(), AddPage()]),
              )
            ],
          ),
        ));
  }
}
