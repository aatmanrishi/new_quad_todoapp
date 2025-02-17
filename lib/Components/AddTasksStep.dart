import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

class AddTasksSteps extends StatelessWidget {
  const AddTasksSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();

    // Function to add a new TextEditingController at a valid index
    void addTextField(int index) {
      if (index < uiController.temptaskSteps.length) {
        uiController.temptaskSteps.insert(index + 1, TextEditingController());
      } else {
        uiController.temptaskSteps.add(TextEditingController());
      }
    }

    // Function to remove a TextEditingController
    void removeTextField(int index) {
      if (index >= 0 && index < uiController.temptaskSteps.length) {
        uiController.temptaskSteps.removeAt(index);
      }
    }

    return Column(
      children: [
        // Add Steps Button
        Container(
          color: uiController.isDarkMode.value == false
              ? Colors.green[100]
              : Color(0xFF2C2C2C),
          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: ListTile(
            onTap: () {
              uiController.isAddTaskStepsClicked.value = true;
              // Start by adding the first text field at index 0
              addTextField(0);
            },
            contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            leading: Icon(
              Icons.add,
              color: uiController.isDarkMode.value == false
                  ? Colors.black
                  : Colors.white,
            ),
            title: Text(
              "Add Steps",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: uiController.isDarkMode.value == false
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ),

        // Display the dynamic list of text fields
        Obx(() {
          return (uiController.temptaskSteps.isNotEmpty)
              ? Column(
                  children: [
                    for (int i = 0; i < uiController.temptaskSteps.length; i++)
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: uiController.temptaskSteps[i],
                                cursorColor:
                                    uiController.isDarkMode.value == false
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
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: uiController.isDarkMode.value
                                        ? Colors.green[100]!
                                        : Colors.black12,
                                  )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              uiController.isDarkMode.value ==
                                                      false
                                                  ? Colors.green[300]!
                                                  : Colors.grey[400]!)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2.5),
                                  hintText: "Enter Step ${i + 1}",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Outfit',
                                    color:
                                        uiController.isDarkMode.value == false
                                            ? Colors.black
                                            : Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),

                            // Delete Button for removing a text field
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                removeTextField(
                                    i); // Remove the text field at index `i`
                              },
                            ),

                            // Add Button for adding a new text field below the current one
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                addTextField(
                                    i); // Add a new text field below the current index
                              },
                            ),
                          ],
                        ),
                      ),
                  ],
                )
              : SizedBox();
        }),
      ],
    );
  }
}
