import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/Components/DataDisplaySection.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

class ContentDisplaySection extends StatelessWidget {
  const ContentDisplaySection({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(uiController.screenWidth < 800 ? 20.0 : 20,
          20, uiController.screenWidth < 550 ? 20.0 : 60, 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [DataDisplaySection()],
        ),
      ),
    );
  }
}
