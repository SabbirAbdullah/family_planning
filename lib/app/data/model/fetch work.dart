// models/work_model.dart
import 'dart:convert';

class FetchWorkModel {
  final int? workId;
  final String? empId;
  final int? workTypeId;
  final DateTime? date;
  final DateTime? createDate;
  final DateTime? updateDate;
  final String? workType;
  final String? name;
  final String status;
  final List<WorkInfoField> workInfo;

  FetchWorkModel({

    required this.workId,
    required this.empId,
    required this.workTypeId,
    required this.date,
    required this.createDate,
    required this.updateDate,
    required this.workType,
    required this.name,
    required this.workInfo,
    required this.status,
  });

  factory FetchWorkModel.fromJson(Map<String, dynamic> json) {
    return FetchWorkModel(
      workId: json['work_id'],
      status: json['status'],
      empId: json['emp_id'],
      workTypeId: json['work_type_id'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      createDate: json['createDate'] != null ? DateTime.parse(json['createDate']) : null,
      updateDate: json['updateDate'] != null ? DateTime.parse(json['updateDate']) : null,
      workType: json['work_type'],
      name: json['name'],
      workInfo: json['work_info'] != null
          ? (jsonDecode(json['work_info']) as List)
          .map((e) => WorkInfoField.fromJson(e))
          .toList()
          : [],
    );
  }
}

// models/work_info_field.dart
class WorkInfoField {
  final String field;
  final String fieldType;
  final int fieldId;
  final String value;


  WorkInfoField({
    required this.field,
    required this.fieldType,
    required this.fieldId,
    required this.value,

  });

  factory WorkInfoField.fromJson(Map<String, dynamic> json) {
    return WorkInfoField(
      field: json['field'] ?? '',
      fieldType: json['field_type'] ?? '',
      fieldId: json['field_id'] ?? 0,
      value: json['value'] ?? '',

    );
  }
}

