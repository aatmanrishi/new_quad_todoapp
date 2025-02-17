import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

class DetailsTextField extends StatelessWidget {
  const DetailsTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    return Obx(() {
      return Container(
        child: TextField(
          controller: uiController.taskDetails.value,
          maxLines: 15,
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
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: uiController.isDarkMode.value == false
                      ? Colors.black
                      : Colors.white,
                  
                  width: 2,
                )),
                
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: uiController.isDarkMode.value == false
                      ? Colors.black
                      : Colors.white,
                  width: 2,
                )),
            hintText: "Add Notes",
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
    });
  }
}
