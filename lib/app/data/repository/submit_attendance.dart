// import 'package:dio/dio.dart';
// import '../model/add_attendance_model.dart';
// import '../remote/attendance_api_service.dart';
//
// class AttendanceRepository {
//   final AttendanceRemoteService _apiService = AttendanceRemoteService();
//
//   Future<Response> submitAttendance(AttendanceModel model) async {
//     final formData = FormData.fromMap({
//       "emp_id": model.empId,
//       "date": model.date,
//       "in_time": model.inTime,
//       "type": model.type,
//       "description": model.description,
//       "location": model.location,
//       "lat": model.lat.toString(),
//       "longi": model.longi.toString(),
//       "image":  model.imagePath.split("/").last,
//
//     });
//
//
//
//     return await _apiService.submitAttendance(formData);
//   }
// }
