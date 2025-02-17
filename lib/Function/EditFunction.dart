
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
  print('Here is the uniquie Id of object $uiId');
  uiController.isEdit.value = true;

  for (int i = 0; i < uiController.completeData.length; i++) {
    if (uiController.completeData[i].uiId == uiId) {
      //  Add values to fields of there data
      // Will edited item data to controllers from completeList
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
      uiController.tempIsImportantValue =
          uiController.completeData[i].isImportant.value;
      // uiController.temptaskSteps.value = uiController.completeData[i].taskSteps;
    }
  }

  //
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
      uiController.tempIsImportantValue =
          uiController.tasksData[i].isImportant.value;
      // uiController.temptaskSteps.value = uiX;
    }
  }
}

void finalEditFunction() {
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
    taskSteps: [],
  );
  for (int i = 0; i < uiController.completeData.length; i++) {
    if (uiController.completeData[i].uiId == uiController.tempUiId.value) {
      print("Every thing goin good");
      uiController.completeData.removeAt(i);
      uiController.completeData.insert(i, task);
      uiController.tempUiId.value = '';
      uiController.tempUiIdAssociatedStaus.value = '';
    }
  }

  for (int i = 0; i < uiController.tasksData.length; i++) {
    if (uiController.tasksData[i].uiId == uiController.tempUiId.value) {
      print("Everything going good");
      uiController.tasksData.removeAt(i);
      uiController.tasksData.insert(i, task);
      uiController.tempUiId.value = '';
      uiController.tempUiIdAssociatedStaus.value = '';
    }
  }

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
  // Closing ui ELements
  uiController.isCalendar.value = false;
  uiController.isRepeat.value = false;
  uiController.isReminder.value = false;
  uiController.isEdit.value = false;
}
