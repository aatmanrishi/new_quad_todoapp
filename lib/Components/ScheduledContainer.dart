import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

class ScheduledContainer extends StatelessWidget {
  final bool isFunctionEnabled;
  final List<int> daysArray;

  const ScheduledContainer({
    super.key,
    required this.daysArray,
    required this.isFunctionEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();
    final double screenWidth = uiController.screenWidth;

    // Adjusting layout based on screen width
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      // padding: const EdgeInsets.symmetric(),
      padding: EdgeInsets.only(left: 20),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        runSpacing: screenWidth > 800 ? 7 : 10,
        spacing: screenWidth > 800 ? 10 : 5,
        children: [
          // Create the day buttons directly inside the Wrap widget
          for (int index = 0; index < 7; index++)
            GestureDetector(
              onTap: () {
                if (isFunctionEnabled) {
                  uiController.toggleDaySelection(index);
                }
              },
              child: Obx(() {
                final dayLabel = ["S", "M", "T", "W", "T", "F", "S"][index];
                final isSelected = uiController.daysIndex.contains(index);

                return CircleAvatar(
                  radius: 21,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    backgroundColor:
                        _getDayButtonColor(uiController, index, isSelected),
                    radius: 20,
                    child: Text(
                      dayLabel,
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
        ],
      ),
    );
  }

  // Helper method for determining background color
  Color _getDayButtonColor(
      Uicontroller uiController, int dayIndex, bool isSelected) {
    if (daysArray.isEmpty) {
      return isSelected
          ? Colors.green
          : uiController.isDarkMode.value
              ? Colors.grey[200]!
              : Colors.green[100]!;
    } else {
      return daysArray.contains(dayIndex)
          ? Colors.green
          : uiController.isDarkMode.value
              ? Colors.grey[200]!
              : Colors.green[100]!;
    }
  }
}
