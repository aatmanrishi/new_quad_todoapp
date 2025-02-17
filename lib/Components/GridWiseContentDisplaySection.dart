import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';
import 'TaskCard.dart';

class GridWiseDisplaySection extends StatelessWidget {
  const GridWiseDisplaySection({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),

          // Task List
          Obx(() {
            List<Widget> taskWidgets = [];

            // Handle taskIndex == 0: Show all tasks
            if (uiController.taskIndex.value == 0) {
              if (uiController.tasksData.isNotEmpty) {
                taskWidgets.add(
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double availableWidth = constraints.maxWidth;
                      double cardWidth = availableWidth / 4;

                      return Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: uiController.tasksData.map<Widget>((task) {
                          return Container(
                            width: cardWidth,
                            child: TaskCard(
                              uiId: task.uiId,
                              taskTitle: task.taskHeading,
                              taskDetails: task.taskDetails ,
                              taskDaysRepeated: task.taskDaysRepeated ,
                              calendarDate: task.calendarDate,
                              reminderTime: task.reminderTime,
                              timeSavedAt: task.timeSavedAt,
                              TaskStatus: task.taskStaus,
                              isImportant: task.isImportant,
                              taskSteps: task.taskSteps,
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                );
              }
            }
            // Handle taskIndex == 1: Show tasks with non-empty task details
            else if (uiController.taskIndex.value == 1) {
              if (uiController.tasksData.isNotEmpty) {
                taskWidgets.add(
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double availableWidth = constraints.maxWidth;
                      double cardWidth = availableWidth / 4;

                      return Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: uiController.tasksData
                            .where((task) =>
                                task.taskDetails != null &&
                                task.taskDetails!.isNotEmpty)
                            .map<Widget>((task) {
                          return Container(
                            width: cardWidth,
                            child: TaskCard(
                              uiId: task.uiId,
                              taskTitle: task.taskHeading,
                              taskDetails: task.taskDetails ,
                              taskDaysRepeated: task.taskDaysRepeated,
                              calendarDate: task.calendarDate,
                              reminderTime: task.reminderTime,
                              timeSavedAt: task.timeSavedAt,
                              TaskStatus: task.taskStaus,
                              isImportant: task.isImportant,
                              taskSteps: task.taskSteps,
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                );
              }
            }
            // Handle taskIndex == 2: Show important tasks
            else if (uiController.taskIndex.value == 2) {
              taskWidgets.add(
                LayoutBuilder(
                  builder: (context, constraints) {
                    double availableWidth = constraints.maxWidth;
                    double cardWidth = availableWidth / 4;

                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: uiController.tasksData
                          .where((task) => task.isImportant)
                          .map<Widget>((task) {
                        return Container(
                          width: cardWidth,
                          child: TaskCard(
                            uiId: task.uiId,
                            taskTitle: task.taskHeading,
                            taskDetails: task.taskDetails ,
                            taskDaysRepeated: task.taskDaysRepeated ,
                            calendarDate: task.calendarDate,
                            reminderTime: task.reminderTime,
                            timeSavedAt: task.timeSavedAt,
                            TaskStatus: task.taskStaus,
                            isImportant: task.isImportant,
                            taskSteps: task.taskSteps,
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              );
            }
            // Handle taskIndex == 3: Show tasks with non-null calendarDate
            else if (uiController.taskIndex.value == 3) {
              taskWidgets.add(
                LayoutBuilder(
                  builder: (context, constraints) {
                    double availableWidth = constraints.maxWidth;
                    double cardWidth = availableWidth / 4;

                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: uiController.tasksData
                          .where((task) => task.calendarDate != null)
                          .map<Widget>((task) {
                        return Container(
                          width: cardWidth,
                          child: TaskCard(
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
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              );
            }
            // Handle taskIndex > 3: Dynamically filter based on property value
            else if (uiController.taskIndex.value > 3) {
              taskWidgets.add(
                LayoutBuilder(
                  builder: (context, constraints) {
                    double availableWidth = constraints.maxWidth;
                    double cardWidth = availableWidth / 4;

                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: uiController.tasksData.where((task) {
                        try {
                          String key = uiController
                              .taskArray[uiController.taskIndex.value].keys
                              .toList()[1]; // Get the key from taskArray
                          return task.property != null &&
                              task.property ==
                                  uiController.taskArray[
                                      uiController.taskIndex.value][key];
                        } catch (e) {
                          return false;
                        }
                      }).map<Widget>((task) {
                        return Container(
                          width: cardWidth,
                          child: TaskCard(
                            uiId: task.uiId,
                            taskTitle: task.taskHeading,
                            taskDetails: task.taskDetails ,
                            taskDaysRepeated: task.taskDaysRepeated,
                            calendarDate: task.calendarDate,
                            reminderTime: task.reminderTime,
                            timeSavedAt: task.timeSavedAt,
                            TaskStatus: task.taskStaus,
                            isImportant: task.isImportant,
                            taskSteps: task.taskSteps,
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              );
            }
            return Column(children: taskWidgets);
          }),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
