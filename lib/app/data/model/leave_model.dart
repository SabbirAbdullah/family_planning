class LeaveModel {
  final int leaveId;
  final String empId;
  final String description;
  final String image;
  final String startDate;
  final String endDate;
  final String status;
  final String createDate;
  final String updateDate;

  LeaveModel({
    required this.leaveId,
    required this.empId,
    required this.description,
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.createDate,
    required this.updateDate,
  });

  factory LeaveModel.fromJson(Map<String, dynamic> json) {
    return LeaveModel(
      leaveId: json['leave_id'],
      empId: json['emp_id'],
      description: json['description'],
      image: json['image'],
      startDate: json['start_date'] ??  "",
      endDate:json['end_date'] ?? "" ,
      status: json['status'],
      createDate:json['createDate'],
      updateDate: json['updateDate']
    );
  }
}
