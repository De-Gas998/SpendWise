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
  NumberFormat.currency(locale: "GH\u20b2 ", symbol: "C",
  decimalDigits: 2);
  return 
  format.format(amount);
}

//calculate the number of months since the first month
int calculateMonthCount( startYear, startMonth, currentYear, currentMonth){
  int monthCount = 
  (currentYear-startYear) * 12 + currentMonth-startMonth + 1;
  return monthCount;
}