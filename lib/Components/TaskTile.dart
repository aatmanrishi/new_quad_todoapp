import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

class TaskTile extends StatelessWidget {
  final int index;
  final String tTitle;
  final IconData icon;
  const TaskTile(
      {super.key,
      required this.tTitle,
      required this.icon,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    return Obx(() {
      return GestureDetector(
        onTap: () {
          uiController.taskIndex.value = index;
        },
        child: Container(
          color: uiController.taskIndex.value == index
              ? Colors.green[100]
              : Colors.transparent,
          child: ListTile(
            // tileColor: uiController.taskIndex.value == index
            //     ? Colors.green[100]
            //     : Colors.white,
            // hoverColor: Colors.red[400],
            leading: Icon(
              icon,
              color: uiController.taskIndex.value == index
                  ? Colors.green[800]
                  : uiController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
            ),
            title: Text(
              "$tTitle",
              style: TextStyle(
                fontFamily: 'Outfit',
                color: uiController.taskIndex.value == index
                    ? Colors.green[800]
                    : uiController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    });
  }
}
