import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/Components/ColumnWiseDisplaySection.dart';
import 'package:new_quad_todoapp/Components/GridWiseContentDisplaySection.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';
import 'TaskCard.dart';

class DataDisplaySection extends StatelessWidget {
  const DataDisplaySection({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          if (uiController.completeData.isNotEmpty &&
              uiController.tasksData.isEmpty) {
            return SizedBox();
          } else {
            return Text(
              "${uiController.taskArray[uiController.taskIndex.value][uiController.taskArray[uiController.taskIndex.value].keys.toList()[1]]}",
              style: TextStyle(
                fontFamily: 'Outfit',
                  color: uiController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            );
          }
        }),
        SizedBox(
          height: 15,
        ),
        // Column or Grid Display Section
        Obx(() {
          return uiController.isGrid.value == false
              ? Container(
                  // height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(child: ColumnWiseDataDisplay()))
              : GridWiseDisplaySection();
        }),

        SizedBox(
          height: 20,
        ),

        // Completed Tasks Heading and Cards if completeData is not empty
        Obx(() {
          if (uiController.completeData.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Completed Tasks",
                  style: TextStyle(
                      color: uiController.isDarkMode.value == false
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                ),
                Divider()
              ],
            );
          } else {
            return SizedBox();
          }
        }),
        SizedBox(
          height: 15,
        ),

        // Show completed tasks if they exist
        Obx(() {
          if (uiController.completeData.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: uiController.completeData.map<Widget>((task) {
                  return TaskCard(
                    uiId: task.uiId,
                    taskTitle: task.taskHeading,
                    taskDetails: task.taskDetails ?? "",
                    timeSavedAt: task.timeSavedAt,
                    taskDaysRepeated: task.taskDaysRepeated ?? [],
                    TaskStatus: task.taskStaus,
                    calendarDate: task.calendarDate,
                    reminderTime: task.reminderTime,
                    isImportant: task.isImportant,
                    taskSteps: task.taskSteps,
                  );
                }).toList(),
              ),
            );
          } else {
            return SizedBox();
          }
        }),
      ],
    );
  }
}
