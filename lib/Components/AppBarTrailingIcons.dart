import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

final uiController = Get.find<Uicontroller>();

List<Widget> AppBarTrailingIcons = [
  Obx(() {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search_outlined,
          color: uiController.isDarkMode.value == false
              ? Colors.black
              : Colors.white,
        ));
  }),
  // Replace screenWidth check with MediaQuery for dynamic screen width check
  Builder(
    builder: (context) {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth < 400
          ? SizedBox()
          : IconButton(
              onPressed: () {
                // Toggle grid view
                uiController.isGrid.value = !uiController.isGrid.value;
              },
              icon: Obx(() {
                return uiController.isGrid.value
                    ? Icon(
                        Icons.density_medium_outlined,
                        color: uiController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                      )
                    : Icon(
                        Icons.grid_view_rounded,
                        color: uiController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                      );
              }),
            );
    },
  ),
  IconButton(
    onPressed: () {
      // Toggle dark mode
      uiController.isDarkMode.value = !uiController.isDarkMode.value;
    },
    icon: Obx(() {
      return Icon(
        uiController.isDarkMode.value ? Icons.sunny : Icons.nights_stay_rounded,
        color: uiController.isDarkMode.value ? Colors.white : Colors.black,
      );
    }),
  ),
];
