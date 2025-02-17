// // task_step_input.dart

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_quad_todoapp/UiController/UiController.dart'; // Assuming you already have UiController

// class TaskStepInput extends StatelessWidget {
//   final Uicontroller uiController =
//       Get.find<Uicontroller>(); // Get the controller instance

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Button to add steps
//         Container(
//           color: uiController.isDarkMode.value == false
//               ? Colors.white
//               : Color(0xFF2C2C2C),
//           margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
//           child: ListTile(
//             onTap: () {},
//             contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 5),
//             leading: Icon(
//               Icons.add,
//               color: uiController.isDarkMode.value == false
//                   ? Colors.black
//                   : Colors.white,
//             ),
//             title: Text(
//               "Add Steps",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: uiController.isDarkMode.value == false
//                     ? Colors.black
//                     : Colors.white,
//               ),
//             ),
//           ),
//         ),

//         // Dynamically generate text fields for task steps
//         Obx(() {
//           return Column(
//             children: [
//               for (int i = 0; i < uiController.taskSteps.length; i++)
//                 Row(
//                   children: [
//                     // TextField for task step input
//                     Expanded(
//                       child: TextField(
//                         controller: TextEditingController(
//                             text: uiController.taskSteps[i]),
//                         decoration: InputDecoration(
//                           hintText: 'Add step',
//                           contentPadding:
//                               EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                         ),
//                         onChanged: (value) {
//                           // Update the taskStep value when user types
//                           uiController.taskSteps[i] = value;
//                         },
//                       ),
//                     ),
//                     // Delete button to remove the field
//                     IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () {
//                         // Remove this task step from the list
//                         uiController.taskSteps.removeAt(i);
//                       },
//                     ),
//                     // Add button to add a new text field below
//                     IconButton(
//                       icon: Icon(Icons.add),
//                       onPressed: () {
//                         // Add a new empty text field to the list
//                         uiController.taskSteps.add('');
//                       },
//                     ),
//                   ],
//                 ),
//             ],
//           );
//         }),


//       ],
//     );
//   }
// }
