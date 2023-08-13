import 'dart:convert';

import 'package:legalkan/core/models/user_data.dart';

List<MyActivity> myActivityFromJson(String str) => List<MyActivity>.from(json.decode(str).map((x) => MyActivity.fromJson(x)));

String myActivityToJson(List<MyActivity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyActivity {
  String? id;
  String? userId;
  int? type;
  String? mitra;
  String? startDate;
  String? endDate;
  String? dosenPembimbingId;
  int? status;
  String? createdAt;
  String? updatedAt;
  UserData? userData;

  MyActivity({
    this.id,
    this.userId,
    this.type,
    this.mitra,
    this.startDate,
    this.endDate,
    this.dosenPembimbingId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userData,
  });

  factory MyActivity.fromJson(Map<String, dynamic> json) => MyActivity(
    id: json["_id"],
    userId: json["userId"],
    type: json["type"],
    mitra: json["mitra"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    dosenPembimbingId: json["dosenPembimbingId"],
    status: json["status"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    userData: json['userData'] == null ? null : UserData.fromJson(json['userData'])
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "type": type,
    "mitra": mitra,
    "startDate": startDate,
    "endDate": endDate,
    "dosenPembimbingId": dosenPembimbingId,
    "status": status,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "userData": userData?.toJson()
  };
}

final dummyMyActivities = [
  MyActivity(
    id: '6403583498647e657fb96c39',
    userId: '8659',
    type: 0,
    mitra: 'Bangkit Academy 2022 by Google, GoTo, Traveloka - Android Learning Path ',
    startDate: '2023-03-03T12:05:21.610Z',
    endDate: '2023-03-03T12:05:21.610Z',
    dosenPembimbingId: 'asdasd',
    status: 1,
    createdAt: '2023-03-04T14:39:48.779Z',
    updatedAt: '2023-03-04T14:39:48.779Z',
    userData: UserData(
      userId: '123',
      username: 'D121191048',
      name: 'Ahmad Fathanah M.Adil'
    )
  ),
  MyActivity(
      id: '6403583498647e657fb96c39',
      userId: '8659',
      type: 4,
      mitra: 'Bangkit Academy 2022 by Google, GoTo, Traveloka - Android Learning Path ',
      startDate: '2023-03-03T12:05:21.610Z',
      endDate: '2023-06-03T12:05:21.610Z',
      dosenPembimbingId: 'asdasd',
      status: 3,
      createdAt: '2023-03-04T14:39:48.779Z',
      updatedAt: '2023-03-04T14:39:48.779Z',
      userData: UserData(
          userId: '123',
          username: 'D121191048',
          name: 'Ahmad Fathanah M.Adil'
      )
  ),
  MyActivity(
      id: '6403583498647e657fb96c39',
      userId: '8659',
      type: 3,
      mitra: 'Bangkit Academy 2022 by Google, GoTo, Traveloka - Android Learning Path ',
      startDate: '2023-03-03T12:05:21.610Z',
      endDate: '2023-03-03T12:05:21.610Z',
      dosenPembimbingId: 'asdasd',
      status: 2,
      createdAt: '2023-03-04T14:39:48.779Z',
      updatedAt: '2023-03-04T14:39:48.779Z',
      userData: UserData(
          userId: '123',
          username: 'D121191048',
          name: 'Ahmad Fathanah M.Adil'
      )
  )
];