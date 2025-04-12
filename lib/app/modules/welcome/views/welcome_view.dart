// import 'package:family_planning/app/modules/authentication/controllers/login_controller.dart';
//
// import 'package:family_planning/app/modules/main/views/bottom_nav_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../usertype.dart';
//
// class WelcomeView extends StatelessWidget {
//   final LoginController loginController = Get.put(LoginController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Select User Type')),
//       body:ListView.builder(
//         itemCount: UserType.values.length,
//         itemBuilder: (context, index) {
//           final userType = UserType.values[index];
//           return ListTile(
//             title: Text(userType.name),
//             onTap: () async {
//               await loginController.setUserType(userType);
//               Get.off(() => BottomNavBar());
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
