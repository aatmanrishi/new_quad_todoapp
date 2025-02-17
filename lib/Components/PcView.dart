import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/Components/RightSidePanel.dart';

import '../UiController/UiController.dart';
import 'ContentDisplaySection.dart';
import 'InitialForm.dart';

class PcView extends StatelessWidget {
  const PcView({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [InitialForm(), ContentDisplaySection()],
                  ),
                ),
              ),
            ),
            Obx(() {
              if (uiController.isRightPanel.value == true) {
                return RightSheathPanel(rHeight: 1);
              } else {
                return SizedBox();
              }
            }),
            SizedBox(
              width: 20,
            )
            // RightSheathPanel()
          ],
        ),
      ),
    );
  }
}
