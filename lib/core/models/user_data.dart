import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  String? id;
  String? userId;
  String? username;
  String? name;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;

  UserData({
    this.id,
    this.userId,
    this.username,
    this.name,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["_id"],
    userId: json["userId"],
    username: json["username"],
    name: json["name"],
    fcmToken: json["fcmToken"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "username": username,
    "name": name,
    "fcmToken": fcmToken,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
