/*
These are some helpful functions used accross the app
*/

import 'package:intl/intl.dart';

//convert string to double
double convertStringToDouble (String string){
  double? amount = double.tryParse(string);
  return amount ?? 0;
}


//format double amount into cedis and pesewas
String formatAmount(double amount){
  final format = 
  NumberFormat.currency(locale: "GH Cedis", symbol: "C",
  decimalDigits: 2);
  return 
  format.format(amount);
}