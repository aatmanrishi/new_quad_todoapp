import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/Components/AppBarTrailingIcons.dart';
import 'package:new_quad_todoapp/Components/CustomDrawer.dart';
import 'package:new_quad_todoapp/Components/MobileView.dart';
import 'package:new_quad_todoapp/Components/PcView.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a GlobalKey to control the Scaffold state
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final uiController = Get.find<Uicontroller>();

    return Obx(() {
      return Scaffold(
          backgroundColor: uiController.isDarkMode.value
              ? Color(0xFF2C2C2C) // Dark mode background
              : Colors.white, // Light mode background
          key: _scaffoldKey,
          drawer: CustomDrawer(),
          appBar: AppBar(
            backgroundColor: uiController.isDarkMode.value
                ? Color(0xFF2C2C2C) // Dark mode background
                : Colors.white, // Light mode background,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                size: 30,
                color:
                    uiController.isDarkMode.value ? Colors.white : Colors.black,
              ),
              onPressed: () {
                _scaffoldKey.currentState
                    ?.openDrawer(); // Trigger the opening of the drawer
              },
            ),
            title: Container(
              child: Row(
                children: [
                  Image.asset(
                    "assets/logomark.png",
                    height: uiController.screenWidth < 400 ? 30 : 50,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Todo App',
                    style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.green,
                        fontSize: uiController.screenWidth < 400 ? 20 : 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            actions: AppBarTrailingIcons,
          ),
          body: SingleChildScrollView(
            child: uiController.screenWidth <= 800 ? MobileView() : PcView(),
          ));
    });
  }
}
