import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

class DrawerProfileView extends StatelessWidget {
  const DrawerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              "assets/user.png",
            ),
            backgroundColor: Colors.yellow,
            radius: 75,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Rishabh Shukla",
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 24,
              color: uiController.isDarkMode.value == false
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
