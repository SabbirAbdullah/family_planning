import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/values/url.dart';
import '../controllers/fwa_validation_controller.dart';

class FwaWork extends StatelessWidget {
  final FwaValidationController controller = Get.put(FwaValidationController());

  FwaWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("fwa_validation".tr)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("select_date".tr, style: titleTextBlue16),
                const SizedBox(width: 3),
                const Text(":", style: titleTextBlue14),
                const SizedBox(width: 6),
                Obx(() => Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        controller.selectedDate.value,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )),
                const SizedBox(width: 6),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.appColor,
                    ),
                    onPressed: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        String formattedDate =
                        DateFormat("yyyy-MM-dd").format(picked);
                        controller.updateDate(formattedDate);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.workList.isEmpty) {
                return const Center(child: Text("No data found"));
              }

              final allWorkData =
              controller.workList.expand((e) => e.workData).toList();
              final groupedWorkData = groupBy(allWorkData, (e) => e.workId);

              return ListView(
                children: groupedWorkData.entries.map((entry) {
                  final workId = entry.key;
                  final workItems = entry.value;
                  final workItem = workItems[0];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(

                            actionsPadding: const EdgeInsets.all(8),
                            actionsAlignment: MainAxisAlignment.end,
                            contentPadding: const EdgeInsets.all(20),
                            insetPadding: const EdgeInsets.all(25),
                            backgroundColor: Colors.white,
                            content: SizedBox(
                              width: double.maxFinite,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: workItems.map((item) {
                                    final isImage = item.workFieldType == "image";
                                    final imagePath = item.value.split("/").last;
                                    final imageUrl =
                                        "${AppUrl.imageUrl}/$imagePath";

                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(item.workField,
                                              style: titleTextBlue16),
                                          const SizedBox(height: 8),
                                          isImage
                                              ? Image.network(
                                            imageUrl,
                                            height: 150,
                                            width: 100,
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) =>
                                            const Text(
                                                "Failed to load image"),
                                          )
                                              : Text(item.value,
                                              style: cardTextStyle14_500),
                                          const SizedBox(height: 12),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildActionButton(
                                    label: "ভেরিফাইড",
                                    icon: 'assets/images/verified.png',
                                    color: const Color(0xff3B72FF),
                                    bgColor: const Color(0xffE5EDFF),
                                    onPressed: () {
                                      controller.updateWorkStatus(workId, "verified");
                                      Navigator.pop(context);
                                    },
                                  ),
                                  _buildActionButton(
                                    label: "তথ্য ভুল",
                                    icon: 'assets/images/cross.png',
                                    color: const Color(0xffFF4747),
                                    bgColor: const Color(0xffFFE7E7),
                                    onPressed: () {
                                      controller.updateWorkStatus(workId, "rejected");
                                      Navigator.pop(context);
                                    },
                                  ),
                                  _buildActionButton(
                                    label: "বাতিল",
                                    icon: null,
                                    color: Colors.black87,
                                    bgColor: const Color(0xffdedede),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.appColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                "$workId",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8),
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
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(workItem.workType,
                                            style: grayTitleText14_600),
                                        Text(
                                          controller.workList[0].designationName,
                                          style: grayTitleText14_500,
                                        ),
                                      ],
                                    ),
                                    Text(controller.workList[0].name,
                                        style: grayTitleText14),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.selectedDate
                                              .toString()
                                              .split(' ')[0],
                                          style: titleTextBlue14,
                                        ),
                                        _buildStatusTag(workItem.status),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback onPressed,
    required Color color,
    required Color bgColor,
    String? icon,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        child: Row(
          children: [
            if (icon != null)
              Image.asset(icon, height: 16, width: 16),
            if (icon != null) const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTag(String status) {
    Color bgColor;
    Color textColor;
    String label;
    String iconPath;

    switch (status) {
      case "verified":
        bgColor = const Color(0xffE5EDFF);
        textColor = Colors.blue;
        label = "ভেরিফাইড";
        iconPath = 'assets/images/verified.png';
        break;
      case "rejected":
        bgColor = const Color(0xffFFE7E7);
        textColor = Colors.red;
        label = "তথ্য ভুল";
        iconPath = 'assets/images/cross.png';
        break;
      default:
        bgColor = const Color(0xFFeaeaea);
        textColor = Colors.grey;
        label = "পেন্ডিং";
        iconPath = 'assets/images/pending 1.png';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(iconPath, height: 16, width: 16),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
