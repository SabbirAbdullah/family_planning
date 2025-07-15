// import 'package:family_planning/app/core/values/text_styles.dart';
// import 'package:family_planning/app/modules/home/controllers/home_controller.dart';
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import '../../../core/values/app_colors.dart';
// import '../../work_submit/controller/work_controller.dart';
// import '../controllers/attendance_history_controller.dart';
//
// class AttendanceListView extends StatelessWidget {
//   AttendanceListView({super.key});
//   final AttendanceHistoryController controller =
//       Get.put(AttendanceHistoryController());
//   final WorkController workController = Get.put(WorkController());
//   final HomeController homeController = Get.put(HomeController());
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: Container(
//             decoration: const BoxDecoration(
//               color: AppColors
//                   .appColor, // Replace with your AppBar's background color
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(16),
//                 bottomRight: Radius.circular(16),
//               ),
//             ),
//             child: AppBar(
//               title: Text("view_activities_history".tr),
//               toolbarHeight: 80,
//               scrolledUnderElevation: 0,
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//             )),
//       ),
//       body:  Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(() {
//                   if (controller.isLoading.value) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//
//                   if (workController.workList.isEmpty) {
//                     return const Center(
//                       child: Text(
//                         "No data found.",
//                         style: TextStyle(fontSize: 18, color: Colors.grey),
//                       ),
//                     );
//                   }
//                   return  ListView.builder(
//                           itemCount: workController.workList.length,
//                           itemBuilder: (context, index) {
//                             final work = workController.workList[index];
//                             return Container(
//                               margin: EdgeInsets.symmetric(vertical: 8),
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.appColor,
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(4.0),
//                                       child: Image.asset(
//                                         "assets/icons/image 1 copy 3.png",
//                                         height: 15,
//                                         width: 15,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     Expanded(
//                                         child: Container(
//                                       padding: const EdgeInsets.all(8),
//                                       decoration: const BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.only(
//                                             bottomRight: Radius.circular(12),
//                                             topRight: Radius.circular(12)),
//                                       ),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text("${work.workType}",
//                                                   style: grayTitleText14_600),
//                                               Text(
//                                                 "${work.workId}",
//                                                 style: grayTitleText18_500,
//                                               ),
//                                             ],
//                                           ),
//                                           Text("${work.name}", style: grayTitleText14),
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(work.date!.toLocal().toString().split(' ')[0],
//                                                       style: titleTextBlue14),
//                                               homeController.user.value!.designation== "FWA"
//                                                    ? Container(
//                                                       padding: const EdgeInsets.symmetric(
//                                                           vertical: 6, horizontal: 10),
//                                                       decoration: BoxDecoration(
//                                                         color: work.status == "pending"
//                                                             ? const Color(0xFFeaeaea)
//                                                             : work.status == "verified"
//                                                                 ? const Color(0xffE5EDFF)
//                                                                 : const Color(0xffFFE7E7),
//                                                         borderRadius: BorderRadius.circular(8),
//                                                       ),
//                                                       child: Row(
//                                                         children: [
//                                                           work.status == "pending"
//                                                               ? Image.asset('assets/images/pending 1.png',height: 16,width: 16,)
//                                                               : work.status == "verified"
//                                                               ?Image.asset('assets/images/verified.png',height: 16,width: 16,)
//                                                               : Image.asset('assets/images/cross.png',height: 16,width: 16,),
//                                                           const SizedBox(width: 4,),
//                                                           Text(
//                                                             work.status == "pending"
//                                                                 ? "পেন্ডিং"
//                                                                 : work.status == "verified"
//                                                                 ? "ভেরিফাইড"
//                                                                 : "তথ্য ভুল",
//                                                             style: TextStyle(
//                                                               color: work.status == "pending"
//                                                                   ? Colors.grey
//                                                                   : work.status == "verified"
//                                                                   ? Colors.blue
//                                                                   : Colors.red, // Choose appropriate colors
//                                                               fontWeight: FontWeight.w500,fontSize: 12 // Optional styling
//                                                             ),
//                                                           )
//
//
//
//
//                                                         ],
//                                                       ),
//                                                     )
//                                                   : SizedBox.shrink()
//
//
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ))
//                                   ],
//                                 ),
//                               );
//                           },
//                         );
//                 }),
//       ),
//
//
//
//         // Row(
//         //   children: [
//         //     Expanded(
//         //       child: Obx(() => Container(
//         //             padding:
//         //                 EdgeInsets.symmetric(horizontal: 20, vertical: 4),
//         //             decoration: BoxDecoration(
//         //               color: Colors.white,
//         //               borderRadius: BorderRadius.circular(12),
//         //               boxShadow: [
//         //                 BoxShadow(
//         //                   color: Colors.grey.shade200,
//         //                   spreadRadius: 2,
//         //                   blurRadius: 5,
//         //                 ),
//         //               ],
//         //             ),
//         //             child: Row(
//         //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //               children: [
//         //                 IconButton(
//         //                   onPressed: controller.previousDate,
//         //                   icon: Icon(Icons.arrow_back_ios,
//         //                       color: AppColors.appColor),
//         //                 ),
//         //                 Text(
//         //                   controller.formattedDate,
//         //                   style: TextStyle(
//         //                     fontSize: 18,
//         //                     fontWeight: FontWeight.w500,
//         //                     color: Colors.black87,
//         //                   ),
//         //                 ),
//         //                 IconButton(
//         //                   onPressed: controller.nextDate,
//         //                   icon: Icon(Icons.arrow_forward_ios,
//         //                       color: AppColors.appColor),
//         //                 ),
//         //               ],
//         //             ),
//         //           )),
//         //     ),
//         //     const SizedBox(width: 8),
//         //     Container(
//         //       padding: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
//         //       decoration: BoxDecoration(
//         //           color: Colors
//         //               .white, // Replace with your AppBar's background color
//         //           borderRadius: BorderRadius.circular(10)),
//         //       child: IconButton(
//         //         icon: Icon(
//         //           Icons.calendar_month_outlined,
//         //           color: AppColors.appColor,
//         //         ),
//         //         onPressed: () {
//         //
//         //         },
//         //         tooltip: 'Open date picker',
//         //       ),
//         //     ),
//         //   ],
//         // ),
//
//         // Container(
//         //   height: screenHeight*.1,
//         //   decoration: BoxDecoration(
//         //     color: Colors.white,
//         //     borderRadius: BorderRadius.circular(12),
//         //   ),
//         //   child: Row(
//         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //     children: [
//         //       Container(
//         //         width: 35,
//         //         height: double.infinity,
//         //         decoration: BoxDecoration(
//         //           color: AppColors.appColor, // Blue color
//         //           borderRadius: BorderRadius.only(
//         //             topLeft: Radius.circular(12),
//         //             bottomLeft: Radius.circular(12),
//         //           ),
//         //         ),
//         //         child:Column(
//         //           mainAxisAlignment: MainAxisAlignment.center,
//         //           children: [
//         //             Center(child: Padding(
//         //               padding: const EdgeInsets.only(top: 0),
//         //               child: Image.asset("assets/icons/image 1 copy 3.png",height: 20,width: 20,
//         //                 color: Colors.white,),
//         //             ),),
//         //           ],
//         //         ) ,
//         //       ),
//         //
//         //       Expanded(
//         //           child: Container(
//         //             padding: EdgeInsets.all(8),
//         //             decoration: BoxDecoration(
//         //               color: Colors.white,
//         //               borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
//         //             ),
//         //             child: Row(
//         //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //
//         //               children: [
//         //                 Column(
//         //                   crossAxisAlignment: CrossAxisAlignment.start,
//         //
//         //                   children:  [
//         //                     Text(
//         //                         "জামতলা, বাতেন বাড়ি",
//         //                         style:grayTitleText14_600
//         //                     ),
//         //                     Text(
//         //                         "দম্পতি নাম্বার-১২০৯১১২",
//         //                         style: grayTitleText14
//         //                     ),
//         //                     Text(
//         //                         "সময়- ০৯:২৫",
//         //                         style: titleTextBlue14
//         //                     ),
//         //
//         //                   ],
//         //                 ),
//         //                 Column(
//         //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //                   crossAxisAlignment: CrossAxisAlignment.end,
//         //                   children: [
//         //                     Text("১",style: grayTitleText18_500,),
//         //
//         //                     Obx(() =>  Container(
//         //                       padding:
//         //                       EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//         //                       decoration: BoxDecoration(
//         //                         color: controller.isTimeCorrect.value
//         //                             ?  Color(0xFFFBE0E0)
//         //                             :Color(0xFFE0FBE8) ,
//         //                         borderRadius: BorderRadius.circular(8),
//         //                       ),
//         //                       child: Text(
//         //                         controller.isTimeCorrect.value
//         //                             ?"অগ্রিম প্রস্থান"
//         //                             : "সঠিক সময় প্রস্থান" ,
//         //                         style: TextStyle(
//         //                             color: controller.isTimeCorrect.value
//         //                                 ? const Color(0xffFF4747)
//         //                                 : const Color(0xFFB22222),
//         //                             fontWeight: FontWeight.w500,fontSize: 12
//         //                         ),
//         //                       ),
//         //                     ),)
//         //                   ],
//         //                 )
//         //               ],
//         //             ),
//         //
//         //           )
//         //       )
//         //     ],
//         //   ),
//         // ),
//         // SizedBox(height: 12,),
//
//     );
//   }
// }
//
// class WorkView extends StatelessWidget {
//   final WorkController controller = Get.put(WorkController());
//
//    WorkView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Work List")),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         if (controller.workList.isEmpty) {
//           return const Center(
//             child: Text(
//               "No data found.",
//               style: TextStyle(fontSize: 18, color: Colors.grey),
//             ),
//           );
//         }
//
//         return ListView.builder(
//           itemCount: controller.workList.length,
//           itemBuilder: (context, index) {
//             final work = controller.workList[index];
//             return Card(
//               margin: const EdgeInsets.all(8),
//               child: ListTile(
//                 title: Text(work.name!),
//                 subtitle: Text(work.workType!),
//                 trailing: Column(
//                   children: [
//                     Text("${work.workId}"),
//                     Text(work.date!.toLocal().toString().split(' ')[0]),
//                   ],
//                 ),
//                 onTap: () {
//                   Get.to(() => WorkDetailPage(workInfo: work.workInfo));
//                 },
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
//
// class WorkDetailPage extends StatelessWidget {
//   final List workInfo;
//   const WorkDetailPage({super.key, required this.workInfo});
//
//   final String baseUrl =
//       "https://family-planning-server.mpairproject.xyz/uploads";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Work Details")),
//       body: ListView.builder(
//         itemCount: workInfo.length,
//         itemBuilder: (context, index) {
//           final field = workInfo[index];
//           // Check if the field is an image
//           if (field.fieldType == "image") {
//             // Extract file name from full path
//             final imagePath = field.value.split("/").last;
//             final imageUrl = "$baseUrl/$imagePath";
//             print(imageUrl);
//
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ListTile(title: Text(field.field)),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image.network(
//                     imageUrl,
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return const Text("Failed to load image");
//                     },
//                   ),
//                 ),
//               ],
//             );
//           }
//
//           // Show as text for other field types
//           return ListTile(
//             title: Text(field.field),
//             subtitle: Text(field.value),
//           );
//         },
//       ),
//     );
//   }
// }
