import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../Function/DeletItemFunctoin.dart';
import '../UiController/UiController.dart';
import 'TaskCard.dart';

class ColumnWiseDataDisplay extends StatelessWidget {
  const ColumnWiseDataDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final uiController =
          Get.find<Uicontroller>(); // Ensure uiController is found
      print(
          'Task Index: ${uiController.taskIndex.value}'); // Debugging statement for taskIndex

      // Handle taskIndex == 0: Show all tasks
      if (uiController.taskIndex.value == 0) {
        if (uiController.tasksData.isNotEmpty) {
          print('Displaying all tasks');
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: uiController.tasksData.map<Widget>((task) {
                print(
                    'Task Heading: ${task.taskHeading}'); // Debugging statement for each task
                return TaskCard(
                  uiId: task.uiId,
                  taskTitle: task.taskHeading,
                  taskDetails: task.taskDetails,
                  taskDaysRepeated: task.taskDaysRepeated,
                  calendarDate: task.calendarDate,
                  reminderTime: task.reminderTime,
                  timeSavedAt: task.timeSavedAt,
                  TaskStatus: task.taskStaus,
                  isImportant: task.isImportant,
                  taskSteps: task.taskSteps,
                );
              }).toList(),
            ),
          );
        } else {
          print('No tasks to display');
          return const SizedBox();
        }
      }
      // Handle taskIndex == 1: Show tasks where taskDetails is not empty
      else if (uiController.taskIndex.value == 1) {
        print('Displaying tasks with non-empty task details');
        if (uiController.tasksData.isNotEmpty) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: uiController.tasksData.map<Widget>((task) {
                print('Task Heading: ${task.taskHeading}');
                print('Task Details: ${task.taskDetails ?? "No details"}');
                return TaskCard(
                  uiId: task.uiId,
                  taskTitle: task.taskHeading,
                  taskDetails: task.taskDetails,
                  taskDaysRepeated: task.taskDaysRepeated,
                  calendarDate: task.calendarDate,
                  reminderTime: task.reminderTime,
                  timeSavedAt: task.timeSavedAt,
                  TaskStatus: task.taskStaus,
                  isImportant: task.isImportant,
                  taskSteps: task.taskSteps.isEmpty ? [] : task.taskSteps,
                );
              }).toList(),
            ),
          );
        } else {
          print('No tasks to display');
          return const SizedBox();
        }
      }
      // Handle taskIndex == 2: Show tasks where `isImportant` is true
      else if (uiController.taskIndex.value == 2) {
        print('Displaying important tasks');
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: uiController.tasksData
                .where((task) =>
                    task.isImportant) // Only tasks where `isImportant` is true
                .map<Widget>((task) {
              print('Task Heading: ${task.taskHeading}');
              return TaskCard(
                uiId: task.uiId,
                taskTitle: task.taskHeading,
                taskDetails: task.taskDetails,
                taskDaysRepeated: task.taskDaysRepeated,
                calendarDate: task.calendarDate,
                reminderTime: task.reminderTime,
                timeSavedAt: task.timeSavedAt,
                TaskStatus: task.taskStaus,
                isImportant: task.isImportant,
                taskSteps: task.taskSteps,
              );
            }).toList(),
          ),
        );
      }
      // Handle taskIndex == 3: Show tasks where `calendarDate` is not null
      else if (uiController.taskIndex.value == 3) {
        print('Displaying tasks with non-null calendarDate');
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: uiController.tasksData
                .where((task) =>
                    task.calendarDate !=
                    null) // Only tasks where `calendarDate` is not null
                .map<Widget>((task) {
              print('Task Heading: ${task.taskHeading}');
              return TaskCard(
                uiId: task.uiId,
                taskTitle: task.taskHeading,
                taskDetails: task.taskDetails,
                taskDaysRepeated: task.taskDaysRepeated,
                calendarDate: task.calendarDate,
                reminderTime: task.reminderTime,
                timeSavedAt: task.timeSavedAt,
                TaskStatus: task.taskStaus,
                isImportant: task.isImportant,
                taskSteps: task.taskSteps,
              );
            }).toList(),
          ),
        );
      }
      // Handle taskIndex > 3: Dynamically filter based on property value
      else if (uiController.taskIndex.value > 3) {
        print('Displaying tasks dynamically filtered based on property value');
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: uiController.tasksData.where((task) {
              // Check if the property exists and matches
              try {
                String key = uiController
                    .taskArray[uiController.taskIndex.value].keys
                    .toList()[1]; // Get the key from taskArray
                print('Filter key: $key');
                return task.property != null &&
                    task.property ==
                        uiController.taskArray[uiController.taskIndex.value]
                            [key];
              } catch (e) {
                print('Error while filtering task: $e');
                return false;
              }
            }).map<Widget>((task) {
              print('Task Heading: ${task.taskHeading}');
              return TaskCard(
                uiId: task.uiId,
                taskTitle: task.taskHeading,
                taskDetails: task.taskDetails,
                taskDaysRepeated: task.taskDaysRepeated,
                calendarDate: task.calendarDate,
                reminderTime: task.reminderTime,
                timeSavedAt: task.timeSavedAt,
                TaskStatus: task.taskStaus,
                isImportant: task.isImportant,
                taskSteps: task.taskSteps,
              );
            }).toList(),
          ),
        );
      } else {
        print('No tasks to display');
        return const SizedBox();
      }
    });
  }
}
