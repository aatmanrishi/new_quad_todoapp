import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:new_quad_todoapp/Function/DeletItemFunctoin.dart';
import 'taskStructure.dart';
import 'package:uuid/uuid.dart';

class Uicontroller extends GetxController {
  late final double screenWidth;
  RxString tempUiId = ''.obs;
  RxString tempUiIdAssociatedStaus = ''.obs;

  RxBool isDarkMode = false.obs;
  RxBool isEdit = false.obs;
  RxBool isAddListClicked = false.obs;
  RxBool tempIsImportantValue = false.obs;
  RxBool isAddTaskStepsClicked = false.obs;

  // Data Storing Variables
  RxList<Map<String, dynamic>> taskArray = [
    {"icon": Icons.notes, "task": "All Task "},
    {"icon": Icons.calendar_month, "task": "Today"},
    {"icon": Icons.edit_note_sharp, "task": "Important"},
    {"icon": Icons.book, "task": "Planned"},
    {"icon": Icons.person, "task": "Assigned To Me "}
  ].obs;
  RxList tasksData = [].obs;

  RxList completeData = [].obs;

  // Index Variables
  RxInt taskIndex = 0.obs;
  List taskStatus = ["Pending", "Completed"];

  // Input Variables
  RxBool isGrid = false.obs;
  Rx<TextEditingController> taskHeading = TextEditingController().obs;
  Rx<TextEditingController> taskDetails = TextEditingController().obs;
  Rx<TextEditingController> taskTileName = TextEditingController().obs;
  var temptaskSteps =
      <TextEditingController>[].obs; // Rx list to store the steps
  var taskCalendarDate = Rxn<DateTime>();
  RxInt noSelectedDate = 0.obs;
  RxList<int> daysIndex = <int>[].obs;
  var reminderTime = Rxn<TimeOfDay>();

  //Ui ElementsControl Panes

  // Sheath Variables
  RxBool isBottomSheath = false.obs;
  RxBool isRightPanel = false.obs;
  RxInt taskStatusIndex = 0.obs;

  // Sheath Element Control Variables
  RxBool isCalendar = false.obs;
  RxBool isRepeat = false.obs; //Deals with days
  RxBool isReminder = false.obs; // Deals with current Days Time

  // Function to get task steps
  List<String> getTaskStepsData() {
    List<String> tasks = [];
    for (int i = 0; i < temptaskSteps.length; i++) {
      if (temptaskSteps[i].text.isNotEmpty) {
        tasks.add(temptaskSteps[i].text.toString());
      }
    }
    return tasks;
  }

  void createTask() {
    var uuid = Uuid();
    if (noSelectedDate.value == 1) {
      print("No selected Date $noSelectedDate");
    }

    // Create the task with the task steps
    var task = Task(
      uiId: uuid.v1(),
      taskHeading: taskHeading.value.text,
      taskDetails: taskDetails.value.text,
      timeSavedAt: DateTime.now(),
      taskStaus: taskStatus[0],
      calendarDate: taskCalendarDate.value,
      reminderTime: reminderTime.value,
      isImportant: false,
      taskSteps: getTaskStepsData(), // Corrected this line
      property: taskIndex.value > 3
          ? "${taskArray[taskIndex.value][taskArray[taskIndex.value].keys.toList()[1]]}"
          : null,
    );

    // If daysIndex has values, perform a deep copy, otherwise assign an empty list
    if (daysIndex.isNotEmpty) {
      task.taskDaysRepeated =
          List<int>.from(daysIndex); // Creates a new list with the same values
    } else {
      task.taskDaysRepeated =
          []; // If no days are selected, assign an empty list
    }

    tasksData.add(task);
    taskHeading.value.clear();
    taskDetails.value.clear();
    daysIndex.clear();
    temptaskSteps.clear();
    taskCalendarDate.value = null;
    noSelectedDate.value = 0;
    reminderTime.value = null;
    isRightPanel.value = false;
    isBottomSheath.value = false;

    // Closing ui Elements
    isCalendar.value = false;
    isRepeat.value = false;
    isReminder.value = false;
  }

  void toggleDaySelection(int dayIndex) {
    if (daysIndex.contains(dayIndex)) {
      daysIndex.remove(dayIndex);
    } else {
      daysIndex.add(dayIndex);
    }
  }
}
