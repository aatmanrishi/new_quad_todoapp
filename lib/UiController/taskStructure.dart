import 'package:flutter/material.dart';

class Task {
  String uiId;
  String taskHeading;
  String? taskDetails;
  DateTime timeSavedAt; // no touched while editing directly
  String taskStaus; //no touched while editing directly
  List<int>? taskDaysRepeated;
  DateTime? calendarDate;
  TimeOfDay? reminderTime;
  bool? isImportant;
  String? property;
  List<String>? taskSteps;

  Task(
      {required this.uiId,
      required this.taskHeading,
      this.taskDetails,
      this.taskDaysRepeated,
      this.calendarDate,
      this.reminderTime,
      this.taskSteps,
      this.property,
      required this.timeSavedAt,
      required this.taskStaus,
      this.isImportant});
}
