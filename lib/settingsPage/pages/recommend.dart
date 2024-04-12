import 'package:financial_management_app/settingsPage/pages/add.dart';
import 'package:flutter/material.dart';

class Recommend extends StatelessWidget {
  const Recommend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Top Recommendation",
              style: headingTextStyle,
            ),
          ),
          Expanded(
              child: Column(
                  children: recommendations
                      .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: ExpansionTile(
                              shape:
                                  RoundedRectangleBorder(side: BorderSide.none),
                              collapsedBackgroundColor: Colors.grey[300],
                              title: Text("$e"),
                            ),
                      ))
                      .toList()))
        ],
      ),
    );
  }
}

List recommendations = ["Travel", "Marriage", "Buy", "Watching foot ball"];
