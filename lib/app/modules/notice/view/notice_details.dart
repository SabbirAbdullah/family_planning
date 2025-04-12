import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/notice_model.dart';
import '../controller/notice_controller.dart';
class NoticeDetailPage extends StatelessWidget {
  final NoticeModel notice;

  NoticeDetailPage({required this.notice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notice.noticeName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notice.noticeName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${notice.publishDate.toLocal()}'.split(' ')[0],
              style: TextStyle(color: Colors.grey,fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              notice.noticeDescription,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}