import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: 300,
      child: Text(
          'Flutter Plugin that enable users make Paystack payment with either Mobile Money or Card on the fly provided you use the secret key provided to you from Paystack'),
    );
  }
}
