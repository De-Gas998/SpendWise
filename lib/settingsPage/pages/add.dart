// ignore_for_file: must_be_immutable

import 'package:financial_management_app/authentication/login_folder/my_button.dart';
import 'package:financial_management_app/database/goals_database.dart';
import 'package:financial_management_app/db/goals/goal.dart';
import 'package:flutter/material.dart';
import 'package:light_modal_bottom_sheet/light_modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              "Write your goal",
              style: headingTextStyle,
            ),
          ),
          GestureDetector(
            onTap: () {
              showMaterialModalBottomSheet(
                  // backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => AddGoalComponent());
            },
            child: Material(
              color: const Color.fromARGB(255, 216, 229, 226),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Write your goal"), Icon(Icons.add)],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AddGoalComponent extends StatelessWidget {
  AddGoalComponent({Key? key}) : super(key: key);
  final TextEditingController goalNameController = TextEditingController();
  final TextEditingController goalAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Goal",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Text("Save", style: TextStyle(color: Colors.green)))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const Text(
            "Title",
            style: headingTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: CommonTextField(
              hintText: "Write how you want to name your goal",
              controller: goalNameController,
            ),
          ),
          const Text(
            "Goal Target Amount",
            style: headingTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: CommonTextField(
              hintText: "Enter your goal target amount",
              controller: goalAmountController,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 10,
          ),
          MyButton(
            text: "Add",
            onPress: () async {
              if (goalAmountController.text.isEmpty ||
                  goalAmountController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Goal Title and target amount can't be empty"),
                  backgroundColor: Colors.red,
                ));
              } else {
                await Provider.of<GoalsDatabase>(context, listen: false)
                    .createNewGoal(GoalModel(
                        name: goalNameController.text,
                        amount: double.parse(goalAmountController.text),
                        date: DateTime.now()));
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  CommonTextField({
    super.key,
    this.hintText,
    this.controller,
  });
  final String? hintText;
  final TextEditingController? controller;
  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          filled: true,
          fillColor: const Color(0xffF3F7F6),
          border: outlineInputBorder,
          focusedBorder: outlineInputBorder),
    );
  }
}

const headingTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
