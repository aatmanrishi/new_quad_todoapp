import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

final uiController = Get.find<Uicontroller>();

PopUpMenuFunction(int itemvalue, String uiId) {
  print("UI ID: $uiId");

  if (itemvalue == 1) {
    print("When you select the complete option");

    // Find and add the task to completeData, then remove from tasksData
    for (int i = 0; i < uiController.tasksData.length; i++) {
      if (uiController.tasksData[i].uiId == uiId) {
        // Add the task to completeData
        print("Checking TaskStaus");
        uiController.tasksData[i].taskStaus =
            uiController.taskStatus[itemvalue];

        uiController.completeData.add(uiController.tasksData[i]);

        // Remove the task from tasksData
        uiController.tasksData.removeAt(i);

        break;
      }
    }
  } else if (itemvalue == 0) {
    print("When you select the pending option");

    // Find and add the task to tasksData, then remove from completeData
    for (int i = 0; i < uiController.completeData.length; i++) {
      if (uiController.completeData[i].uiId == uiId) {
        uiController.completeData[i].taskStaus =
            uiController.taskStatus[itemvalue];

        // Add the task back to tasksData
        uiController.tasksData.add(uiController.completeData[i]);

        // Remove the task from completeData
        uiController.completeData.removeAt(i);
        break;
      }
    }
  }

  // Print the updated data lengths
  print("Tasks Data Length: ${uiController.tasksData.length}");
  print("Complete Data Length: ${uiController.completeData.length}");
}
