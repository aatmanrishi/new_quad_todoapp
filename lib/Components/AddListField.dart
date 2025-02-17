import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

class AddListField extends StatelessWidget {
  const AddListField({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon(Icons.arrow_drop_down_sharp),
          Obx(() {
            return Expanded(
              child: TextField(
                controller: uiController.taskTileName.value,
                onTap: () {},
                cursorColor: uiController.isDarkMode.value == false
                    ? Colors.black
                    : Colors.white,
                style: TextStyle(
                  fontFamily: 'Outfit',
                    color: uiController.isDarkMode.value == false
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: "List Name",
                  hintStyle: TextStyle(
                    fontFamily: 'Outfit',
                      color: uiController.isDarkMode.value == false
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
