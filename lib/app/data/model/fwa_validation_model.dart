import 'dart:convert';

import 'dart:convert';

class FwaValidationModel {
  final String empId;
  final String name;
  final String designationName;
  final List<WorkData> workData;

  FwaValidationModel({
    required this.empId,
    required this.name,
    required this.designationName,
    required this.workData,
  });

  factory FwaValidationModel.fromJson(Map<String, dynamic> json) {
    return FwaValidationModel(
      empId: json['emp_id'],
      name: json['name'],
      designationName: json['designation_name'],
      workData: (jsonDecode(json['workData']) as List)
          .map((e) => WorkData.fromJson(e))
          .toList(),
    );
  }
}

class WorkData {
  final int workId;
  final int workTypeId;
  final String workType;
  final String workField;
  final String workFieldType;
  final String value;
  final String status;

  WorkData({
    required this.workId,
    required this.workTypeId,
    required this.workType,
    required this.workField,
    required this.workFieldType,
    required this.value,
    required this.status
  });

  factory WorkData.fromJson(Map<String, dynamic> json) {
    return WorkData(
      workId: json['work_id'],
      workTypeId: json['work_type_id'],
      workType: json['work_type'],
      workField: json['work_field'],
      workFieldType: json['work_field_type'],
      value: json['value'],
        status: json['status']

    );
  }
}

// class FwaValidationModel {
//   String empId;
//   String name;
//   String designationName;
//   String workType;
//   int workId;
//   int workTypeId;
//   DateTime? date;
//   String status;
//    List<FwaWorkDataModel> workData;
//
//   FwaValidationModel({
//     required this.empId,
//     required this.name,
//     required this.designationName,
//     required this.workType,
//     required this.workId,
//     required this.workTypeId,
//     required this.date,
//     required this.status,
//     required this.workData
//   });
//
//   factory FwaValidationModel.fromJson(Map<String, dynamic> json) {
//     return FwaValidationModel(
//       empId: json['emp_id'],
//       name: json['name'],
//       designationName: json['designation_name'],
//       workType: json['work_type'],
//       workId: json['work_id'],
//       workTypeId: json['work_type_id'],
//       date: json['date'] != null ? DateTime.parse(json['date']) : null,
//       status: json['status'],
//       workData: (jsonDecode(json['workData']) as List)
//           .map((data) => FwaWorkDataModel.fromJson(data))
//           .toList(),
//     );
//   }
//
// }
//
//
// class FwaWorkDataModel {
//   int workId;
//   String workType;
//   String workField;
//   String workFieldType;
//   String value;
//
//   FwaWorkDataModel({
//     required this.workId,
//     required this.workType,
//     required this.workField,
//     required this.workFieldType,
//     required this.value,
//   });
//
//   factory FwaWorkDataModel.fromJson(Map<String, dynamic> json) {
//     return FwaWorkDataModel(
//       workId: json['work_id'],
//       workType: json['work_type'],
//       workField: json['work_field'],
//       workFieldType: json['work_field_type'],
//       value: json['value'],
//     );
//   }
// }
