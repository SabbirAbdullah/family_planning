import 'package:family_planning/app/modules/main/views/bottom_nav_view.dart';
import 'package:get/get.dart';
import '../../../data/model/dashboard_model.dart';
import '../../../data/model/user_model.dart';
import '../../../data/remote/auth_api_service.dart';
import '../../../data/repository/dashboard_repository.dart';


class HomeController extends GetxController {

  final AuthRemoteService _apiService = AuthRemoteService();
  Rxn<UserModel> user = Rxn<UserModel>();

  var isLoading= false.obs;

  Future<void> fetchUser() async {
    isLoading.value = true;
      try {
        final fetchedUser = await _apiService.getUserFromToken();
        user.value = fetchedUser;
        update();
      } catch (e) {
        print(e);

    }finally{
        isLoading.value = false;
      }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUser();


  }
  final DashboardRepository _repository = DashboardRepository();

  var dashboardData = <DashboardData>[].obs;
  var fwiData = <FwiData>[].obs;


  Future <void> fetchDashboard() async {
    try {
      isLoading(true);
      final response = await _repository.getDashboardData({
        "emp_id": "${user.value!.empId}",
        "upazila_id": "${user.value!.upazilaId}",
        "union_id": "${user.value!.unionId}",
        "unit_id": "${user.value!.unitId}"
      });
      dashboardData.assignAll(response.dashboardData);
      fwiData.assignAll(response.fwiData);
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
    }
  }

}



