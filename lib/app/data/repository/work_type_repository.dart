
import '../model/work_type_model.dart';
import '../remote/work_type_remote_data.dart';

class WorkRepository {
  final WorkService _workService = WorkService();

  Future<List<WorkType>> getWorkTypes(String id) {
    return _workService.fetchWorkTypes(id);
  }

  Future<List<WorkField>> getWorkFields(int workTypeId) {
    return _workService.fetchWorkFields(workTypeId);
  }
}
