import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiController = Get.find<Uicontroller>();

    return Container(
      color: Colors.transparent, // Entire container background is transparent
      child: Column(
        children: [
          // Pick a date text with color based on dark mode
          Text(
            'Pick a date:',
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: uiController.isDarkMode.value
                  ? Colors.white // Dark mode text color
                  : Colors.black, // Light mode text color
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            DateTime? selectedDate = uiController.taskCalendarDate.value;
            // DateTime currentDate = DateTime.now(); // Get the current date

            return TableCalendar(
              firstDay: DateTime.now(), // Set the calendar to start from today
              lastDay: DateTime.utc(2030, 3, 14), // Future date limit
              focusedDay: selectedDate ??
                  DateTime.now(), // Focused day is either selected or today
              selectedDayPredicate: (day) {
                return isSameDay(
                    selectedDate, day); // Check if the day is selected
              },
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, focusedDay) {
                  // Custom builder for the selected day
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black, // Black circle for selected date
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${date.day}', // Display day of the month
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors
                            .green[800], // Dark green text inside selected date
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                todayBuilder: (context, date, focusedDay) {
                  // Custom builder for the current day (today)
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors
                          .green[400], // Dark green circle for today's date
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${date.day}', // Display day of the month
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.black, // Black text inside today's date
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                defaultBuilder: (context, date, focusedDay) {
                  // Builder for non-selected and non-today days
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Transparent background
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${date.day}', // Display day of the month
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: uiController.isDarkMode.value
                            ? Colors.green[
                                100] // Green color text for selectable dates in dark mode
                            : Colors.black, // Black text color in light mode
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              onDaySelected: (selectedDay, focusedDay) {
                // Update taskCalendarDate with the selected date when the user selects a day
                uiController.taskCalendarDate.value = DateTime.utc(
                  selectedDay.year,
                  selectedDay.month,
                  selectedDay.day,
                );
                uiController.noSelectedDate.value = 0; // Date is selected
              },
              onPageChanged: (focusedDay) {},
            );
          }),
          const SizedBox(height: 20),
          Obx(() {
            DateTime? selectedDate = uiController.taskCalendarDate.value;

            // Show the selected date or "None" if no date is selected
            return Text(
              'Selected Date: ${selectedDate?.toLocal().toString().split(' ')[0] ?? 'None'}',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: uiController.isDarkMode.value
                    ? Colors.white // Dark mode text color
                    : Colors.black, // Light mode text color
              ),
            );
          }),
        ],
      ),
    );
  }
}
