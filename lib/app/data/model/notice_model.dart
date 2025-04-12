class NoticeModel {
  final int id;
  final DateTime publishDate;
  final String noticeName;
  final String noticeDescription;
  final DateTime createDate;
  final DateTime updateDate;

  NoticeModel({
    required this.id,
    required this.publishDate,
    required this.noticeName,
    required this.noticeDescription,
    required this.createDate,
    required this.updateDate,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    return NoticeModel(
      id: json['id'],
      publishDate: DateTime.parse(json['publish_date']),
      noticeName: json['notice_name'],
      noticeDescription: json['notice_description'],
      createDate: DateTime.parse(json['createDate']),
      updateDate: DateTime.parse(json['updateDate']),
    );
  }
}
