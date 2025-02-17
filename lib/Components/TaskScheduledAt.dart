import 'package:flutter/material.dart';

class TaskScheduledAt extends StatelessWidget {
  const TaskScheduledAt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(Icons.calendar_month_outlined),
          Text("Scheduled At - "),
          Text("15,Aug,2001")
        ],
      ),
    );
  }
}
