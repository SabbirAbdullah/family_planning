import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../controllers/attendance_history_controller.dart';

class AttendanceHistoryPage extends StatelessWidget {
  final AttendanceHistoryController controller = Get.put(AttendanceHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('view_attendance_history'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Date Picker Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("select_date".tr, style: titleTextBlue16),
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
                  onPressed: () => controller.selectDateRange(context),
                  tooltip: 'Open date picker',
                ),
              ],
            ),

            const SizedBox(height: 8),
            // Attendance List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => _buildShimmerItem(),
                  );
                }

                if (controller.attendanceList.isEmpty) {
                  return Center(child: Text("No attendance records found.".tr));
                }

                return ListView.builder(
                  itemCount: controller.attendanceList.length,
                  itemBuilder: (context, index) {
                    final item = controller.attendanceList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.appColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/icons/image 1 copy 3.png",
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${item.location}", style: grayTitleText14_600),
                                    const SizedBox(height: 4),
                                    Text("${item.date?.toLocal().toString().split(' ')[0]}", style: grayTitleText14),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Time : ${item.inTime}", style: titleTextBlue14),
                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: item.type == "In"
                                                ? const Color(0xFFCEFFEA)
                                                : const Color(0xFFFFCECE),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            item.type == "In"?
                                            "প্রবেশ"
                                            :"প্রস্থান",
                                            style: TextStyle(
                                              color: item.type == "In"
                                                  ? const Color(0xFF00BE57)
                                                  : const Color(0xFFB22222),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Image.network(
                                    //   "https://family-planning-server.mpairproject.xyz/uploads/${item.image}",
                                    //   fit: BoxFit.contain,height: 50,
                                    // )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Shimmer item
  Widget _buildShimmerItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 90,
          width: double.infinity,
        ),
      ),
    );
  }
}
