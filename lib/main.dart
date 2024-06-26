//import 'dart:js';

import 'package:financial_management_app/analysisPages/expense.dart';
import 'package:financial_management_app/authentication/splash.dart';
import 'package:financial_management_app/database/expense_database.dart';
import 'package:financial_management_app/database/goals_database.dart';
import 'package:financial_management_app/db/goals/goal.dart';
import 'package:financial_management_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
late Isar isar;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final dir = await getApplicationDocumentsDirectory();
  isar = Isar.openSync([ExpenseSchema, GoalModelSchema], directory: dir.path);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ExpenseDatabase()),
      ChangeNotifierProvider(create: (context) => GoalsDatabase()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashScreen(),
    );
  }
}















// class _MessagesListView extends StatelessWidget {
//    _MessagesListView({
//     Key? key,
//     required this.messages,
//   }) : super(key: key);

//   final List<SmsMessage> messages;
//         List amountData=[];
//         double sum=0;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: messages.length,
//       itemBuilder: (BuildContext context, int i) {
//         var message = messages[i];




//             double sum = 0.0;
//             double subtract = 0.0;

//     for (SmsMessage payment in messages) {
//       if (payment.body!.contains('received for')) {
//         String extractedAmount = extractAmount(payment.body!);
//         if (extractedAmount.isNotEmpty) {
//           double amount = double.tryParse(extractedAmount.replaceAll(',', '')) ?? 0.0;
//           sum += amount;
//           print(sum);
          
//         }

//         // print(sum);
//       }else{
//           String extractedAmount = extractAmount(payment.body!);
//         if (extractedAmount.isNotEmpty) {
//           double amount = double.tryParse(extractedAmount.replaceAll(',', '')) ?? 0.0;
//           subtract+= amount;
//           print(subtract);
          
//         }

//       }
//     }

//     print(sum-subtract); // Output: 110.0

         

//         return ListTile(
//           title: Text('${message.sender} [${message.date}]'),
//           subtitle: Text('${message.body}'),
//         );
//       },
//     );
//   }
//     String extractAmount(String payment) {
//     RegExp regExp = RegExp(r'GHS\s?([\d.,]+)');
//     RegExpMatch? match = regExp.firstMatch(payment);
//     if (match != null) {
//       return match.group(1)!;
//     } else {
//       return '';
//     }
//   }
// }

