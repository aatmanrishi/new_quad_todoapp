import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:new_quad_todoapp/UiController/UiController.dart';

class WideButton extends StatelessWidget {
  final String title;
  final Color bgcolor;
  final Color tcolor;
  final double? cheight;
  final double? cwidth;
  final double? cfontsize;
  final VoidCallback onTap;
  const WideButton({
    super.key,
    required this.bgcolor,
    required this.tcolor,
    required this.onTap,
    this.cheight,
    this.cwidth,
    required this.title,
    this.cfontsize,
  });

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    return InkWell(
      onTap: () {
        if (uiController.taskHeading.value.text.isEmpty) {
          AlertInfo.show(
            icon: Icons.warning_amber_outlined,
            backgroundColor: Colors.yellow,
            iconColor: Colors.black,
            textColor: Colors.black,
            context: context,
            text: 'Please Enter Some Value',
          );
        } else {
          onTap();
        }
      },
      child: Container(
        width: cwidth == null ? 200 : cwidth,
        height: cheight == null ? 50 : cheight,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            '$title',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: cfontsize == null ? 18 : 16,
                color: tcolor,
                fontWeight: FontWeight.w700,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
