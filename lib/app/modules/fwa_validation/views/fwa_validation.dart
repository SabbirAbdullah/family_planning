import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/values/url.dart';
import '../../../data/model/fwa_validation_model.dart';
import '../controllers/fwa_validation_controller.dart';
import 'fwa_work.dart';

class FwaValidation extends StatelessWidget  {
  FwaValidation({super.key});
  final FwaValidationController controller = Get.put(FwaValidationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("fwa_validation".tr,)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.workList.isEmpty) {
          return const Center(child: Text("No work found"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.workList.length,
          itemBuilder: (context, index) {
            final work = controller.workList[index];
            return _buildWorkItem(work);
          },
        );
      }),
    );
  }

  Widget _buildWorkItem(FwaValidationModel work) {
    return GestureDetector(
      onTap: () => Get.to(() =>  FwaWork()),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.appColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                "assets/icons/image 1 copy 3.png",
                height: 15,
                width: 15,
                color: Colors.white,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(work.designationName,
                            style: grayTitleText14_600),
                        Text(work.empId.toString(),
                            style: grayTitleText18_500),
                      ],
                    ),
                    Text(work.name, style: grayTitleText14),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




