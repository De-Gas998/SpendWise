import 'package:isar/isar.dart';

//this line is needed to generate isar file
//run cmd in terminal; dart run build_runner build
part 'goal.g.dart';

@Collection()
class GoalModel {
  Id id = Isar.autoIncrement; //0,1,2,...
  final String name;
  final double amount;
  final DateTime date;

  GoalModel ({
    required this.name,
    required this.amount,
    required this.date
  });
}