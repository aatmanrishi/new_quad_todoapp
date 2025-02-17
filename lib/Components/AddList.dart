import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

class AddList extends StatelessWidget {
  const AddList({super.key});
  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    void addItemToList() {
      RxList<Map<String, dynamic>> tempArr = [
        {
          "icon": Icons.align_horizontal_left_sharp,
          "task": uiController.taskTileName.value.text
        }
      ].obs;
      if (uiController.taskTileName.value.text.isNotEmpty) {
        uiController.taskArray.add(tempArr[0]);

        uiController.taskTileName.value.clear();
        print('Item added to taskARRAY');
      } else {
        print('Task name is empty!');
      }
    }

    return Obx(() {
      return GestureDetector(
        onTap: () {
          if (uiController.isAddListClicked.value == true) {
            uiController.isAddListClicked.value = false;
            addItemToList();
          } else {
            uiController.isAddListClicked.value = true;
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 10),
          color: uiController.isAddListClicked.value == false
              ? uiController.isDarkMode.value
                  ? Color(0xFF232323)
                  : Colors.white
              : Colors.green[100],
          child: ListTile(
            leading: Icon(
              Icons.add,
              size: 40,
              color: uiController.isAddListClicked.value == false
                  ? uiController.isDarkMode.value
                      ? Colors.white
                      : Colors.black
                  : Colors.green[800],
            ),
            title: Text(
              "Add List",
              style: TextStyle(
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.bold,
                  color: uiController.isAddListClicked.value == false
                      ? uiController.isDarkMode.value
                          ? Colors.white
                          : Colors.black
                      : Colors.green[800]),
            ),
          ),
        ),
      );
    });
  }
}
