class DashboardData {
  final int present;
  final int totalWork;
  final int todayLate;
  final String month;

  DashboardData({required this.present, required this.totalWork, required this.todayLate, required this.month});

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      present: json['present'] ?? "",
      totalWork: json['totalWork'] ?? "",
      todayLate: json['today_late'] ?? "",
        month: json['month']?? "",
    );
  }
}

class FwiData {
  final int totalEmployee;
  final int totalPresent;

  FwiData({required this.totalEmployee, required this.totalPresent});

  factory FwiData.fromJson(Map<String, dynamic> json) {
    return FwiData(
      totalEmployee: json['totalEmployee'] ?? '',
      totalPresent: json['totalPresent'] ?? "",
    );
  }
}

class DashboardResponse {
  final List<DashboardData> dashboardData;
  final List<FwiData> fwiData;

  DashboardResponse({required this.dashboardData, required this.fwiData});

  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    return DashboardResponse(
      dashboardData: (json['dashboardData'] as List)
          .map((e) => DashboardData.fromJson(e))
          .toList(),
      fwiData: (json['fwiData'] as List)
          .map((e) => FwiData.fromJson(e))
          .toList(),
    );
  }
}
