import 'package:family_planning/app/data/model/fwa_validation_model.dart';


import '../remote/fwa_validation_remote_data.dart';

class FwaValidationRepository {
  final FwaValidationRemoteData _apiService = FwaValidationRemoteData();

  Future<List<FwaValidationModel>> getWorkList(int designationId,int upazilaId, int unionId, int unitId, String district, String dateFilter) async {
    return await _apiService.fetchWorkList(designationId,upazilaId,unionId,unitId,district,dateFilter);
  }

  Future<String> updateWorkStatus(int workId, String status) async {
    return await _apiService.updateWorkStatus(workId, status);
  }
}
