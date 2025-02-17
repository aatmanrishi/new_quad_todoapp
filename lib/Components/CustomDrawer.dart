import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/Components/AddList.dart';
import 'package:new_quad_todoapp/Components/AddListField.dart';
import 'package:new_quad_todoapp/Components/PieChart.dart';
import 'package:new_quad_todoapp/Components/TaskTile.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';
import 'DrawerProfileView.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();

    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: uiController.isDarkMode.value
            ? Color(0xFF2C2C2C)
            : Colors.green[50],
        child: ListView(
          children: [
            DrawerProfileView(),
            Obx(() {
              return Container(
                color: uiController.isDarkMode.value
                    ? Color(0xFF232323)
                    : Colors.white,
                child: Column(
                  children: [
                    for (var task in uiController.taskArray.asMap().entries)
                      TaskTile(
                        tTitle: task.value["task"],
                        icon: task.value["icon"],
                        index: task.key,
                      ),
                  ],
                ),
              );
            }),
            AddList(),
            Obx(() {
              return uiController.isAddListClicked.value
                  ? AddListField()
                  : SizedBox();
            }),
            SizedBox(
              height: 15,
            ),
            Obx(() {
              return uiController.completeData.isNotEmpty ||
                      uiController.tasksData.isNotEmpty
                  ? YourPieChart()
                  : SizedBox();
            }),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: uiController.isDarkMode.value == false
                        ? Colors.green[50]
                        : Color(0xFF2C2C2C),
                    height: 30,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
