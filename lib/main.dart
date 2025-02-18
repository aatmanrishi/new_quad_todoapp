import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/Pages/Home.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';
// import 'package:new_quad_todoapp/Pages/SignIn.dart';
// import 'package:new_quad_todoapp/splashScreen.dart';

void main() {
  Get.put(Uicontroller());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final uiController = Get.find<Uicontroller>();
    // uiController.screenWidth = MediaQuery.of(context).size.width;
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
