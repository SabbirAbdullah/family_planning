import 'dart:io';
import 'package:family_planning/app/data/model/leave_model.dart';
import '../remote/leave_remote_data.dart';

class LeaveRequestRepository {
  final LeaveRemoteData _apiService = LeaveRemoteData();


  // Future<String> submitLeave(LeaveRequestModel leave, XFile? imageFile) {
  //   return _apiService.addLeave(leave, imageFile);
  // }


  Future<List<LeaveModel>> getLeaveData({required String empId,  String ? startDate,  String ? endDate,
  }) async {
    final data = await _apiService.fetchLeave(
      empId: empId,
      startDate: startDate,
      endDate: endDate,
    );
    return data.map<LeaveModel>((item) => LeaveModel.fromJson(item)).toList();
  }
}

