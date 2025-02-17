import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

import '../UiController/taskStructure.dart';

final uiController = Get.find<Uicontroller>();
void changePriorityFunction(String uiId) {
  print('Inside ChangePriority Function');

  for (int i = 0; i < uiController.completeData.length; i++) {
    if (uiController.completeData[i].uiId == uiId) {
      var task = Task(
          uiId: uiController.completeData[i].uiId,
          taskHeading: uiController.completeData[i].taskHeading,
          taskDetails: uiController.completeData[i].taskDetails,
          timeSavedAt: uiController.completeData[i].timeSavedAt,
          taskStaus: uiController.completeData[i].taskStaus,
          calendarDate: uiController.completeData[i].calendarDate,
          reminderTime: uiController.completeData[i].reminderTime,
          taskDaysRepeated: uiController.completeData[i].taskDaysRepeated,
          isImportant: !uiController
              .tempIsImportantValue.value, // Toggle the importance (boolean)
          taskSteps: uiController.completeData[i].taskSteps);
      uiController.completeData.removeAt(i);
      print('Replaced task at index $i in completeData');
      uiController.completeData.insert(i, task);
      uiController.tempUiId.value = '';
      uiController.tempUiIdAssociatedStaus.value = '';
      uiController.tempIsImportantValue.value = false;
      break; // Exit after finding the task
    }
  }

  // Iterate through the tasksData list to find and update the task
  for (int i = 0; i < uiController.tasksData.length; i++) {
    if (uiController.tasksData[i].uiId == uiId) {
      String? property;
      if (uiController.taskIndex.value > 3) {
        try {
          String key = uiController.taskArray[uiController.taskIndex.value].keys
              .toList()[1];
          property = uiController.taskArray[uiController.taskIndex.value][key];
          print('Setting property for task: $property');
        } catch (e) {
          print('Error while setting property: $e');
        }

        // Toggle the importance here as well
        var task = Task(
            uiId: uiController.tasksData[i].uiId,
            taskHeading: uiController.tasksData[i].taskHeading,
            taskDetails: uiController.tasksData[i].taskDetails,
            timeSavedAt: uiController.tasksData[i].timeSavedAt,
            taskStaus: uiController.tasksData[i].taskStaus,
            calendarDate: uiController.tasksData[i].calendarDate,
            reminderTime: uiController.tasksData[i].reminderTime,
            taskDaysRepeated: uiController.tasksData[i].taskDaysRepeated,
            isImportant: !uiController
                .tempIsImportantValue.value, // Toggle the importance (boolean)
            property: property,
            taskSteps: uiController.completeData[i].taskSteps);
        print('Checking that if value is changing or not? ${task.isImportant}');
        uiController.tasksData.removeAt(i);
        print('Replaced task at index $i in tasksData');
        uiController.tasksData.insert(i, task);
        uiController.tempIsImportantValue.value = false;
        break; // Exit after finding the task
      }
    }
  }
}
