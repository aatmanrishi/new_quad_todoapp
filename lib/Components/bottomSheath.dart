// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:new_quad_todoapp/Function/DeletItemFunctoin.dart';
import 'FinalForm.dart';

class BottomSheathComponent extends StatelessWidget {
  const BottomSheathComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: uiController.isDarkMode.value == false
              ? Colors.green[50]
              : Color(0xFF232323),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              offset: Offset(0,
                  -4), // Position the shadow above the container (top shadow)
              blurRadius: 8, // Blur radius for the shadow
              spreadRadius: 1, // Optional, use to increase shadow spread
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: SingleChildScrollView(
        child: FinalForm(),
      ),
    );
  }
}
