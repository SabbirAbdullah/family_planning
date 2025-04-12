
import '../model/dashboard_model.dart';
import '../remote/dashboard_remote_data.dart';

class DashboardRepository {
  final DashboardRemoteService _apiService = DashboardRemoteService();

  Future<DashboardResponse> getDashboardData( Map<String, dynamic> requestBody) async {
    final response = await _apiService.fetchDashboardData(requestBody);
    return DashboardResponse.fromJson(response);
  }
}
