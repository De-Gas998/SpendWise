// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:financial_management_app/analysisPages/analysis_pages.dart';
import 'package:financial_management_app/analysisPages/new_expense.dart';
import 'package:financial_management_app/homePages/home_page.dart';
import 'package:financial_management_app/settingsPage/settings_page.dart';
import 'package:financial_management_app/walletpages/wallet_page.dart';
import 'package:flutter/material.dart';

class BottomNavBars extends StatefulWidget {
  const BottomNavBars({super.key});

  @override
  State<BottomNavBars> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBars> {

  //navigate around the bottom nav bar
  int _selectedIndex=0;
  void _navigateBottomNavBar(int index){
    setState((){
      _selectedIndex=index;
    });
  }

  //different pages to navigate to
  final List<Widget> _children = [
    HomePage(),
    WalletPage(),
    AnalyticsPage(),
    SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: _children[_selectedIndex],
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, 
            builder: (context) => CreateNewExpense());
          },
          backgroundColor: Colors.green.shade500,
          child: Icon(Icons.add, 
          color: Colors.white, size: 40,),),
          floatingActionButtonLocation: 
          FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          onTap: _navigateBottomNavBar,
          height: 60,
          backgroundColor: Colors.green.shade200,
          color: Colors.grey.shade200,
        items: [
          //home
          Icon(Icons.home,
          size: 30,),
    
          //wallet
          Icon(Icons.wallet,
          size: 30,),
    
          //analytic
          Icon(Icons.analytics,
          size: 30,),
    
          //setting
          Icon(Icons.settings,
          size: 30,)
        ]),
    );
  }
}