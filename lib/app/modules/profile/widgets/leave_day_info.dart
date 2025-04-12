import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../controllers/profile_controller.dart';

import 'package:intl/intl.dart';

// class LeaveDayInfo extends StatelessWidget {
//   final ProfileController controller = Get.put(ProfileController());
//
//
//   LeaveDayInfo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Leave History")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//
//
//             const SizedBox(height: 20),
//             Obx(() {
//               if (controller.isLoading.value) {
//                 return CircularProgressIndicator();
//               }
//               if (controller.leaves.isEmpty) {
//                 return Text("No leave found");
//               }
//               return Expanded(
//                 child: ListView.builder(
//                   itemCount: controller.leaves.length,
//                   itemBuilder: (_, index) {
//                     final leave = controller.leaves[index];
//                     return Card(
//                       child: ListTile(
//                         title: Text(leave.description),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'From ${DateFormat('yyyy-MM-dd').format(leave.startDate)} to ${DateFormat('yyyy-MM-dd').format(leave.endDate)}',
//                             ),
//                             Text('Status: ${leave.status}'),
//                             Image.network(
//                               "https://family-planning-server.mpairproject.xyz/uploads/${leave.image}",
//                               width: 100, // Set your desired width
//                               height: 100, // Set your desired height
//                               fit: BoxFit.cover,
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }

class LeaveDayInfo extends StatelessWidget {
  LeaveDayInfo({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors
                .appColor, // Replace with your AppBar's background color
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: AppBar(
            toolbarHeight: 80,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('leave_application'.tr),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16,top: 8),
            child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("application_date".tr + " :", style: titleTextBlue16),
                        Obx(() => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "${DateFormat('yyyy-MM-dd').format(controller.startDate.value)} - ${DateFormat('yyyy-MM-dd').format(controller.endDate.value)}",
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        )),
                        IconButton(
                          icon: const Icon(Icons.calendar_month_outlined),
                          color: AppColors.appColor,
                          onPressed: () => selectDateRange(context),
                          tooltip: 'Open date picker',
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: GestureDetector(
                    //         onTap: () => controller.pickDate(isStart: true),
                    //         child: Container(
                    //             decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.circular(10),
                    //               border:
                    //                   Border.all(color: AppColors.borderColor),
                    //             ),
                    //             padding: EdgeInsets.all(12.0),
                    //             child: Text(
                    //               controller.startDate.value
                    //                       ?.toString()
                    //                       .split(" ")
                    //                       .first ??
                    //                   "Select",
                    //               style: TextStyle(
                    //                   fontSize: 14, fontWeight: FontWeight.w500),
                    //             )),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.all(8.0),
                    //       child: Text("To", style: titleTextBlue14),
                    //     ),
                    //     Expanded(
                    //       child: GestureDetector(
                    //         onTap: () => controller.pickDate(isStart: false),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(10),
                    //             border: Border.all(color: AppColors.borderColor),
                    //           ),
                    //           padding: EdgeInsets.all(12.0),
                    //           child: Text(
                    //             controller.endDate.value
                    //                     ?.toString()
                    //                     .split(" ")
                    //                     .first ??
                    //                 "Select",
                    //             style: TextStyle(
                    //                 fontSize: 14, fontWeight: FontWeight.w500),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
          ),
          Obx((){
            if (controller.isLoading.value) {
              return CircularProgressIndicator();
            }
            if (controller.leaves.isEmpty) {
              return Text("No leave found");
            }
            return Expanded(
              child: ListView.builder(
                itemCount: controller.leaves.length,
                itemBuilder: (context, index) {
                  final leave = controller.leaves[index];

                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.appColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(padding: const EdgeInsets.all(4)),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "${DateFormat('yyyy-MM-dd').format(DateTime.parse(leave.startDate!))} - ${DateFormat('yyyy-MM-dd').format(DateTime.parse(leave.endDate!))}",
                                          style: grayTitleText14_600,
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () => controller.toggleAttachment(index),
                                          child: PopupMenuButton<String>(
                                            menuPadding: EdgeInsets.all(1),
                                            padding: EdgeInsets.all(1),color: AppColors.pageBackground,
                                            onSelected: (value) {
                                              if (value == 'attachment') {
                                                Get.dialog(
                                                  barrierColor: Colors.black87,
                                                  Dialog(
                                                    backgroundColor: Colors.transparent,
                                                    insetPadding: EdgeInsets.all(16),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(12),
                                                          child: Image.network(
                                                            "https://family-planning-server.mpairproject.xyz/uploads/${leave.image}",
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (_, __, ___) => const Center(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(24),
                                                                child: Text("Image not found", style: TextStyle(color: Colors.white)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: -10,
                                                          right: -10,
                                                          child: IconButton(
                                                              icon: const Icon(Icons.close, color: Colors.white, size: 24),
                                                              onPressed: () => Navigator.pop(context)
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                            itemBuilder: (context) => [
                                              const PopupMenuItem<String>(
                                                value: 'attachment',
                                                child: Text('See Attachment',style: titleTextStyle12,),
                                              ),
                                            ],
                                            icon:  Icon(Icons.more_vert_outlined, size: 20,),
                                          )

                                      ),
                                    ],
                                  ),

                                  /// ⬇️ Add description & See More toggle here
                                  Obx(() {
                                    final isExpanded = controller.expandedIndexes.contains(index);
                                    final showAttachment = controller.showAttachmentIndexes.contains(index);
                                    return Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: [
                                              Text(
                                                leave.description,
                                                maxLines: isExpanded ? null : 1,
                                                overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              if (leave.description.length > 50)
                                                GestureDetector(
                                                  onTap: () => controller.toggleExpand(index),
                                                  child: Text(
                                                    isExpanded ? 'See less' : 'See more',
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                          
                                            ],
                                          ),
                                        ),

                                      ],
                                    );
                                  }),


                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )

            );
          }),



          // Container(
          //   margin: EdgeInsets.all(16), // Adds spacing around the card
          //   decoration: BoxDecoration(
          //     color: AppColors.appColor, // White background
          //     borderRadius: BorderRadius.circular(12), // Rounded corners
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       // Blue line
          //       Container(
          //         padding: EdgeInsets.all(4),
          //       ),
          //       // Text Content
          //       Expanded(
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.only(
          //                 bottomRight: Radius.circular(12),
          //                 topRight: Radius.circular(12)),
          //           ),
          //           child: Padding(
          //             padding: EdgeInsets.all(12),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Flexible(
          //                       child: Text("জুলাই ১৬, ২০২৪", // Date text
          //                           style: grayTitleText14_600),
          //                     ),
          //                     Container(
          //                       padding: const EdgeInsets.symmetric(
          //                           vertical: 6, horizontal: 10),
          //                       decoration: BoxDecoration(
          //                         color: Color(0xffCEFFEA),
          //                         borderRadius: BorderRadius.circular(8),
          //                       ),
          //                       child: Row(
          //                         children: [
          //                           Icon(
          //                             Icons.check_circle,
          //                             color: Colors.green,
          //                             size: 18,
          //                           ),
          //                           SizedBox(
          //                             width: 4,
          //                           ),
          //                           Text(
          //                             "আবেদন করা হয়েছে",
          //                             style: TextStyle(
          //                               color: Color(0xff00BE57),
          //                               fontWeight: FontWeight.w500,
          //                               fontSize: 12,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //                 SizedBox(height: 8),
          //                 Text("অসুস্থতাজনিত ছুটি", // Leave title
          //                     style: grayTitleText14_500),
          //                 SizedBox(height: 4),
          //                 Row(
          //                   children: [
          //                     Flexible(
          //                       child: Text(
          //                         "জ্বরে আক্রান্ত হওয়ার কারণে ছুটির আবেদন ", // Leave description
          //                         style: TextStyle(
          //                           overflow: TextOverflow.ellipsis,
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.normal,
          //                           color: Colors.black54,
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.all(16), // Adds spacing around the card
          //   decoration: BoxDecoration(
          //     color: AppColors.appColor, // White background
          //     borderRadius: BorderRadius.circular(12), // Rounded corners
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       // Blue line
          //       Container(
          //         padding: EdgeInsets.all(4),
          //       ),
          //       // Text Content
          //       Expanded(
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.only(
          //                 bottomRight: Radius.circular(12),
          //                 topRight: Radius.circular(12)),
          //           ),
          //           child: Padding(
          //             padding: EdgeInsets.all(12),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Flexible(
          //                       child: Text("জুলাই ১৬, ২০২৪", // Date text
          //                           style: grayTitleText14_600),
          //                     ),
          //                     Container(
          //                       padding: const EdgeInsets.symmetric(
          //                           vertical: 6, horizontal: 10),
          //                       decoration: BoxDecoration(
          //                         color: Color(0xffFFE7E7),
          //                         borderRadius: BorderRadius.circular(8),
          //                       ),
          //                       child: Row(
          //                         children: [
          //                           Icon(
          //                             Icons.clear,
          //                             size: 18,
          //                             color: Colors.red,
          //                           ),
          //                           SizedBox(
          //                             width: 4,
          //                           ),
          //                           Text(
          //                             "আবেদন করা হয়েছে",
          //                             style: TextStyle(
          //                                 color: Color(0xffFF4747),
          //                                 fontWeight: FontWeight.w500,
          //                                 fontSize: 12),
          //                           ),
          //                         ],
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //                 SizedBox(height: 8),
          //                 Text("অসুস্থতাজনিত ছুটি", // Leave title
          //                     style: grayTitleText14_500),
          //                 SizedBox(height: 4),
          //                 Row(
          //                   children: [
          //                     Expanded(
          //                       child: Text(
          //                         "জ্বরে আক্রান্ত হওয়ার কারণে ছুটির আবেদন ", // Leave description
          //                         style: TextStyle(
          //                           overflow: TextOverflow.ellipsis,
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.normal,
          //                           color: Colors.black54,
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: CustomButton(text: 'নতুন আবেদন যোগ করুন', onPressed: (){Get.to(AddLeaveDayInfo());}),
          //   ),
        ],
      ),
    );
  }

  void selectDateRange(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Date Range'),
          content: SizedBox(
            height: 300,
            width: 300,
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.range,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  controller.startDate.value = args.value.startDate ?? DateTime.now();
                  controller.endDate.value = args.value.endDate ?? DateTime.now();
                }
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                  controller.fetchLeaves();
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

}

// class AddLeaveDayInfo extends StatelessWidget {
//   AddLeaveDayInfo({super.key});
//   final ProfileController controller = Get.put(ProfileController());
//   final TextEditingController textController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: Container(
//           decoration: const BoxDecoration(
//             color: AppColors.appColor, // Replace with your AppBar's background color
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(16),
//               bottomRight: Radius.circular(16),
//             ),
//           ),
//           child: AppBar(
//             toolbarHeight: 80,
//             scrolledUnderElevation: 0,
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             title: Text('leave_application'.tr),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('date'.tr, style: titleTextBlue14),
//             Obx(() => Container(
//               color: Colors.white,
//               child: TextFormField(
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.symmetric(
//                       vertical: 8, horizontal: 16),
//                   filled: true,
//                   fillColor: Colors.white,
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.borderColor),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.borderColor),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   prefixIcon: controller.selectedDate.value.isNotEmpty
//                       ? Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Text(controller.selectedDate.value),
//                   )
//                       : Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Text(
//                       'তারিখ নির্বাচন করুন',
//                       style: formFieldText18,
//                     ),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       Icons.calendar_month_outlined,
//                       color: AppColors.appColor,
//                     ),
//                     onPressed: () => controller.pickDate(context),
//                     tooltip: 'Open date picker',
//                   ),
//                 ),
//               ),
//             )),
//             SizedBox(height: 12,),
//             Text(
//               'leave_type'.tr,
//               style: titleTextBlue14,
//             ),
//
//             // Sub-dropdown for Community Clinic
//             Obx(() => DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.symmetric(
//                     vertical: 8, horizontal: 16),
//                 filled: true,
//                 fillColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: AppColors.borderColor),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: AppColors.borderColor),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               hint: Text('ছুটির ধরন নির্বাচন করুন'),style: formFieldText18,
//               value: controller.selectedMethod.value.isNotEmpty
//                   ? controller.selectedMethod.value
//                   : null,
//               items: controller.method
//                   .map((item) => DropdownMenuItem<String>(
//                 value: item,
//                 child: Text(item),
//               ))
//                   .toList(),
//               onChanged: (value) {
//                 if (value != null) {
//                   controller.setSelectedMethod(value);
//                 }
//               },
//             )),
//             SizedBox(height: 12,),
//             Text("leave_cz".tr,style: titleTextBlue14,),
//             SizedBox(height: 6,),
//             TextInputField(textController: textController,),
//             SizedBox(height: 12,),
//              CustomButton(text: 'ছুটির আবেদন জমা দিন', onPressed: (){}),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class TextInputField extends StatelessWidget {
//   final TextEditingController textController;
//
//   final int? maxLines;
//   final bool? readOnly;
//
//   const TextInputField({
//     Key? key,
//     required this.textController,
//     this.maxLines = 1, this.readOnly = false,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: TextField(
//             readOnly: readOnly!,
//             cursorColor: AppColors.appColor,cursorHeight: 20 ,
//             maxLines:maxLines ,
//             style: formFieldText18,
//             controller: textController,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.only(
//                   left: 16, right: 8, top: 8, bottom: 0),
//               filled: true,
//               fillColor: Colors.white,
//               focusedBorder: OutlineInputBorder(
//                 borderSide:
//                 BorderSide(color: AppColors.borderColor),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide:
//                 BorderSide(color: AppColors.borderColor),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               border: OutlineInputBorder(
//                 borderSide:
//                 BorderSide(color: AppColors.borderColor),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//         ),
//
//
//       ],
//     );
//   }
// }
