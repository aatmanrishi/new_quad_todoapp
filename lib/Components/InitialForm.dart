import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/Components/WideButton.dart';
import 'package:new_quad_todoapp/Function/EditFunction.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

class InitialForm extends StatelessWidget {
  const InitialForm({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
      width: MediaQuery.of(context).size.width * 0.9,
      // height: 254,
      color: uiController.isDarkMode.value == false
          ? Colors.green[50]
          : Color(0xFF232323),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Heading
          Text(
            "Add Note📝",
            style: TextStyle(
              fontFamily: 'Outfit',
              color: uiController.isDarkMode.value == false
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          // Heading TextInput Field
          TextField(
            controller: uiController.taskHeading.value,
            onTap: () {
              if (uiController.screenWidth > 800) {
                uiController.isRightPanel.value = true;
              } else {
                uiController.isBottomSheath.value = true;
                print("Bottom Sheath appearance");
              }
            },
            cursorColor: uiController.isDarkMode.value == false
                ? Colors.black
                : Colors.white,
            style: TextStyle(
              fontFamily: 'Outfit',
              color: uiController.isDarkMode.value == false
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Add a Task",
              hintStyle: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
          // Button Rows
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Calendars
                  IconButton(
                      onPressed: () {
                        if (uiController.screenWidth > 800) {
                          if (uiController.isRightPanel.value == false) {
                            uiController.isRightPanel.value = true;
                          }
                        } else {
                          if (uiController.isBottomSheath.value == false) {
                            uiController.isBottomSheath.value = true;
                          }
                        }

                        if (uiController.isCalendar.value == false) {
                          uiController.isCalendar.value = true;
                        } else {
                          uiController.isCalendar.value = false;
                        }
                      },
                      icon: Icon(
                        Icons.calendar_month,
                        color: uiController.isDarkMode.value == false
                            ? Colors.black
                            : Colors.white,
                      )),

                  // Repeat
                  IconButton(
                      onPressed: () {
                        // if(uiController.isRightPanel.value)
                        if (uiController.isRepeat.value == false) {
                          uiController.isRepeat.value = true;
                        } else {
                          uiController.isRepeat.value = false;
                        }
                      },
                      icon: Icon(
                        Icons.loop_sharp,
                        color: uiController.isDarkMode.value == false
                            ? Colors.black
                            : Colors.white,
                      )),
                  // Reminder
                  IconButton(
                      onPressed: () {
                        if (uiController.screenWidth > 800) {
                          if (uiController.isRightPanel.value == false) {
                            uiController.isRightPanel.value = true;
                          }
                        } else {
                          if (uiController.isBottomSheath.value == false) {
                            uiController.isBottomSheath.value = true;
                          }
                        }
                        // if(uiController.isRightPanel.value)
                        if (uiController.isReminder.value == false) {
                          uiController.isReminder.value = true;
                        } else {
                          uiController.isReminder.value = false;
                        }
                      },
                      icon: Icon(Icons.timer_sharp,color: uiController.isDarkMode.value==false?Colors.black:Colors.white,)),
                ],
              ),
              // Add Button
              if (uiController.screenWidth >= 500)
                Obx(() {
                  return WideButton(
                    title: uiController.isEdit.value == false
                        ? "Add Note"
                        : "Update",
                    bgcolor: const Color.fromARGB(255, 65, 81, 66),
                    tcolor: Colors.green,
                    onTap: uiController.isEdit.value == false
                        ? uiController.createTask
                        : () {
                            // Assuming uiId is available from the context or logic
                            // Update this with your logic
                            finalEditFunction();
                          },
                    cwidth: 150,
                    cheight: 40,
                  );
                }),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          Divider(),
          if (uiController.screenWidth < 500)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WideButton(
                  cfontsize: 16,
                  title: uiController.isEdit.value == false
                      ? "Add Note"
                      : "Update",
                  bgcolor: const Color.fromARGB(255, 65, 81, 66),
                  tcolor: Colors.green,
                  onTap: uiController.isEdit.value == false
                      ? uiController.createTask
                      : () {
                          // Assuming uiId is available from the context or logic
                          // Update this with your logic
                          finalEditFunction();
                        },
                  cwidth: 120,
                  cheight: 40,
                ),
              ],
            )
        ],
      ),
    );
  }
}
