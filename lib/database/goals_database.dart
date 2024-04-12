import 'package:financial_management_app/db/goals/goal.dart';
import 'package:financial_management_app/main.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class GoalsDatabase extends ChangeNotifier {
  // static late Isar isar;
  List<GoalModel> _allGaols = [];

  /*
  S E T U P
  */

  //initialize db
  // static Future<void> initialize() async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   isar = await Isar.openSync([GoalModelSchema], directory: dir.path);
  // }

  /*
  G E T T E R S
  */

  List<GoalModel> get allGoals => _allGaols;

  /*
  O P E R A T I O N S
  */

  //create - add new goal
  Future<void> createNewGoal(GoalModel newGoal) async {
    //add to db
    await isar.writeTxn(() => isar.goalModels.put(newGoal));

    //re-read from db
    readGoalModels();
  }

  //read - goalModels from db
  Future<void> readGoalModels() async {
    //fetch all existing goalModels from db
    List<GoalModel> fetchedExpenses = await isar.goalModels.where().findAll();

    //give to local GoalModel List
    _allGaols.clear();
    _allGaols.addAll(fetchedExpenses);

    //update UI
    notifyListeners();
  }

  //update - edit an goal in db
  Future<void> updateGoal(int id, GoalModel updatedGoalModel) async {
    //make sure new GoalModel has same id as existing one
    updatedGoalModel.id = id;

    //update in db
    await isar.writeTxn(() => isar.goalModels.put(updatedGoalModel));

    //re-read from db
    await readGoalModels();
  }

  //delete - an GoalModel
  Future<void> deleteGoalModel(int id) async {
    //delete from db
    await isar.writeTxn(() => isar.goalModels.delete(id));

    //re-read from db
    await readGoalModels();
  }
}
