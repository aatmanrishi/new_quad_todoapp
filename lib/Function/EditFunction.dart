import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

import '../UiController/taskStructure.dart';

final uiController = Get.find<Uicontroller>();

List<String> getTaskStepsData() {
  List<String> tasks = [];
  for (int i = 0; i < uiController.temptaskSteps.length; i++) {
    if (uiController.temptaskSteps[i].text.isNotEmpty) {
      tasks.add(uiController.temptaskSteps[i].text.toString());
    }
  }
  return tasks;
}

void initiateEditFunction(String uiId) {
  print('Here is the unique Id of object $uiId');
  uiController.isEdit.value = true;

  // Iterate through the completeData to find the matching task and copy data
  for (int i = 0; i < uiController.completeData.length; i++) {
    if (uiController.completeData[i].uiId == uiId) {
      uiController.tempUiId.value = uiId;
      uiController.taskHeading.value.text =
          uiController.completeData[i].taskHeading;
      uiController.taskDetails.value.text =
          uiController.completeData[i].taskDetails;
      uiController.daysIndex.value =
          uiController.completeData[i].taskDaysRepeated;
      uiController.taskCalendarDate.value =
          uiController.completeData[i].calendarDate;
      uiController.reminderTime.value =
          uiController.completeData[i].reminderTime;
      uiController.tempUiIdAssociatedStaus.value =
          uiController.completeData[i].taskStaus;
      uiController.tempIsImportantValue.value =
          uiController.completeData[i].isImportant;

      // Now, push each of the task steps into tempTask (temptaskSteps)
      uiController.temptaskSteps.clear(); // Clear previous steps
      for (var step in uiController.completeData[i].taskSteps) {
        uiController.temptaskSteps.add(TextEditingController(text: step));
      }
    }
  }

  // Repeat for tasksData if the task wasn't found in completeData
  for (int i = 0; i < uiController.tasksData.length; i++) {
    if (uiController.tasksData[i].uiId == uiId) {
      uiController.tempUiId.value = uiId;
      uiController.taskHeading.value.text =
          uiController.tasksData[i].taskHeading;
      uiController.taskDetails.value.text =
          uiController.tasksData[i].taskDetails;
      uiController.daysIndex.value = uiController.tasksData[i].taskDaysRepeated;
      uiController.taskCalendarDate.value =
          uiController.tasksData[i].calendarDate;
      uiController.reminderTime.value = uiController.tasksData[i].reminderTime;
      uiController.tempUiIdAssociatedStaus.value =
          uiController.tasksData[i].taskStaus;
      uiController.tempIsImportantValue.value =
          uiController.tasksData[i].isImportant;

      // Now, push each of the task steps into tempTask (temptaskSteps)
      uiController.temptaskSteps.clear(); // Clear previous steps
      for (var step in uiController.tasksData[i].taskSteps) {
        uiController.temptaskSteps.add(TextEditingController(text: step));
      }
    }
  }
}

void finalEditFunction() {
  // Get the task steps from tempTask (temptaskSteps)
  var taskSteps = getTaskStepsData();

  // Create a new Task object with updated information
  var task = Task(
    uiId: uiController.tempUiId.value,
    taskHeading: uiController.taskHeading.value.text,
    taskDetails: uiController.taskDetails.value.text,
    timeSavedAt: DateTime.now(),
    taskStaus: uiController.tempUiIdAssociatedStaus.value,
    calendarDate: uiController.taskCalendarDate.value,
    reminderTime: uiController.reminderTime.value,
    taskDaysRepeated: uiController.daysIndex,
    isImportant: uiController.tempIsImportantValue.value,
    taskSteps: taskSteps, // Updated taskSteps
  );

  // Update the task in completeData
  for (int i = 0; i < uiController.completeData.length; i++) {
    if (uiController.completeData[i].uiId == uiController.tempUiId.value) {
      print("Updating task in completeData");
      uiController.completeData.removeAt(i);
      uiController.completeData.insert(i, task);
      uiController.tempUiId.value = '';
      uiController.tempUiIdAssociatedStaus.value = '';
    }
  }

  // Update the task in tasksData
  for (int i = 0; i < uiController.tasksData.length; i++) {
    if (uiController.tasksData[i].uiId == uiController.tempUiId.value) {
      print("Updating task in tasksData");
      uiController.tasksData.removeAt(i);
      uiController.tasksData.insert(i, task);
      uiController.tempUiId.value = '';
      uiController.tempUiIdAssociatedStaus.value = '';
    }
  }

  // Clear the temp task data after finalizing the edit
  uiController.taskHeading.value.clear();
  uiController.taskDetails.value.clear();
  uiController.daysIndex.clear();
  uiController.taskCalendarDate.value = null;
  uiController.noSelectedDate.value = 0;
  uiController.reminderTime.value = null;
  uiController.isRightPanel.value = false;
  uiController.isBottomSheath.value = false;
  uiController.tempIsImportantValue.value = false;
  uiController.temptaskSteps.clear();

  // Closing UI elements
  uiController.isCalendar.value = false;
  uiController.isRepeat.value = false;
  uiController.isReminder.value = false;
  uiController.isEdit.value = false;
}
