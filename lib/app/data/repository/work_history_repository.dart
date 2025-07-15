

import 'package:family_planning/app/data/model/fetch%20work.dart';

import '../remote/submit_work_form_remote_data.dart';

class WorkHistoryRepository {
  final WorkApiService _service = WorkApiService();



  Future<List<FetchWorkModel>> getWorkHistory({

    required String empId,
     String ? startDate,
     String ? endDate,
  }) {
    return _service.fetchWorkHistory(

      empId: empId,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
