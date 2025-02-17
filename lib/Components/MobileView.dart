import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UiController/UiController.dart';
import 'ContentDisplaySection.dart';
import 'InitialForm.dart';
import 'bottomSheath.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Container(
            padding: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [InitialForm(), ContentDisplaySection()],
              ),
            ),
          ),
          Obx(() {
            if (uiController.isBottomSheath.value == true) {
              return Positioned(
                bottom: 80,
                left: 5,
                right: 5,
                child: BottomSheathComponent(),
              );
            } else {
              return SizedBox();
            }
          })
        ]),
      ),
    );
  }
}
