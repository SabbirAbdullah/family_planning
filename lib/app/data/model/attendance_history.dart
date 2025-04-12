

// attendance_model.dart
class AttendanceHistoryModel {
  final int attId;
  final String empId;
  final DateTime ? date;
  final String inTime;
  final String type;
  final String image;
  final String description;
  final String? location;
  final double lat;
  final double longi;

  AttendanceHistoryModel({
    required this.attId,
    required this.empId,
    required this.date,
    required this.inTime,
    required this.type,
    required this.image,
    required this.description,
     this.location,
    required this.lat,
    required this.longi,
  });

  factory AttendanceHistoryModel.fromJson(Map<String, dynamic> json) {
    return AttendanceHistoryModel(
      attId: json['att_id'],
      empId: json['emp_id'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      inTime: json['in_time'],
      type: json['type'],
      image: json['image'],
      description: json['description'],
      location: json['location'],
      lat: double.parse(json['lat']),
      longi: double.parse(json['longi']),
    );
  }
}