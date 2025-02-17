import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

class YourPieChart extends StatelessWidget {
  const YourPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();

    return Container(
      padding: EdgeInsets.only(bottom: 20),
      color: uiController.isDarkMode.value == false
          ? Colors.green[100]
          : Color(0xFF232323),
      width: 230,
      child: Column(
        children: [
          PieChartTileContainer(), // Container remains the same
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 250, // Adjusted height to prevent overlap
            child: Obx(() {
              // Wrapping PieChart with Obx to ensure updates when the length changes
              return myPieChart();
            }),
          ),
          SizedBox(height: 20), // Space between Pie chart and task info
          Column(
            children: [
              // Remaining Tasks Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.green[900], // Color for remaining tasks
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Remaining Tasks",
                    style: TextStyle(
                      color: uiController.isDarkMode.value == false
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Completed Tasks Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                          255, 97, 251, 176), // Color for completed tasks
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Completed Tasks",
                    style: TextStyle(
                      color: uiController.isDarkMode.value == false
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  myPieChart() {
    final uiController = Get.find<Uicontroller>();

    // Calculate the values for the pie chart
    double completeDataValue = uiController.completeData.length.toDouble();
    double taskDataValue = uiController.tasksData.length.toDouble();

    // Prevent negative values if necessary
    double remainingValue = taskDataValue - completeDataValue;
    // if (remainingValue < 0) remainingValue = 0.0; // Ensure no negative values

    return PieChart(
      PieChartData(
        sections: [
          // Completed Tasks Section
          PieChartSectionData(
            value: uiController.completeData.length.toDouble(),
            showTitle: true,

            radius: 30,
            color: const Color.fromARGB(255, 97, 251, 176), // Green color
          ),
          // Remaining Tasks Section
          PieChartSectionData(
            value: uiController.tasksData.length.toDouble(),
            showTitle: true,

            radius: 30,
            color: Colors.green[900]!, // Darker green for remaining tasks
          ),
          // Total Tasks Section (if you want to display the total tasks)
          PieChartSectionData(
            value: taskDataValue - (completeDataValue + remainingValue),
            showTitle: false,
            radius: 30,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  PieChartTileContainer() {
    final uiController = Get.find<Uicontroller>();
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: uiController.isDarkMode.value == false
          ? Colors.green[100]
          : Color(0xFF232323),
      padding: EdgeInsets.all(10),
      width: 250,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today Task",
                style: TextStyle(
                    color: uiController.isDarkMode.value == false
                        ? Colors.black
                        : Colors.white),
              ),
              CircleAvatar(
                backgroundColor: uiController.isDarkMode.value == false
                    ? Colors.black
                    : Colors.white,
                radius: 10,
                child: Text(
                  "i",
                  style: TextStyle(
                    fontSize: 20,
                    color: uiController.isDarkMode.value == false
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
