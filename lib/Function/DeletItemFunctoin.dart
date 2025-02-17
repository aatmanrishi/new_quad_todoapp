import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

final uiController = Get.find<Uicontroller>();

void DelteItemFunction(String uiId) {
  // Remove from completeData if found
  for (int i = 0; i < uiController.completeData.length; i++) {
    if (uiController.completeData[i].uiId == uiId) {
      uiController.completeData.removeAt(i);
      print("Removed from completeData: $uiId");
      break; // Exit loop after item is found and removed
    }
  }

  // Remove from tasksData if found
  for (int i = 0; i < uiController.tasksData.length; i++) {
    if (uiController.tasksData[i].uiId == uiId) {
      uiController.tasksData.removeAt(i);
      print("Removed from tasksData: $uiId");
      break; // Exit loop after item is found and removed
    }
  }

  // Check if the item is not found in either list
  print("Deleted item with UI ID: $uiId");
}
