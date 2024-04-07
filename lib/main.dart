//import 'dart:js';

import 'package:financial_management_app/authentication/splash.dart';
import 'package:financial_management_app/database/expense_database.dart';
//import 'package:financial_management_app/authentication/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //initialize db
  await ExpenseDatabase.initialize();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ExpenseDatabase(),
      child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),);
  }
}