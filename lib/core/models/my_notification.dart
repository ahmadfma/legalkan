import 'dart:convert';

List<MyNotification> notificationFromJson(String str) => List<MyNotification>.from(json.decode(str).map((x) => MyNotification.fromJson(x)));

String notificationToJson(List<MyNotification> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyNotification {
  String id;
  String title;
  String message;
  bool isRead;
  String userId;
  String createdAt;
  String updatedAt;

  MyNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.isRead,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MyNotification.fromJson(Map<String, dynamic> json) => MyNotification(
    id: json["_id"],
    title: json["title"],
    message: json["message"],
    isRead: json["isRead"],
    userId: json["userId"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "message": message,
    "isRead": isRead,
    "userId": userId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
