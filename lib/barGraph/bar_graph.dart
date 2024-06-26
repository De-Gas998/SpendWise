import 'package:financial_management_app/barGraph/individual_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatefulWidget {
  final List<double> monthlySummary; //[25, 500, 150...]
  final int startMonth; // 0 JAN, 1 FEB, 2 MAR ...

  const MyBarGraph(
      {super.key, required this.monthlySummary, required this.startMonth});

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  //this list will hold the data for each bar
  List<IndividualBar> barData = [];

  //initialize bar data - user our monthly summary to create a list of bars
  void initializeBarData() {
    barData = List.generate(widget.monthlySummary.length,
        (index) => IndividualBar(x: index, y: widget.monthlySummary[index]));
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.startMonth);
// print(widget.monthlySummary.length);
    //initialize upon build
    initializeBarData();

    //bar dimension sized
    double barWidth = 20;
    double spaceBetweenBars = 15;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 200,
        // barWidth * barData.length * spaceBetweenBars * (barData.length - 1),
        child: BarChart(BarChartData(
            minY: 0,
            maxY: 500,
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: const FlTitlesData(
              show: true,
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getBottomTitle,
                      reservedSize: 24)),
            ),
            barGroups: barData
                .map((data) => BarChartGroupData(x: data.x, barRods: [
                      BarChartRodData(
                          toY: data.y,
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.shade800,
                          backDrawRodData: BackgroundBarChartRodData(
                              show: true, toY: 1000, color: Colors.white)),
                    ]))
                .toList())),
      ),
    );
  }
}

//BOTTOM-TITLES
Widget getBottomTitle(double value, TitleMeta meta) {
  print("$value::::::::::::::::::::::::::::::");
  const textstyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

  String text;
  switch (value.toInt() % 12) {
    case 0:
      text = 'J';
      break;
    case 1:
      text = 'F';
      break;
    case 2:
      text = 'M';
      break;
    case 3:
      text = 'A';
      break;
    case 4:
      text = 'M';
      break;
    case 5:
      text = 'J';
      break;
    case 6:
      text = 'J';
      break;
    case 7:
      text = 'A';
      break;
    case 8:
      text = 'S';
      break;
    case 9:
      text = 'O';
      break;
    case 10:
      text = 'N';
      break;
    case 11:
      text = 'D';
      break;
    default:
      text = '';
      break;
  }

  return SideTitleWidget(
      child: Text(
        text,
        style: textstyle,
      ),
      axisSide: meta.axisSide);
}
