import 'package:family_planning/app/data/model/fetch%20work.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../data/repository/work_history_repository.dart';
import '../../home/controllers/home_controller.dart';


class WorkHistoryController extends GetxController {
  final WorkHistoryRepository repository = WorkHistoryRepository();
  final HomeController homeController = Get.put(HomeController());

  var workList = <FetchWorkModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchHistory({

    String? startDate,
    String? endDate,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final data = await repository.getWorkHistory(
        empId:    homeController.user.value!.empId,
        startDate: startDate,
        endDate: endDate,
      );
      workList.value = data;
      updateLatestWork();

    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
  var  startDate = DateTime.now().obs;
  var  endDate = DateTime.now().obs;

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
                  startDate.value =
                      args.value.startDate ?? DateTime.now();
                  endDate.value =
                      args.value.endDate ?? DateTime.now();
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
                fetchHistory(
                  startDate: DateFormat('yyyy-MM-dd').format(startDate.value!),
                  endDate: DateFormat('yyyy-MM-dd').format(endDate.value!),
                );
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  var latestWork = Rxn<FetchWorkModel>();

  void updateLatestWork()  {
    if (workList.isNotEmpty) {
      var list = workList;
      // list.sort((a, b) => b.date!.compareTo(a.date!));
      list.sort((a, b) => b.updateDate!.toUtc().compareTo(a.updateDate!.toUtc()));// Sort descending
      latestWork.value = list.first;// Pick the latest
      print("latest work : ${latestWork.value}");
    }
  }
}
