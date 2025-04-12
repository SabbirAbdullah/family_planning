import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/notice_model.dart';
import '../../../data/repository/notice_repository.dart';



class NoticeController extends GetxController {
  final NoticeRepository _noticeRepository = NoticeRepository();
  var notices = <NoticeModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNotices();
    super.onInit();
  }

  void fetchNotices() async {
    try {
      isLoading(true);
      var data = await _noticeRepository.getNotices();
      notices.assignAll(data);
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}


