import 'package:financial_management_app/database/goals_database.dart';
import 'package:financial_management_app/db/goals/goal.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// class SavingGoals extends StatelessWidget {
//   const SavingGoals({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView(
//         children: [
//           GoalCardComponent(),
//           GoalCardComponent(),
//           GoalCardComponent(),
//           GoalCardComponent(),
//         ],
//       ),
//     );
//   }
// }

//import 'package:financial_management_app/analysisPages/helper_function.dart';
//import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class SavingGoals extends StatefulWidget {
  const SavingGoals({super.key});

  @override
  State<SavingGoals> createState() => _SavingGoals();
}

class _SavingGoals extends State<SavingGoals> {
  //text controllers

  @override
  void initState() {
    Provider.of<GoalsDatabase>(context, listen: false).readGoalModels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GoalsDatabase>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Colors.grey.shade200,
              body: value.allGoals.isEmpty
                  ? const Center(
                      child: Text("You have not Set Any Gaol Yet"),
                    )
                  : ListView.builder(
                      itemCount: value.allGoals.length,
                      itemBuilder: (context, index) {
                        //get individual expense
                        GoalModel individualGoal =
                            value.allGoals.reversed.toList()[index];

                        //return ListTile
                        return GoalCardComponent(
                          individualGoal: individualGoal,
                        );
                      }),
            ));
  }
}

class GoalCardComponent extends StatelessWidget {
  const GoalCardComponent({super.key, this.individualGoal});
  final GoalModel? individualGoal;
  @override
  Widget build(BuildContext context) {
    double percentage = 100 / individualGoal!.amount;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: const Color(0xffF7F7F7),
      surfaceTintColor: const Color(0xffF7F7F7),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  individualGoal!.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "GH\u20b2 ${individualGoal!.amount}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 12),
                )
              ],
            ),
            // LinearProgressIndicator()
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: LinearPercentIndicator(
                fillColor: Colors.white,
                barRadius: const Radius.circular(10),
                animation: true,
                lineHeight: 15.0,
                animationDuration: 2500,
                percent: 100 / individualGoal!.amount,
                center: Text(
                  "${percentage}%",
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                progressColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
