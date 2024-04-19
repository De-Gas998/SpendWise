import 'package:financial_management_app/analysisPages/expense.dart';
import 'package:financial_management_app/main.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
//import 'package:path_provider/path_provider.dart';

class ExpenseDatabase extends ChangeNotifier {
  // static late Isar isar;
  List<Expense> _allExpenses = [];
  Future<Map<int, double>>? _monthlyTotalsFuture;

  double _totalBalance = 0.0;
  /*
  S E T U P
  */

  //initialize db
  // static Future<void> initialize() async{
  //   final dir = await getApplicationDocumentsDirectory();
  //   isar = await Isar.openSync([ExpenseSchema],
  //   directory: dir.path);
  // }

  /*
  G E T T E R S
  */

  List<Expense> get allExpense => _allExpenses;
  Future<Map<int, double>> get monthlyTotalsFuture => _monthlyTotalsFuture!;
  double get totalBalance => _totalBalance;
  /*
  O P E R A T I O N S
  */

  //create - add new expense
  Future<void> createNewExpense(Expense newExpense) async {
    //add to db
    await isar.writeTxn(() => isar.expenses.put(newExpense));

    //re-read from db
    readExpenses();
  }

  //read - expenses from db
  Future<void> readExpenses() async {
    //fetch all existing expenses from db
    List<Expense> fetchedExpenses = await isar.expenses.where().findAll();

    //give to local Expense List
    _allExpenses.clear();
    _allExpenses.addAll(fetchedExpenses);

    //update UI
    notifyListeners();
  }

  //update - edit an expense in db
  Future<void> updateExpense(int id, Expense updatedExpense) async {
    //make sure new expense has same id as existing one
    updatedExpense.id = id;

    //update in db
    await isar.writeTxn(() => isar.expenses.put(updatedExpense));

    //re-read from db
    await readExpenses();
  }

  //delete - an expense
  Future<void> deleteExpense(int id) async {
    //delete from db
    await isar.writeTxn(() => isar.expenses.delete(id));

    //re-read from db
    await readExpenses();
  }

  /*
  HELPER
  */

  //calculate total expense for each month
  Future<Map<int, double>> calculateMonthlyTotals() async {
    //ensure expenses are read from db
    await readExpenses();

    //create a map to keep track of total epenses per month
    Map<int, double> monthlyTotals = {};

    //iterate over all expenses
    for (var expense in _allExpenses) {
      //extratch the month from the date of the expense
      int month = expense.date.month;
      print(expense.date.month);
      //if the month is not yet in the map, initialize to 0
      if (!monthlyTotals.containsKey(month)) {
        monthlyTotals[month] = 0;
      }

      //add the expense amount to the total for the month
      monthlyTotals[month] = monthlyTotals[month]! + expense.account;
    }
    return monthlyTotals;
  }

  // get start month
  int getStartMonth() {
    if (allExpense.isEmpty) {
      return DateTime.now().month;
      //default to current month is no expense are recorded
    }

    //sort expenses by date to find the earliest
    _allExpenses.sort(
      (a, b) => a.date.compareTo(b.date),
    );
    return _allExpenses.first.date.month;
  }

  //get start year
  int getStartYear() {
    if (allExpense.isEmpty) {
      return DateTime.now().year;
      //default to current month is no expense are recorded
    }

    //sort expenses by date to find the earliest
    _allExpenses.sort(
      (a, b) => a.date.compareTo(b.date),
    );
    return _allExpenses.first.date.year;
  }

  refreshPage() {
    _monthlyTotalsFuture = calculateMonthlyTotals();
    notifyListeners();
  }

  getTotalBalane(double balance, from) {
    final bl = sharedPreferences.setDouble("balance", balance);
    if (from == "Income" || from == "Savings" || from == "Points") {
      _totalBalance += sharedPreferences.getDouble("balance")!;
    } else {
      _totalBalance -= sharedPreferences.getDouble("balance")!;
    }
    notifyListeners();
  }
}
