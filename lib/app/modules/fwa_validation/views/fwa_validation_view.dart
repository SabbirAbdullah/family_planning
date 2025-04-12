//
// import 'package:family_planning/app/core/values/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// import '../../../core/values/app_colors.dart';
// import '../../attendance_list/controllers/attendance_history_controller.dart';
// import '../widgets/attendance_verify_unit_view.dart';
//
//
// class AttendanceVerificationView extends StatelessWidget {
//   AttendanceVerificationView({super.key});
//   final AttendanceHistoryController controller = Get.put(AttendanceHistoryController());
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: PreferredSize( preferredSize: Size.fromHeight(80),
//         child: Container(
//             decoration: const BoxDecoration(
//               color: AppColors.appColor, // Replace with your AppBar's background color
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(16),
//                 bottomRight: Radius.circular(16),
//               ),
//             ),
//             child: AppBar(
//               title:Text( "উপস্থিতি যাচাই"),toolbarHeight: 80,
//               scrolledUnderElevation: 0,
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//             )
//         ),
//       ),
//       body:
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Obx(() => Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade200,
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           onPressed: controller.previousDate,
//                           icon: Icon(Icons.arrow_back_ios, color: AppColors.appColor),
//                         ),
//                         Text(
//                           controller.formattedDate,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: controller.nextDate,
//                           icon: Icon(Icons.arrow_forward_ios, color: AppColors.appColor),
//                         ),
//                       ],
//                     ),
//                   )),
//                 ),
//                 const SizedBox(width: 8),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
//                   decoration:  BoxDecoration(
//                       color: Colors.white, // Replace with your AppBar's background color
//                       borderRadius: BorderRadius.circular(10)
//
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset('assets/images/filter.png',height: 25,width: 25,color: AppColors.appColor,),
//                   )
//                 ),
//               ],
//             ),
//             SizedBox(height: 12,),
//
//             Container(width: double.infinity,
//               decoration: BoxDecoration(color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),),
//               padding: EdgeInsets.all(16),
//               child: InkWell(
//                 onTap: (){
//                   Get.to(AttendanceVerifyUnitView());
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('পূর্ব হাটহাজারি ইউনিট',style: titleTextBlue16,),
//                     Icon(Icons.arrow_forward_ios,color: AppColors.appColor,size: 22,),
//
//                   ],
//                 ),
//               ) ,
//             ),
//             SizedBox(height: 8,),
//             Container(width: double.infinity,
//               decoration: BoxDecoration(color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),),
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('ফতেয়াবাদ ইউনিট',style: titleTextBlue16,),
//                   Icon(Icons.arrow_forward_ios,color: AppColors.appColor,size: 22,),
//
//                 ],
//               ) ,
//             ),
//
//
//             // Expanded(
//             //   child: SingleChildScrollView(
//             //     child: Column(
//             //       children: [
//             //         Container(
//             //           height: screenHeight*.1,
//             //           decoration: BoxDecoration(
//             //             color: Colors.white,
//             //             borderRadius: BorderRadius.circular(12),
//             //           ),
//             //           child: Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Container(
//             //                 width: 35,
//             //                 height: double.infinity,
//             //                 decoration: BoxDecoration(
//             //                   color: AppColors.appColor, // Blue color
//             //                   borderRadius: BorderRadius.only(
//             //                     topLeft: Radius.circular(12),
//             //                     bottomLeft: Radius.circular(12),
//             //                   ),
//             //                 ),
//             //                 child:Column(
//             //                   mainAxisAlignment: MainAxisAlignment.center,
//             //                   children: [
//             //                     Center(child: Padding(
//             //                       padding: const EdgeInsets.only(top: 0),
//             //                       child: Image.asset("assets/icons/image 1 copy 3.png",height: 20,width: 20,
//             //                         color: Colors.white,),
//             //                     ),),
//             //                   ],
//             //                 ) ,
//             //               ),
//             //
//             //               Expanded(
//             //                   child: Container(
//             //                     padding: EdgeInsets.all(8),
//             //                     decoration: BoxDecoration(
//             //                       color: Colors.white,
//             //                       borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
//             //                     ),
//             //                     child: Row(
//             //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //
//             //                       children: [
//             //                         Column(
//             //                           crossAxisAlignment: CrossAxisAlignment.start,
//             //
//             //                           children:  [
//             //                             Text(
//             //                                 "জামতলা, বাতেন বাড়ি",
//             //                                 style:grayTitleText14_600
//             //                             ),
//             //                             Text(
//             //                                 "দম্পতি নাম্বার-১২০৯১১২",
//             //                                 style: grayTitleText14
//             //                             ),
//             //                             Text(
//             //                                 "সময়- ০৯:২৫",
//             //                                 style: titleTextBlue14
//             //                             ),
//             //
//             //                           ],
//             //                         ),
//             //                         Column(
//             //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                           crossAxisAlignment: CrossAxisAlignment.end,
//             //                           children: [
//             //                             Text("১",style: grayTitleText18_500,),
//             //                             Obx(() =>  Container(
//             //                               padding:
//             //                               const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//             //                               decoration: BoxDecoration(
//             //                                 color: controller.isTimeCorrect.value
//             //                                     ? const Color(0xFFE0FBE8)
//             //                                     : const Color(0xFFFBE0E0),
//             //                                 borderRadius: BorderRadius.circular(8),
//             //                               ),
//             //                               child: Text(
//             //                                 controller.isTimeCorrect.value
//             //                                     ? "সঠিক সময় উপস্থিত"
//             //                                     : "সময় অমিল",
//             //                                 style: TextStyle(
//             //                                     color: controller.isTimeCorrect.value
//             //                                         ? const Color(0xFF2B9F64)
//             //                                         : const Color(0xFFB22222),
//             //                                     fontWeight: FontWeight.w500,fontSize: 12
//             //                                 ),
//             //                               ),
//             //                             ),)
//             //
//             //                           ],
//             //                         )
//             //                       ],
//             //                     ),
//             //
//             //                   )
//             //               )
//             //             ],
//             //           ),
//             //         ),
//             //         SizedBox(height: 12,),
//             //         Container(
//             //           height: screenHeight*.1,
//             //           decoration: BoxDecoration(
//             //             color: Colors.white,
//             //             borderRadius: BorderRadius.circular(12),
//             //           ),
//             //           child: Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Container(
//             //                 width: 35,
//             //                 height: double.infinity,
//             //                 decoration: BoxDecoration(
//             //                   color: AppColors.appColor, // Blue color
//             //                   borderRadius: BorderRadius.only(
//             //                     topLeft: Radius.circular(12),
//             //                     bottomLeft: Radius.circular(12),
//             //                   ),
//             //                 ),
//             //                 child:Column(
//             //                   mainAxisAlignment: MainAxisAlignment.center,
//             //                   children: [
//             //                     Center(child: Padding(
//             //                       padding: const EdgeInsets.only(top: 0),
//             //                       child: Image.asset("assets/icons/image 1 copy 3.png",height: 20,width: 20,
//             //                         color: Colors.white,),
//             //                     ),),
//             //                   ],
//             //                 ) ,
//             //               ),
//             //
//             //               Expanded(
//             //                   child: Container(
//             //                     padding: EdgeInsets.all(8),
//             //                     decoration: BoxDecoration(
//             //                       color: Colors.white,
//             //                       borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
//             //                     ),
//             //                     child: Row(
//             //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //
//             //                       children: [
//             //                         Column(
//             //                           crossAxisAlignment: CrossAxisAlignment.start,
//             //
//             //                           children:  [
//             //                             Text(
//             //                                 "জামতলা, বাতেন বাড়ি",
//             //                                 style:grayTitleText14_600
//             //                             ),
//             //                             Text(
//             //                                 "দম্পতি নাম্বার-১২০৯১১২",
//             //                                 style: grayTitleText14
//             //                             ),
//             //                             Text(
//             //                                 "সময়- ০৯:২৫",
//             //                                 style: titleTextBlue14
//             //                             ),
//             //
//             //                           ],
//             //                         ),
//             //                         Column(
//             //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                           crossAxisAlignment: CrossAxisAlignment.end,
//             //                           children: [
//             //                             Text("১",style: grayTitleText18_500,),
//             //
//             //
//             //                           ],
//             //                         )
//             //                       ],
//             //                     ),
//             //
//             //                   )
//             //               )
//             //             ],
//             //           ),
//             //         ),
//             //         SizedBox(height: 12,),
//             //         Container(
//             //           height: screenHeight*.1,
//             //           decoration: BoxDecoration(
//             //             color: Colors.white,
//             //             borderRadius: BorderRadius.circular(12),
//             //           ),
//             //           child: Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Container(
//             //                 width: 35,
//             //                 height: double.infinity,
//             //                 decoration: BoxDecoration(
//             //                   color: AppColors.appColor, // Blue color
//             //                   borderRadius: BorderRadius.only(
//             //                     topLeft: Radius.circular(12),
//             //                     bottomLeft: Radius.circular(12),
//             //                   ),
//             //                 ),
//             //                 child:Column(
//             //                   mainAxisAlignment: MainAxisAlignment.center,
//             //                   children: [
//             //                     Center(child: Padding(
//             //                       padding: const EdgeInsets.only(top: 0),
//             //                       child: Image.asset("assets/icons/image 1 copy 3.png",height: 20,width: 20,
//             //                         color: Colors.white,),
//             //                     ),),
//             //                   ],
//             //                 ) ,
//             //               ),
//             //
//             //               Expanded(
//             //                   child: Container(
//             //                     padding: EdgeInsets.all(8),
//             //                     decoration: BoxDecoration(
//             //                       color: Colors.white,
//             //                       borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
//             //                     ),
//             //                     child: Row(
//             //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //
//             //                       children: [
//             //                         Column(
//             //                           crossAxisAlignment: CrossAxisAlignment.start,
//             //
//             //                           children:  [
//             //                             Text(
//             //                                 "জামতলা, বাতেন বাড়ি",
//             //                                 style:grayTitleText14_600
//             //                             ),
//             //                             Text(
//             //                                 "দম্পতি নাম্বার-১২০৯১১২",
//             //                                 style: grayTitleText14
//             //                             ),
//             //                             Text(
//             //                                 "সময়- ০৯:২৫",
//             //                                 style: titleTextBlue14
//             //                             ),
//             //
//             //                           ],
//             //                         ),
//             //                         Column(
//             //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                           crossAxisAlignment: CrossAxisAlignment.end,
//             //                           children: [
//             //                             Text("১",style: grayTitleText18_500,),
//             //
//             //                             Obx(() =>  Container(
//             //                               padding:
//             //                               EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//             //                               decoration: BoxDecoration(
//             //                                 color: controller.isTimeCorrect.value
//             //                                     ?  Color(0xFFFBE0E0)
//             //                                     :Color(0xFFE0FBE8) ,
//             //                                 borderRadius: BorderRadius.circular(8),
//             //                               ),
//             //                               child: Text(
//             //                                 controller.isTimeCorrect.value
//             //                                     ?"অগ্রিম প্রস্থান"
//             //                                     : "সঠিক সময় প্রস্থান" ,
//             //                                 style: TextStyle(
//             //                                     color: controller.isTimeCorrect.value
//             //                                         ? const Color(0xffFF4747)
//             //                                         : const Color(0xFFB22222),
//             //                                     fontWeight: FontWeight.w500,fontSize: 12
//             //                                 ),
//             //                               ),
//             //                             ),)
//             //                           ],
//             //                         )
//             //                       ],
//             //                     ),
//             //
//             //                   )
//             //               )
//             //             ],
//             //           ),
//             //         ),
//             //         SizedBox(height: 12,),
//             //
//             //
//             //
//             //       ],
//             //     ),
//             //   ),
//             // )
//
//
//           ],
//         ),
//       ),
//
//
//     );
//   }
// }
