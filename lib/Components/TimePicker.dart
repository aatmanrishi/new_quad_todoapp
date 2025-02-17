// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_quad_todoapp/UiController/UiController.dart';

// class myTimePicker extends StatelessWidget {
//   const myTimePicker({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final uiController = Get.find<Uicontroller>();
//     return Container(
//       margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//       width: MediaQuery.of(context).size.width,
//       child: Wrap(
//         runSpacing: 10,
//         children: [
//           _buildTimeField(uiController.rHrs, "Hr"),
//           _buildTimeField(uiController.rMins, "Min"),
//           _buildTimeField(uiController.rSec, "Sec"),
//           SizedBox(
//             width: 7,
//           ),
//           InkWell(onTap: () {
//             if (uiController.pm.isEmpty) {
//               uiController.pm.value = "pm";
//               uiController.am.value = "";
//             } else {
//               uiController.pm.value = "";
//             }
//           }, child: Obx(() {
//             return Container(
//               height: 50,
//               width: 50,
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 0.75,
//                     color: uiController.pm.value.isEmpty
//                         ? Colors.black
//                         : Colors.transparent),
//                 color: uiController.pm.value.isEmpty
//                     ? Colors.white
//                     : Colors.red[400],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   "pm",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: uiController.pm.value.isEmpty
//                         ? Colors.black
//                         : Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             );
//           })),
//           SizedBox(width: 7),
//           InkWell(onTap: () {
//             if (uiController.am.isEmpty) {
//               uiController.am.value = "am";
//               uiController.pm.value = "";
//             } else {
//               uiController.am.value = "";
//             }
//           }, child: Obx(() {
//             return Container(
//               height: 50,
//               width: 50,
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 0.75,
//                     color: uiController.am.value.isEmpty
//                         ? Colors.black
//                         : Colors.transparent),
//                 color: uiController.am.value.isEmpty
//                     ? Colors.white
//                     : Colors.red[400],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   "am",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: uiController.am.value.isEmpty
//                         ? Colors.black
//                         : Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             );
//           }))
//         ],
//       ),
//     );
//   }

//   Widget _buildTimeField(Rx<TextEditingController> controller, String label) {
//     return Container(
//       width: 140,
//       height: 60, // Keep a consistent height
//       child: Row(
//         crossAxisAlignment:
//             CrossAxisAlignment.center, // Align items vertically center
//         children: [
//           Container(
//             margin: const EdgeInsets.only(right: 7),
//             width: 75,
//             child: TextField(
//               controller: controller.value,
//               keyboardType: TextInputType.number,
//               maxLength: 2,
//               cursorColor: Colors.black,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16,
//               ),
//               decoration: InputDecoration(
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: const BorderSide(
//                     color: Colors.black,
//                     width: 0.5,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: const BorderSide(
//                     color: Colors.redAccent,
//                     width: 0.5,
//                   ),
//                 ),
//                 hintText: "00",
//                 hintStyle: const TextStyle(
//                   color: Colors.grey,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             // Center the container vertically
//             child: Container(
//               height: 50,
//               width: 50,
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 color: Colors.red[400],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ... (Your UiController code remains the same)
