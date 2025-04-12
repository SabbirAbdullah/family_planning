// import 'package:family_planning/app/modules/activities_form/controllers/fpi_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class ReusableAttendanceForm extends StatelessWidget {
//   final NewAttendanceFormController controller;
//
//   const ReusableAttendanceForm({Key? key, required this.controller})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Obx(
//             () => Column(
//           children: controller.fields
//               .where((field) => field.isVisible)
//               .map(
//                 (field) => Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: TextFormField(
//                 controller: field.controller,
//                 decoration: InputDecoration(
//                   labelText: field.label,
//                   hintText: field.hintText,
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: field.inputType,
//                 validator: field.isRequired
//                     ? (value) =>
//                 value == null || value.isEmpty ? 'Required' : null
//                     : null,
//               ),
//             ),
//           )
//               .toList(),
//         ),
//       ),
//     );
//   }
// }
