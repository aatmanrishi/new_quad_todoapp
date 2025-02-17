import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quad_todoapp/UiController/UiController.dart';

final uiController = Get.find<Uicontroller>();
List<Widget> AppBarTrailingIcons = [
  Obx(() {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search_outlined,
          color: uiController.isDarkMode.value == false
              ? Colors.black
              : Colors.white,
        ));
  }),
  uiController.screenWidth < 400
      ? SizedBox()
      : IconButton(
          onPressed: () {
            // Toggle grid view
            uiController.isGrid.value = !uiController.isGrid.value;
          },
          icon: Obx(() {
            return uiController.isGrid.value
                ? Icon(
                    Icons.density_medium_outlined,
                    color: uiController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  )
                : Icon(
                    Icons.grid_view_rounded,
                    color: uiController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  );
          }),
        ),
  IconButton(
    onPressed: () {
      // Toggle dark mode
      uiController.isDarkMode.value = !uiController.isDarkMode.value;
    },
    icon: Obx(() {
      return Icon(
        uiController.isDarkMode.value ? Icons.sunny : Icons.nights_stay_rounded,
        color: uiController.isDarkMode.value ? Colors.white : Colors.black,
      );
    }),
  ),
];

// class CustomPopupMenu extends StatelessWidget {
//   const CustomPopupMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final uiController = Get.find<Uicontroller>();

//     return PopupMenuButton<String>(

//       menuPadding: EdgeInsets.all(0),
//       padding: EdgeInsets.all(0),
//       icon: Icon(
//         Icons.more_vert,
//         color: uiController.isDarkMode.value ? Colors.white : Colors.black,
//       ),
//       onSelected: (value) {
//         if (value == 'gridToggle') {
//           uiController.isGrid.value = !uiController.isGrid.value;
//         } else if (value == 'darkModeToggle') {
//           uiController.isDarkMode.value = !uiController.isDarkMode.value;
//         }
//       },
//       itemBuilder: (context) => [
//         PopupMenuItem<String>(
//           value: 'gridToggle',
//           child: Row(
//             children: [
//               Obx(() {
//                 return uiController.isGrid.value
//                     ? Icon(
//                         Icons.density_medium_outlined,
//                         color: uiController.isDarkMode.value
//                             ? Colors.white
//                             : Colors.black,
//                       )
//                     : Icon(
//                         Icons.grid_view_rounded,
//                         color: uiController.isDarkMode.value
//                             ? Colors.white
//                             : Colors.black,
//                       );
//               }),
//               SizedBox(width: 10),
//               Text('Toggle Grid View'),
//             ],
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: 'darkModeToggle',
//           child: Row(
//             children: [
//               Icon(
//                 uiController.isDarkMode.value
//                     ? Icons.sunny
//                     : Icons.nights_stay_rounded,
//                 color:
//                     uiController.isDarkMode.value ? Colors.white : Colors.black,
//               ),
//               SizedBox(width: 10),
//               Text('Toggle Dark Mode'),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
