import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:legalkan/core/models/my_notification.dart';
import 'package:legalkan/utils/my_exception.dart';

abstract class INotificationApi {
  Future<List<MyNotification>> getNotifications();
  Future<void> updateNotificationReadStatus();
}

@LazySingleton(as: INotificationApi)
class NotificationApi implements INotificationApi {

  final Dio _dio;

  NotificationApi(this._dio);

  @override
  Future<List<MyNotification>> getNotifications() async {
    try {
      final response = await _dio.get('/notification');
      return notificationFromJson(jsonEncode(response.data));
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<void> updateNotificationReadStatus() async {
    try {
      await _dio.patch('/notification/readStatus');
      debugPrint("UPDATE NOTIFICATION READ STATUS SUCCESS");
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

}