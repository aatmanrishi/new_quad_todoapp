import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';
import '../UiController/taskStructure.dart';

final uiController = Get.find<Uicontroller>();

void changePriorityFunction(String uiId) {
  // Loop through completeData
  for (int i = 0; i < uiController.completeData.length; i++) {
    print("Id that i passing? $uiId");

    if (uiController.completeData[i].uiId == uiId) {
      print(
          'Id that I am getting on doing looping ${uiController.completeData[i].uiId}');

      // Create a new task with toggled importance
      var task = Task(
          uiId: uiController.completeData[i].uiId,
          taskHeading: uiController.completeData[i].taskHeading,
          taskDetails: uiController.completeData[i].taskDetails,
          timeSavedAt: uiController.completeData[i].timeSavedAt,
          taskStaus: uiController.completeData[i].taskStaus,
          calendarDate: uiController.completeData[i].calendarDate,
          reminderTime: uiController.completeData[i].reminderTime,
          taskDaysRepeated: uiController.completeData[i].taskDaysRepeated,
          isImportant:
              !uiController.completeData[i].isImportant, // Toggle importance
          taskSteps: uiController.completeData[i].taskSteps);

      // Remove the task from completeData and insert the new one
      uiController.completeData.removeAt(i);
      uiController.completeData.insert(i, task);

      // Reset important value and UI-related fields
      uiController.tempUiId.value = '';
      uiController.tempUiIdAssociatedStaus.value = '';
      uiController.tempIsImportantValue.value = false;

      break; // Exit after updating the task
    }
  }

  // Loop through tasksData
  for (int i = 0; i < uiController.tasksData.length; i++) {
    print("Id that i passing? $uiId");

    if (uiController.tasksData[i].uiId == uiId) {
      print(
          'Id that I am getting on doing looping ${uiController.tasksData[i].uiId}');

      String? property;

      // Ensure taskIndex is valid and taskArray has enough keys
      if (uiController.taskIndex.value > 3) {
        try {
          if (uiController.taskArray[uiController.taskIndex.value].keys.length >
              1) {
            String key = uiController
                .taskArray[uiController.taskIndex.value].keys
                .toList()[1];
            property =
                uiController.taskArray[uiController.taskIndex.value][key];
          } else {
            print('Expected key not found');
          }
        } catch (e) {
          print('Error while setting property: $e');
        }
      }

      print('Property assigned: $property');

      // Create a new task with toggled importance and added property
      var task = Task(
          uiId: uiController.tasksData[i].uiId,
          taskHeading: uiController.tasksData[i].taskHeading,
          taskDetails: uiController.tasksData[i].taskDetails,
          timeSavedAt: uiController.tasksData[i].timeSavedAt,
          taskStaus: uiController.tasksData[i].taskStaus,
          calendarDate: uiController.tasksData[i].calendarDate,
          reminderTime: uiController.tasksData[i].reminderTime,
          taskDaysRepeated: uiController.tasksData[i].taskDaysRepeated,
          isImportant:
              !uiController.tasksData[i].isImportant, // Toggle importance
          property: property, // Pass the assigned property
          taskSteps: uiController.tasksData[i].taskSteps);

      print('Task checking - $task');
      print('Task checking - ${task.isImportant}');

      // Remove the task from tasksData and insert the new one
      uiController.tasksData.removeAt(i);
      uiController.tasksData.insert(i, task);

      // Reset the importance value
      uiController.tempIsImportantValue.value = false;

      break; // Exit after updating the task
    }
  }
}
