import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart'; // Import the intl package

import 'package:new_quad_todoapp/Components/ScheduledContainer.dart';
import 'package:new_quad_todoapp/Function/isImportantFunction.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

import '../Function/DeletItemFunctoin.dart';
import '../Function/PopUpMenuFunction.dart';
import '../Function/EditFunction.dart';

class TaskCard extends StatelessWidget {
  final String uiId;
  final String taskTitle;
  final String? taskDetails;
  final DateTime timeSavedAt;
  final String TaskStatus;
  final List<int> taskDaysRepeated;
  final DateTime? calendarDate;
  final TimeOfDay? reminderTime;
  final bool isImportant;
  final List<String> taskSteps;

  TaskCard(
      {super.key,
      required this.taskTitle,
      this.taskDetails,
      required this.timeSavedAt,
      required this.TaskStatus,
      required this.taskDaysRepeated,
      this.calendarDate,
      this.reminderTime,
      required this.uiId,
      required this.isImportant,
      required this.taskSteps});

  // Create a DateFormat instance for the yyyy-MM-dd format
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  // Helper function to format DateTime to yyyy-MM-dd
  String formatDate(DateTime? dateTime) {
    if (dateTime != null) {
      return dateFormat.format(dateTime);
    } else {
      return ''; // Return an empty string if the dateTime is null
    }
  }

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    print(taskSteps);
    // void setTaskStepsFromStrings(List<String> steps) {
    //   // Clear the current list of TextEditingControllers
    //   uiController.temptaskSteps.clear();

    //   // Iterate through the list of strings
    //   for (String step in steps) {
    //     // Add a new TextEditingController with the text set to the current step
    //     uiController.temptaskSteps.add(TextEditingController(text: step));
    //   }
    // }

    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: uiController.isDarkMode.value == false
              ? Colors.transparent
              : Color(0xFF232323),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: uiController.isDarkMode.value
                  ? Colors.transparent
                  : Colors.black,
              width: 0.5)),
      child: ExpansionTile(
        tilePadding: EdgeInsets.all(0),
        title: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
          decoration: BoxDecoration(),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      taskTitle.isEmpty
                          ? SizedBox()
                          : Text(
                              taskTitle.length > 12
                                  ? "${taskTitle.substring(0, 12)}..." // Add ellipsis if title is longer than 12 characters
                                  : "$taskTitle",
                              maxLines: 3,
                              style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: uiController.isDarkMode.value
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TaskStatus.isEmpty
                      ? SizedBox()
                      : Text(
                          "$TaskStatus",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontFamily: 'Outfit',
                          ),
                        ),
                ],
              ),
              // Spacer(),

              SizedBox(
                width: 30,
              ),
              Row(
                children: [
                  Obx(() {
                    return isImportant
                        ? InkWell(
                            onTap: () {
                              changePriorityFunction(uiId);
                            },
                            child: Icon(Icons.star, color: Colors.amber))
                        : InkWell(
                            onTap: () {
                              changePriorityFunction(uiId);
                            },
                            child: Icon(
                              Icons.star_border,
                              color: uiController.isDarkMode.value == false
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          );
                  }),
                  PopupMenuButton(
                      itemBuilder: (context) => [
                            PopupMenuItem(child: Text("Pending"), value: 0),
                            PopupMenuItem(child: Text("Complete"), value: 1),
                          ],
                      onSelected: (value) {
                        PopUpMenuFunction(value, uiId);
                      }),
                ],
              ),
            ],
          ),
        ),
        enableFeedback: false,
        showTrailingIcon: false,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      if (MediaQuery.of(context).size.width > 550) {
                        uiController.isRightPanel.value = true;
                      } else {
                        uiController.isBottomSheath.value = true;
                      }
                      initiateEditFunction(uiId);
                      // setTaskStepsFromStrings(taskSteps);
                    },
                    icon: Icon(
                      Icons.edit_document,
                      color: Colors.yellow[700],
                      size: 25,
                    )),
                SizedBox(
                  width: 2.5,
                ),
                IconButton(
                    onPressed: () {
                      DelteItemFunction(uiId);
                    },
                    icon: Icon(
                      Icons.delete_sweep_outlined,
                      color: Colors.red[400],
                      size: 25,
                    ))
              ],
            ),
          ),
          if (reminderTime != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: Colors.deepPurpleAccent,
                    size: 25,
                  ),
                  Text(
                    'Remind me at :',
                    style: TextStyle(
                        fontFamily: 'Outfit',
                        color: uiController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$reminderTime', // Format the calendarDate
                    style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.yellow[700],
                        fontSize: 16,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                ],
              ),
            ),

          // Check if calendarDate is null

          // If calendarDate is not null, format and display it
          if (calendarDate != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.blue,
                    size: 25,
                  ),
                  Text(
                    'Scheduled At :',
                    style: TextStyle(
                        fontFamily: 'Outfit',
                        color: uiController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$calendarDate', // Format the calendarDate
                    style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.yellow[700],
                        fontSize: 16,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                ],
              ),
            ),

          taskDaysRepeated.isEmpty
              ? SizedBox()
              : ScheduledContainer(
                  daysArray: taskDaysRepeated,
                  isFunctionEnabled: false,
                ),

          // Check if taskDetails is available
          taskDetails != null && taskDetails!.isNotEmpty
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 15),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "$taskDetails",
                        style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 15,
                            color: uiController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ))
              : SizedBox(),

          taskSteps.isEmpty
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          for (int i = 0; i < taskSteps.length; i++)
                            Text(
                              '➡️ ${taskSteps[i]}',
                              style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 15,
                                  color: uiController.isDarkMode.value
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                        ],
                      )
                    ],
                  ),
                ),

          // Check if timeSavedAt is available
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.blue,
                ),
                Text(
                  'Saved At :',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      color: uiController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w700,
                      textBaseline: TextBaseline.alphabetic),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  formatDate(timeSavedAt), // Format timeSavedAt
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'Outfit', color: Colors.green),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
