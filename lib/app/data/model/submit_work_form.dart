class WorkInfoData {
  final int fieldId;
  final String value;

  WorkInfoData({required this.fieldId, required this.value});

  Map<String, dynamic> toJson() {
    return {
      "field_id": fieldId,
      "value": value,
    };
  }
}

class SubmitWorkForm {
  final String empId;
  final String workTypeId;
  final String date;
  final List<WorkInfoData> workInfoData;

  SubmitWorkForm({
    required this.empId,
    required this.workTypeId,
    required this.date,
    required this.workInfoData,
  });

  Map<String, dynamic> toJson() {
    return {
      "emp_id": empId,
      "work_type_id": workTypeId,
      "date": date,
      "WorkInfoData": workInfoData.map((e) => e.toJson()).toList(),
    };
  }
}
