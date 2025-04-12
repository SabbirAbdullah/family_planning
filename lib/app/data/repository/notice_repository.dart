import 'package:family_planning/app/data/remote/notice_remote_data.dart';

import '../model/notice_model.dart';


class NoticeRepository {
  final NoticeRemoteData _noticeService = NoticeRemoteData();

  Future<List<NoticeModel>> getNotices() async {
    return await _noticeService.fetchNotices();
  }
}
