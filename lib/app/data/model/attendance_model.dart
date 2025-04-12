


class AttendanceModel {
  final String empId;
  final String date;
  final String inTime;
  final String type;
  final String? imagePath;
  final String? description;
  final String? location;
  final String? lat;
  final String? longi;

  AttendanceModel({
    required this.empId,
    required this.date,
    required this.inTime,
    required this.type,
    this.imagePath,
    this.description,
    this.location,
    this.lat,
    this.longi,
  });

  Map<String, dynamic> toJson() {
    return {
      'emp_id': empId,
      'date': date,
      'in_time': inTime,
      'type': type,
      'description': description,
      'location': location,
      'lat': lat,
      'longi': longi,
    };
  }
}


