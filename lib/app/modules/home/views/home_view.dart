import 'package:family_planning/app/core/values/custom_button.dart';
import 'package:family_planning/app/modules/attendance_list/views/attendance_list_view.dart';
import 'package:family_planning/app/modules/authentication/controllers/login_controller.dart';
import 'package:family_planning/app/modules/work_history/controllers/work_history_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../translate/translate.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/shimmer_loading.dart';
import '../../../core/values/text_styles.dart';
import '../../attendance_list/controllers/attendance_history_controller.dart';
import '../../attendance_submit/views/attendance_submit.dart';
import '../../fwa_validation/views/fwa_validation.dart';

import '../../leave_apply/views/leave_apply_view.dart';
import '../../notice/view/notice_page.dart';

import '../../work_history/views/work_history_view.dart';
import '../../work_submit/controller/work_controller.dart';
import '../../work_submit/view/work_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final LoginController userTypeController = Get.put(LoginController());
  final HomeController controller = Get.put(HomeController());
  final AttendanceHistoryController attendanceHistoryController =
      Get.put(AttendanceHistoryController());
  final WorkController workController = Get.put(WorkController());
  final WorkHistoryController workHistoryController =
  Get.put(WorkHistoryController());



  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;


    String getLocalizedMonthName(String dateStr) {
      final parts = dateStr.split('-'); // Expects '2025-04'
      if (parts.length == 2) {
        final monthKey = 'month_${parts[1]}';
        return monthKey.tr;
      }
      return '';
    }

    controller.fetchDashboard();
    workHistoryController.fetchHistory();
    workHistoryController.updateLatestWork();
    return Scaffold(
        backgroundColor: AppColors.pageBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
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
                toolbarHeight: 120,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title:  Obx(() {
                  if (controller.isLoading.value) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 18,
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 8),
                          ),
                          Container(
                            width: 150,
                            height: 21,
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 12),
                          ),
                          Row(
                            children: [
                              Container(width: 60, height: 13, color: Colors.white),
                              const SizedBox(width: 6),
                              const Icon(Icons.circle, color: Colors.white, size: 10),
                              const SizedBox(width: 6),
                              Container(width: 60, height: 13, color: Colors.white),
                              const SizedBox(width: 6),
                              const Icon(Icons.circle, color: Colors.white, size: 10),
                              const SizedBox(width: 6),
                              Container(width: 60, height: 13, color: Colors.white),
                            ],
                          ),
                        ],
                      ),
                    );
                  }

                  final user = controller.user.value;
                  if (user == null) {
                    return const Center(child: Text("No user data found"));
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "welcome".tr,
                        style: whiteTitleText18,
                      ),
                      Text(
                        " ${user.name}",
                        style: whiteTitleText21,
                      ),
                      Row(
                        children: [
                          Text("${user.designation}", style: whiteTitleText13),
                          const SizedBox(width: 6),
                          const Icon(Icons.circle, color: Colors.white, size: 10),
                          const SizedBox(width: 6),
                          Text("${user.unitName}", style: whiteTitleText13),
                          const SizedBox(width: 6),
                          const Icon(Icons.circle, color: Colors.white, size: 10),
                          const SizedBox(width: 6),
                          Text("${user.address}", style: whiteTitleText13),
                        ],
                      ),
                    ],
                  );
                }

            ),

    )
        ),),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            child: Container(
              color: AppColors.pageBackground,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientContainer,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      /************************************/
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///latest_work
                                Obx(() {
                                  if (workHistoryController.isLoading.value) {
                                    return  Center(
                                      child: ShimmerWidgets.shimmerCard(height: 60), // Show loader while fetching
                                    );
                                  } else if (workHistoryController.latestWork.value != null) {
                                    return  Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xffe1e7f7),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          // Use SizedBox instead of Spacer
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "${workHistoryController.latestWork.value!.workType}",
                                            style: titleTextBlue14,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            workHistoryController.latestWork.value!.date!.toLocal().toString().split(' ')[0],
                                            style: titleTextBlue14,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "latest_attendance".tr,
                                            style: grayTitleText14_600,
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xffe1e7f7),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "কোনো কাজ জমা দেওয়া হয়নি",
                                            style: titleTextBlue14,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "latest_attendance".tr,
                                            style: grayTitleText14_600,
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                }),




                                const SizedBox(
                                  height: 12,
                                ),

                                ///total_activities
                                Obx(() {
                                  if (controller.isLoading.value) {
                                    return  Center(
                                        child: ShimmerWidgets.shimmerCard(height: 60));
                                  }
                                  if (controller.dashboardData.isEmpty) {
                                    return const Center(
                                        child: Text('No Data Available'));
                                  }
                                  return Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffe1e7f7),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0, top: 8),
                                            child: Text(
                                              "${controller.dashboardData[0].totalWork}",
                                              style: grayTitleText24,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "total_activities".tr,
                                          style: grayTitleText14_600,
                                        ),
                                      ],
                                    ),
                                  );
                                }),


                                ///total_fwa
                                // Obx((){
                                //   return
                                //     userTypeController.userType == UserType.FPI
                                //
                        controller.user.value!.designation== "FPI"
                               ? Obx(() {
                                  if (controller.isLoading.value) {
                                    return  Center(
                                        child: ShimmerWidgets.shimmerCard(height: 60));
                                  }
                                  if (controller.dashboardData.isEmpty) {
                                    return const Center(
                                        child: Text('No Data Available'));
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xffe1e7f7),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Text(
                                                  '${controller.fwiData[0].totalPresent} / ${controller.fwiData[0].totalEmployee}',
                                                  style: grayTitleText24,
                                                ),
                                              )),
                                          Text(
                                            "total_fwa_attendance".tr,
                                            style: grayTitleText14_600,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                            : const SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ),
                        /////////////////////
                        const SizedBox(
                          width: 12,
                        ),
                        /////////////////////////////
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                //timely_attend
                                Obx(() {
                                  if (controller.isLoading.value) {
                                    return  Center(
                                        child: ShimmerWidgets.shimmerCard(height: 60));
                                  }
                                  if (controller.dashboardData.isEmpty) {
                                    return const Center(
                                        child: Text('No Data Available'));
                                  }
                                  return Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffe1e7f7),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, top: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "${controller.dashboardData[0].present}",
                                                    style: grayTitleText24,
                                                  ),
                                                  Text("${getLocalizedMonthName(controller.dashboardData[0].month)}", style: titleTextBlue16,)
                                                ],
                                              ),
                                            )),
                                        Text(
                                          'timely_attendance'.tr,
                                          style: grayTitleText14_600,
                                        ),

                                      ],
                                    ),
                                  );
                                }),

                                const SizedBox(
                                  height: 12,
                                ),

                                //late_attend
                                Obx(() {
                                  if (controller.isLoading.value) {
                                    return  Center(
                                        child:ShimmerWidgets.shimmerCard(height: 60));
                                  }
                                  if (controller.dashboardData.isEmpty) {
                                    return const Center(
                                        child: Text('No Data Available'));
                                  }
                                  return Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffe1e7f7),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, top: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    '${controller.dashboardData[0].todayLate}',
                                                    style: grayTitleText24,
                                                  ),
                                                  Text("${getLocalizedMonthName(controller.dashboardData[0].month)}", style: titleTextBlue16,)
                                                ],
                                              ),
                                            )),
                                        Text(
                                          "late_attendance".tr,
                                          style: grayTitleText14_600,
                                        ),
                                      ],
                                    ),
                                  );
                                })
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  ///////////////
                  const SizedBox(
                    height: 16,
                  ),
                   Text(
                    "regarding_attendance".tr,
                    style: titleTextBlue16,
                  ),
                  /////////////////////

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                ///new_attend
                                GestureDetector(
                                  onTap: () {
                                    attendanceHistoryController
                                        .fetchAttendance();
                                    // attendanceHistoryController.updateTodayAttendanceStatus();
                                    Get.to(() => AttendanceSubmit());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "submit_attendance".tr,
                                          style: titleTextBlue16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Image.asset(
                                                    "assets/images/attendance.png",
                                                    height: 50,
                                                    width: 50,
                                                  ),
                                                )),
                                            const Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Icon(
                                                    Icons.arrow_forward,
                                                    size: 20,color: Colors.grey,
                                                  ),
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),

                                ///visit shedule
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => WorkScreen());
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "activities".tr,
                                          style: titleTextBlue16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Image.asset(
                                                    'assets/images/work.png',
                                                    height: 50,
                                                    width: 50,
                                                  ),
                                                )),
                                            const Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Icon(
                                                    Icons.arrow_forward,
                                                    size: 20,color: Colors.grey,
                                                  ),
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),

                                ///fwa_validate
                                // Obx((){
                                //   return  userTypeController.userType == UserType.FPI
                                //       ?
                                // controller.user.value!.designation== "FPI"
                                //     ? Container(
                                //   padding: const EdgeInsets.all(8),
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(10),
                                //       color: Colors.white),
                                //   child: InkWell(
                                //     onTap: () {
                                //       // Get.to(AttendanceVerificationView());
                                //
                                //       Get.to(()=>FwaValidation());
                                //     },
                                //     child: Column(
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.start,
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.spaceBetween,
                                //       children: [
                                //         Text(
                                //           "validate_fwa".tr,
                                //           style: titleTextBlue16,
                                //         ),
                                //          Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             // Padding(
                                //             //   padding: const EdgeInsets.only(right: 8.0),
                                //             //   child: Image.asset("assets/images/image 6.png",height: 50,width: 50,),
                                //             // ),
                                //             Align(
                                //               alignment: Alignment.center,
                                //               // child:Image.asset(
                                //               //   "assets/images/validation.png",
                                //               //   height: 35,
                                //               //   width: 35,
                                //               // ),
                                //             ),
                                //             Align(
                                //                 alignment:
                                //                     Alignment.bottomRight,
                                //                 child: Padding(
                                //                   padding:
                                //                       EdgeInsets.only(
                                //                           right: 8.0),
                                //                   child: Icon(
                                //                     Icons.arrow_forward,
                                //                     size: 20,color: Colors.grey,
                                //                   ),
                                //                 ))
                                //           ],
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // )
                                //     : const SizedBox.shrink()
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                ///attend_history
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: InkWell(
                                    onTap: () {
                                    workHistoryController.fetchHistory();
                                      Get.to(() => AttendanceListView());
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "view_activities_history".tr,
                                          style: titleTextBlue16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Image.asset(
                                                    "assets/images/work history.png",
                                                    height: 50,
                                                    width: 50,
                                                  ),
                                                )),
                                            const Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Icon(
                                                    Icons.arrow_forward,
                                                    size: 20,color: Colors.grey,
                                                  ),
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                //notice
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => NoticesPage());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "notice".tr,
                                            style: titleTextBlue16,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Image.asset(
                                                        'assets/images/notice.png',
                                                        height: 50,
                                                        width: 50,
                                                      ))),
                                              const Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Icon(
                                                      Icons.arrow_forward,
                                                      size: 20,color: Colors.grey,
                                                    ),
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ////////////////////////
                  controller.user.value!.designation== "FPI"
                      ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                                            child: InkWell(
                        onTap: () {
                          // Get.to(AttendanceVerificationView());

                          Get.to(()=>FwaValidation());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "validate_fwa".tr,
                                style: titleTextBlue16,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(right: 8.0),
                              //   child: Image.asset("assets/images/image 6.png",height: 50,width: 50,),
                              // ),
                              Align(
                                alignment: Alignment.center,
                                // child:Image.asset(
                                //   "assets/images/validation.png",
                                //   height: 35,
                                //   width: 35,
                                // ),
                              ),
                              Align(
                                  alignment:
                                  Alignment.topRight,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(
                                        right: 8.0),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      size: 20,color: Colors.grey,
                                    ),
                                  ))


                            ],
                          ),
                        ),
                                            ),
                                          ),
                      )
                      : const SizedBox.shrink(),

                  //leave_day
                  // DottedBorder(child:Container(),color: AppColors.borderColor,strokeWidth: 1,strokeCap: StrokeCap.butt,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => LeaveApplyView());
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 16, bottom: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "apply_leave".tr,
                                  style: titleTextBlue16,
                                ),
                                Text(
                                  "submit_leave".tr,
                                  style: titleTextStyle12,
                                ),

                              ],
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Image.asset(
                                    "assets/images/leave.png",
                                    height: 60,
                                    width: 60,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        )



    );
  }
}
