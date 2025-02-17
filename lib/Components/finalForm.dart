import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:new_quad_todoapp/Components/AddStepsComponent.dart';
import 'package:new_quad_todoapp/Components/AddTasksStep.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';
import 'Calendar.dart';
import 'DetailTextField.dart';
import 'ScheduledContainer.dart';

class FinalForm extends StatelessWidget {
  const FinalForm({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    // Helper function to format TimeOfDay to 12-hour format with AM/PM
    String _formatTime(TimeOfDay timeOfDay) {
      final now = DateTime.now();
      final DateTime parsedTime = DateTime(
          now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
      return DateFormat.jm()
          .format(parsedTime); // This gives the 12-hour format with AM/PM
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(() {
          return TextField(
            controller: uiController.taskHeading.value,
            onTap: () {},
            cursorColor: uiController.isDarkMode.value == false
                ? Colors.black
                : Colors.white,
            style: TextStyle(
                fontFamily: 'Outfit',
                color: uiController.isDarkMode.value == false
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: uiController.isDarkMode.value == false
                        ? Colors.black
                        : Colors.white,
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: uiController.isDarkMode.value == false
                        ? Colors.black
                        : Colors.white,
                    width: 2,
                  )),
              hintText: "Add a Task",
              hintStyle: TextStyle(
                  fontFamily: 'Outfit',
                  color: uiController.isDarkMode.value == false
                      ? Colors.black
                      : const Color.fromARGB(255, 205, 205, 205),
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          );
        }),
        SizedBox(height: 5),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        SizedBox(height: 5),
// Calendar Tile
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 3),
          child: ListTile(
            onTap: () {
              if (uiController.isCalendar.value == true) {
                uiController.isCalendar.value = false;
              } else {
                uiController.isCalendar.value = true;
              }
            },
            contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            title: Text(
              "Calendar",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: uiController.isDarkMode.value == false
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_month_outlined,
                  color: uiController.isDarkMode.value == false
                      ? Colors.black
                      : Colors.white,
                )),
          ),
        ),
// Calendar Widget
        Obx(() {
          if (uiController.isCalendar == true) {
            return MyCalendar();
          } else {
            return SizedBox();
          }
        }),
        SizedBox(height: 5),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        SizedBox(height: 5),
// Days Repeat Tile
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 3),
          child: ListTile(
            onTap: () {
              if (uiController.isRepeat.value == false) {
                uiController.isRepeat.value = true;
              } else {
                uiController.isRepeat.value = false;
              }
            },
            contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            title: Text(
              "Repeat",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: uiController.isDarkMode.value == false
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.loop,
                  color: uiController.isDarkMode.value == false
                      ? Colors.black
                      : Colors.white,
                )),
          ),
        ),
        SizedBox(height: 5),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        SizedBox(height: 5),
// Days Repeat Widget/Scheduled Tile
        Obx(() {
          if (uiController.isRepeat.value == true) {
            return Container(
              child: ScheduledContainer(
                  daysArray: uiController.daysIndex, isFunctionEnabled: true),
            );
          } else {
            return SizedBox();
          }
        }),

// ReminderTile
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: ListTile(
            onTap: () async {
              if (uiController.isReminder.value == true) {
                // Show time picker
                var timepicker = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());

                if (timepicker == null) {
                  uiController.reminderTime.value = null;
                } else {
                  uiController.reminderTime.value = timepicker;
                }

                uiController.isReminder.value = false;
              } else {
                uiController.isReminder.value = true;
              }
            },
            contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            title: Text(
              "Reminder",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: uiController.isDarkMode.value == false
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            // Keep the icon on the trailing as requested
            trailing: Icon(
              Icons.av_timer_outlined,
              color: uiController.isDarkMode.value == false
                  ? Colors.black
                  : Colors.white,
            ),
            subtitleTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              fontFamily: 'Outfit',
            ),
            subtitle: Obx(() {
              // Format the reminder time into 12-hour format (e.g., 5:35 PM)
              if (uiController.reminderTime.value != null) {
                // Convert the TimeOfDay to 12-hour format with AM/PM
                final formattedTime =
                    _formatTime(uiController.reminderTime.value!);
                return Text(
                  formattedTime,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                );
              } else {
                return SizedBox(); // If no reminder is set, return empty space
              }
            }),
          ),
        ),

        SizedBox(height: 5),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),

        AddTasksSteps(),

        SizedBox(
          height: 5,
        ),
        DetailsTextField(),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.black,
          height: 2,
        ),

        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    if (uiController.screenWidth < 800) {
                      uiController.isBottomSheath.value = false;
                    } else {
                      uiController.isRightPanel.value = false;
                      print("Right Panel Removed");
                    }
                  },
                  icon: Icon(
                    Icons.close,
                    color: uiController.isDarkMode.value == false
                        ? Colors.black
                        : Colors.white,
                  )),
              Text("Create Today"),
              IconButton(
                  onPressed: () {
                    if (uiController.isEdit.value == true) {
                      uiController.isEdit.value = false;
                      if (uiController.screenWidth < 800) {
                        uiController.isBottomSheath.value = false;
                      } else {
                        uiController.isRightPanel.value = false;
                      }
                      // Logic to clear all data that was once to be edited or is present in any of input controller
                      uiController.taskHeading.value.clear();
                      uiController.taskDetails.value.clear();
                      uiController.daysIndex.clear();
                      uiController.taskCalendarDate.value = null;
                      uiController.noSelectedDate.value = 0;
                      uiController.reminderTime.value = null;
                      uiController.isRightPanel.value = false;
                      uiController.isBottomSheath.value = false;
                      // Closing ui ELements
                      uiController.isCalendar.value = false;
                      uiController.isRepeat.value = false;
                      uiController.isReminder.value = false;
                      uiController.isEdit.value = false;
                    }
                  },
                  icon: Icon(
                    Icons.delete_outline_outlined,
                    color: uiController.isDarkMode.value == false
                        ? Colors.black
                        : Colors.white,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
