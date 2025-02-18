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
              ? SingleChildScrollView(child: ColumnWiseDataDisplay())
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

        // Add Image if no tasks for the current taskIndex
        Obx(() {
          // Check if there are no tasks for the corresponding taskIndex
          if (uiController.taskIndex.value == 0 &&
              uiController.tasksData.isEmpty) {
            return Column(
              children: [
                Image.asset(
                  'assets/Kanban planning board on tablet.png',
                  height: 300, // Set the image height to 300px
                  width: double.infinity,
                  fit: BoxFit
                      .cover, // Optional: Use this to scale the image to fit the container
                ),
                SizedBox(height: 15),
              ],
            );
          } else if (uiController.taskIndex.value == 1 &&
              uiController.completeData.isEmpty) {
            return Column(
              children: [
                Image.asset(
                  'assets/Kanban planning board on tablet.png',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 15),
              ],
            );
          } else if (uiController.taskIndex.value == 2 &&
              uiController.tasksData
                  .where((task) => task.isImportant)
                  .isEmpty) {
            return Column(
              children: [
                Image.asset(
                  'assets/Kanban planning board on tablet.png',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 15),
              ],
            );
          } else if (uiController.taskIndex.value == 3 &&
              uiController.tasksData
                  .where((task) => task.calendarDate != null)
                  .isEmpty) {
            return Column(
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    height: 300,
                    width: 300,
                    'assets/Kanban planning board on tablet.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 15),
              ],
            );
          }
          return SizedBox(); // Return SizedBox if tasks exist for this section
        }),
      ],
    );
  }
}
