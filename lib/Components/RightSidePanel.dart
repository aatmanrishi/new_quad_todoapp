import 'package:flutter/material.dart';
import 'package:new_quad_todoapp/Function/DeletItemFunctoin.dart';

import 'FinalForm.dart';

class RightSheathPanel extends StatelessWidget {
  final double rHeight;
  const RightSheathPanel({super.key, required this.rHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 15, 20),
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        // height: MediaQuery.of(context).size.height,
        width: 400,
        decoration: BoxDecoration(
            color: uiController.isDarkMode.value == false
                ? Colors.green[50]
                : Color(0xFF232323) // This is equivalent to rgba(44, 44, 44, 1)
            ,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
        child: SingleChildScrollView(
          child: FinalForm(),
        ),
      ),
    );
  }
}
