// import 'package:family_planning/app/core/values/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/values/app_colors.dart';
// import '../../attendance_list/controllers/attendance_history_controller.dart';
//
// class AttendanceVerifyUnitView extends StatelessWidget {
//   AttendanceVerifyUnitView({super.key});
//   final AttendanceHistoryController controller = Get.put(AttendanceHistoryController());
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
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
//                   child: GestureDetector(
//                     onTap: (){
//                       showFilterBottomSheet(context);
//                     },
//                     child: Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                 child: Image.asset('assets/images/filter.png',height: 25,width: 25,color: AppColors.appColor,),
//                                  ),
//                   )),
//               ],
//             ),
//             SizedBox(height: 12,),
//             Text('পূর্ব হাটহাজারি ইউনিট',style: titleTextBlue16,),
//             SizedBox(height: 12,),
//             Container(
//               height: screenHeight*.1,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 35,
//                     height: double.infinity,
//                     decoration: BoxDecoration(
//                       color: AppColors.appColor, // Blue color
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(12),
//                         bottomLeft: Radius.circular(12),
//                       ),
//                     ),
//                     child:Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(child: Padding(
//                           padding: const EdgeInsets.only(top: 0),
//                           child: Text('১',style: TextStyle(color: Colors.white,fontSize: 16),)
//                         ),),
//                       ],
//                     ) ,
//                   ),
//
//                   Expanded(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//
//                                 children:  [
//                                   Text(
//                                       "জামতলা, বাতেন বাড়ি",
//                                       style:grayTitleText14_600
//                                   ),
//                                   Text(
//                                       "দম্পতি নাম্বার-১২০৯১১২",
//                                       style: grayTitleText14
//                                   ),
//                                   Text(
//                                       "সময়- ০৯:২৫",
//                                       style: titleTextBlue14
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Container(
//                                   padding:
//                                   const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffE5EDFF),
//                                     borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomLeft: Radius.circular(8)),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Image.asset('assets/images/verified.png',height: 16,width: 16,),
//                                       SizedBox(width: 4,),
//                                       Text("ভেরিফাইড",
//                                         style: TextStyle(
//                                             color:  Color(0xff3B72FF),
//
//                                             fontWeight: FontWeight.w500,fontSize: 12
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 Obx(() =>  Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     padding:
//                                     const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//                                     decoration: BoxDecoration(
//                                       color: controller.isTimeCorrect.value
//                                           ? const Color(0xFFE0FBE8)
//                                           : const Color(0xFFFBE0E0),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Text(
//                                       controller.isTimeCorrect.value
//                                           ? "সঠিক সময় উপস্থিত"
//                                           : "সময় অমিল",
//                                       style: TextStyle(
//                                           color: controller.isTimeCorrect.value
//                                               ? const Color(0xFF2B9F64)
//                                               : const Color(0xFFB22222),
//                                           fontWeight: FontWeight.w500,fontSize: 12
//                                       ),
//                                     ),
//                                   ),
//                                 ),)
//
//                               ],
//                             )
//                           ],
//                         ),
//
//                       )
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 12,),
//             Container(
//               height: screenHeight*.1,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 35,
//                     height: double.infinity,
//                     decoration: BoxDecoration(
//                       color: AppColors.appColor, // Blue color
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(12),
//                         bottomLeft: Radius.circular(12),
//                       ),
//                     ),
//                     child:Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(child: Padding(
//                             padding: const EdgeInsets.only(top: 0),
//                             child: Text('২',style: TextStyle(color: Colors.white,fontSize: 16),)
//                         ),),
//                       ],
//                     ) ,
//                   ),
//
//                   Expanded(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//
//                                 children:  [
//                                   Text(
//                                       "জামতলা, বাতেন বাড়ি",
//                                       style:grayTitleText14_600
//                                   ),
//                                   Text(
//                                       "দম্পতি নাম্বার-১২০৯১১২",
//                                       style: grayTitleText14
//                                   ),
//                                   Text(
//                                       "সময়- ০৯:২৫",
//                                       style: titleTextBlue14
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Container(
//                                   padding:
//                                   const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffFFE7E7),
//                                     borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomLeft: Radius.circular(8)),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Image.asset('assets/images/cross.png',height: 16,width: 16,),
//                                       SizedBox(width: 4,),
//                                       Text("তথ্য ভুল", style: TextStyle(
//                                           color:  Color(0xffFF4747),
//                                           fontWeight: FontWeight.w500,fontSize: 12
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//
//                               ],
//                             )
//                           ],
//                         ),
//
//                       )
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 12,),
//
//             Container(
//               height: screenHeight*.1,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: GestureDetector(
//                 onTap: (){
//                   showDetailsDialog(context);
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 35,
//                       height: double.infinity,
//                       decoration: BoxDecoration(
//                         color: AppColors.appColor, // Blue color
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(12),
//                           bottomLeft: Radius.circular(12),
//                         ),
//                       ),
//                       child:Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Center(child: Padding(
//                               padding: const EdgeInsets.only(top: 0),
//                               child: Text('৩',style: TextStyle(color: Colors.white,fontSize: 16),)
//                           ),),
//                         ],
//                       ) ,
//                     ),
//
//                     Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//
//                                   children:  [
//                                     Text(
//                                         "জামতলা, বাতেন বাড়ি",
//                                         style:grayTitleText14_600
//                                     ),
//                                     Text(
//                                         "দম্পতি নাম্বার-১২০৯১১২",
//                                         style: grayTitleText14
//                                     ),
//                                     Text(
//                                         "সময়- ০৯:২৫",
//                                         style: titleTextBlue14
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Container(
//                                     padding:
//                                     const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFeaeaea),
//                                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),topRight: Radius.circular(8)),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Image.asset('assets/images/pending 1.png',height: 16,width: 16,),
//                                         SizedBox(width: 4,),
//                                         Text("পেন্ডিং",
//                                           style: TextStyle(
//                                               color:  Color(0xff848484),
//
//                                               fontWeight: FontWeight.w500,fontSize: 12
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//
//                         )
//                     )
//                   ],
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 12,),
//             Container(
//               height: screenHeight*.1,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 35,
//                     height: double.infinity,
//                     decoration: BoxDecoration(
//                       color: AppColors.appColor, // Blue color
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(12),
//                         bottomLeft: Radius.circular(12),
//                       ),
//                     ),
//                     child:Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(child: Padding(
//                             padding: const EdgeInsets.only(top: 0),
//                             child: Text('৪',style: TextStyle(color: Colors.white,fontSize: 16),)
//                         ),),
//                       ],
//                     ) ,
//                   ),
//
//                   Expanded(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//
//                                 children:  [
//                                   Text(
//                                       "জামতলা, বাতেন বাড়ি",
//                                       style:grayTitleText14_600
//                                   ),
//                                   Text(
//                                       "দম্পতি নাম্বার-১২০৯১১২",
//                                       style: grayTitleText14
//                                   ),
//                                   Text(
//                                       "সময়- ০৯:২৫",
//                                       style: titleTextBlue14
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Container(
//                                   padding:
//                                   const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffE5EDFF),
//                                     borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomLeft: Radius.circular(8)),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Image.asset('assets/images/verified.png',height: 16,width: 16,),
//                                       SizedBox(width: 4,),
//                                       Text("ভেরিফাইড",
//                                         style: TextStyle(
//                                             color:  Color(0xff3B72FF),
//
//                                             fontWeight: FontWeight.w500,fontSize: 12
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 Obx(() =>  Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     padding:
//                                     EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//                                     decoration: BoxDecoration(
//                                       color: controller.isTimeCorrect.value
//                                           ?  Color(0xFFFBE0E0)
//                                           :Color(0xFFE0FBE8) ,
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: Text(
//                                       controller.isTimeCorrect.value
//                                           ?"অগ্রিম প্রস্থান"
//                                           : "সঠিক সময় প্রস্থান" ,
//                                       style: TextStyle(
//                                           color: controller.isTimeCorrect.value
//                                               ? const Color(0xffFF4747)
//                                               : const Color(0xFFB22222),
//                                           fontWeight: FontWeight.w500,fontSize: 12
//                                       ),
//                                     ),
//                                   ),
//                                 ),)
//
//                               ],
//                             )
//                           ],
//                         ),
//
//                       )
//                   )
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//
//     );
//   }
// }
// void showDetailsDialog(BuildContext context  ) {
//   double screenHeight = MediaQuery.of(context).size.height;
//   double screenWidth = MediaQuery.of(context).size.width;
//   showDialog(
//     context: context,
//     builder: (context) {
//       return  AlertDialog(
//           titlePadding: EdgeInsets.all(8),
//         contentPadding: EdgeInsets.all(30),
//           insetPadding: EdgeInsets.all(16),
//
//           backgroundColor: Colors.white,
//           content: Container(
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//             child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Column( crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('work_type'.tr, style: titleTextBlue14),
//                               Text("পরিবার পরিদর্শন", style:grayTitleText14_500),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Column( crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('couple_num'.tr,style: titleTextBlue14,),
//                               Text("২০১৯১১১",style:grayTitleText14_500 ,),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Column( crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('couple_name'.tr, style: titleTextBlue14),
//                               Text("মাজুমা সুলতানা", style:grayTitleText14_500,),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Column( crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('husband_name'.tr,style: titleTextBlue14,),
//                               Text("আবুল বাশার",style:grayTitleText14_500 ,),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Column( crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('children_count'.tr, style: titleTextBlue14),
//                               Text("৩ ছেলে, ২ মেয়ে", style:grayTitleText14_500),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Column( crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('method_name'.tr,style: titleTextBlue14,),
//                               Text("খাবার বড়ি",style:grayTitleText14_500 ,),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Column( crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('map_address'.tr, style: titleTextBlue14),
//                         Text("xChIJAR7-O9Uwkcr_TbmNwK2x O9Uwkcr_TbmNwK2x", style:grayTitleText14_500),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Column( crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('mobile_number'.tr, style: titleTextBlue14),
//                         Text("০১৮১২-৩৭৯৬৪৩", style:grayTitleText14_500),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Column( crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('short_address'.tr, style: titleTextBlue14),
//                         Text("জগন্নাথ, বাটের বাড়ি", style:grayTitleText14_500),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//
//                     Column( crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('picture'.tr, style: titleTextBlue14),
//                         Container(child: Icon(Icons.person),height: 200,width: 150,color: Colors.grey.shade200,),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Column( crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('description'.tr, style: titleTextBlue14),
//                         Text("এই ফলাফলে জানামতেইয়ের প্রমাণ দেখা হয়েছে। কিছু জনসমাজের বাড়ি দেখা হয়েছে।", style:grayTitleText14_500),
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//           ),
//
//           actions: [
//             Row(mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Color(0xFFFBE0E0),
//
//                     borderRadius: BorderRadius.circular(8),),
//                   child: TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Row(
//                       children: [
//                         Image.asset('assets/images/cross.png',height: 16,width: 16,),
//                         SizedBox(width: 4,),
//                         Text('তথ্য ভুল',style: TextStyle(color: Color(0xffFF4747),fontSize: 14),),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 12,),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Color(0xffE5EDFF),
//
//                     borderRadius: BorderRadius.circular(8),),
//                   child: TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Row(
//                       children: [
//                         Image.asset('assets/images/verified.png',height: 16,width: 16,),
//                         SizedBox(width: 4,),
//                         Text('তথ্য সঠিক',style: TextStyle(color: Color(0xff3B72FF),fontSize: 12),),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//
//
//           ],
//         );
//     },
//   );
//   }
//
// void showFilterBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     showDragHandle: false,
//     enableDrag: true,isDismissible: true,
//     backgroundColor: Colors.white,
//     context: context,
//     isScrollControlled: true,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//     ),
//     builder: (BuildContext context) {
//       return Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 40,
//               height: 4,
//               margin: const EdgeInsets.only(bottom: 16),
//               decoration: BoxDecoration(
//                 color: Colors.grey, // Change this to your desired color
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//
//             const Text(
//               'ফিল্টার করুন', // "Filter" in Bangla
//               style: grayTitleText14_600
//             ),
//             const SizedBox(height: 16),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: const Text(
//                 'প্রতিবেদনের ধরন', // "Report Type" in Bangla
//                 style:titleTextBlue14,
//               ),
//             ),
//             const SizedBox(height: 8),
//             DropdownButtonFormField<String>(
//               items: ['বাছাই করুন'] // "Select" in Bangla
//                   .map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 // Handle selection
//               },
//               dropdownColor: Colors.white,
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 12),
//                 border: const OutlineInputBorder(),
//                 filled: true,
//                 fillColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: AppColors.borderColor),
//                   borderRadius:  BorderRadius.circular(10),
//                 ),
//                 enabledBorder:  OutlineInputBorder(
//                   borderSide: BorderSide(color: AppColors.borderColor),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
//               onPressed: () {
//                 // Handle apply filters
//                 Get.back(); // Close the bottom sheet
//               },
//               child:  Text('প্রয়োগ করুন',style: titleTextBlue16,), // "Apply" in Bangla
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }