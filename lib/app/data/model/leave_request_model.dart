// // lib/data/models/leave_request_model.dart
// class LeaveRequestModel {
//   final String empId;
//   final String description;
//   final String imagePath;
//   final String startDate;
//   final String endDate;
//
//   LeaveRequestModel({
//     required this.empId,
//     required this.description,
//     required this.imagePath,
//     required this.startDate,
//     required this.endDate,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'emp_id': empId,
//       'description': description,
//       'image': imagePath,
//       'start_date': startDate,
//       'end_date': endDate,
//     };
//   }
// }
//
// // lib/data/models/api_response_model.dart
// class ApiResponseModel {
//   final String message;
//   final bool success;
//
//   ApiResponseModel({
//     required this.message,
//     required this.success,
//   });
//
//   factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
//     return ApiResponseModel(
//       message: json['message'] ?? '',
//       success: json['success'] ?? false,
//     );
//   }
// }