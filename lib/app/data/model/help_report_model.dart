class HelpReportModel {
  final String empId;
  final String subject;
  final String description;
  final String date;

  HelpReportModel({
    required this.empId,
    required this.subject,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      "emp_id": empId,
      "subject": subject,
      "description": description,
      "date": date,
    };
  }
}
