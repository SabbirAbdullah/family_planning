import 'package:family_planning/app/core/values/text_styles.dart';
import 'package:family_planning/app/modules/notice/view/notice_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/notice_controller.dart';
class NoticesPage extends StatelessWidget {
  final NoticeController controller = Get.put(NoticeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notice'.tr),
      ),
      body: Obx(
            (){
              if(controller.isLoading.value){
                return Center(child: CircularProgressIndicator());
              }if(controller.notices.isEmpty){
                return Center(child: Text("Empty"));
              } return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: controller.notices.length ,
                  itemBuilder: (context, index) {
                    final notice = controller.notices[index];
                    return GestureDetector(
                      onTap: () => Get.to(() => NoticeDetailPage(notice: notice)),
                      child: Card(
                        elevation: 0,
                        margin: EdgeInsets.only(bottom: 10),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(notice.noticeName,style: titleTextBlue16,),
                            subtitle: Text(
                              notice.noticeDescription,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14), // Optional: adjust style as needed
                            ),
                              trailing: Text(
                              '${notice.publishDate.toLocal()}'.split(' ')[0],
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
      ),
    );
  }
}

