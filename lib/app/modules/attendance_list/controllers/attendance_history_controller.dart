import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../data/model/attendance_history.dart';
import '../../../data/remote/attendance_api_service.dart';
import '../../../data/remote/auth_api_service.dart';
import '../../home/controllers/home_controller.dart';

class AttendanceHistoryController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  var pickedDate = ''.obs;

  void nextDate() {
    selectedDate.value = selectedDate.value.add(Duration(days: 1));
  }

  void previousDate() {
    selectedDate.value = selectedDate.value.subtract(Duration(days: 1));
  }

  String get formattedDate {
    // Use Bangla locale if necessary
    return DateFormat('dd-MM-yyyy').format(selectedDate.value);
  }
  // void pickDate(BuildContext context) async {
  //   DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100),
  //   );
  //
  //   if (pickedDate != null) {
  //     pickedDate = DateFormat('yyyy-MM-dd').format(pickedDate) as DateTime?;
  //   }
  // }
  var isTimeCorrect = true.obs;


  final AttendanceRemoteService _remote = AttendanceRemoteService();
  var attendanceList = <AttendanceHistoryModel>[].obs;
  final HomeController homeController = Get.put(HomeController());
  var isLoading = false.obs;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;

  var attendanceType = " ".obs;
  var isSubmitEnabled = true.obs;

  Future<void> fetchAttendance() async {
    try {
      isLoading(true);

      var data = await _remote.fetchAttendance(
        empId: homeController.user.value!.empId,
        startDate: DateFormat('yyyy-MM-dd').format(startDate.value),
        endDate: DateFormat('yyyy-MM-dd').format(endDate.value),
      );
      attendanceList.assignAll(data);
      updateTodayAttendanceStatus();
    } catch (e) {
      print("Error fetching attendance: $e");
    } finally {
      isLoading(false);

    }
  }

  /// Check today's attendance status
  void updateTodayAttendanceStatus() {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // Filter today's attendance records
    List<AttendanceHistoryModel> todayAttendance = attendanceList.where((record) {
      DateTime? recordDate = DateTime.tryParse(record.date!.toLocal().toString().split(' ')[0]);
      if (recordDate == null) return false; // Handle invalid dates safely

      return DateFormat('yyyy-MM-dd').format(recordDate) == today;
    }).toList();
    print(todayAttendance);
    print(today);
    // print(attendanceList[0].date);
    // Determine attendance status
    if (todayAttendance.isEmpty) {
      attendanceType.value = "In";
      isSubmitEnabled.value = true; // No record → "In"
    } else if (todayAttendance.length == 1) {
      attendanceType.value = "Out";
      isSubmitEnabled.value = true; // One record → "Out"
    } else {
      attendanceType.value = "Already Attendance submitted";
      isSubmitEnabled.value = false; // Two or more records → Attendance already submitted
    }

    update(); // Refresh UI
  }

  // String getAttendanceStatusForToday() {
  //   DateTime today = DateTime.now();
  //   String formattedToday = DateFormat('yyyy-MM-dd').format(today.toUtc()); // Convert to UTC
  //
  //   print("Today's Date (UTC): $formattedToday"); // Debugging
  //
  //   // Filter attendance records for today's date
  //   var todayRecords = attendanceList.where((record) {
  //     DateTime recordDateTime = DateTime.parse(record.date).toUtc();
  //     String recordDate = DateFormat('yyyy-MM-dd').format(recordDateTime);
  //
  //     print("Record Date (UTC): $recordDate"); // Debugging
  //
  //     return recordDate == formattedToday;
  //   }).toList();
  //
  //   print("Total Records Found for Today: ${todayRecords.length}"); // Debugging
  //
  //   // Determine status
  //   if (todayRecords.isEmpty) {
  //     return "In";  // No records → First punch-in
  //   } else if (todayRecords.length == 1) {
  //     return "Out";  // One record → Time to punch out
  //   } else {
  //     return "Already Punched Out"; // More than one entry → Completed attendance
  //   }
  // }


  @override
  void onInit() {
    super.onInit();
    fetchAttendance();
   // Fetch today's data initially
  }



void selectDateRange(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Select Date Range'),
        content: SizedBox(
          height: 300,
          width: 300,
          child: SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                startDate.value = args.value.startDate ?? DateTime.now();
                endDate.value = args.value.endDate ?? DateTime.now();
              }
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              fetchAttendance();
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}




}
