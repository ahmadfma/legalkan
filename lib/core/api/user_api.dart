import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:legalkan/core/api/dio_config.dart';
import 'package:legalkan/core/models/response/me_response.dart';
import 'package:legalkan/core/models/response/login_response.dart';
import 'package:legalkan/utils/my_exception.dart';

abstract class IUserApi {
  Future<MeResponse> getMe();
  Future<LoginResponse> loginMahasiswa({required String username, required String password});
  Future<void> updateFcmToken({required String fcmToken});
  Future<void> removeFcmToken();
}

@LazySingleton(as: IUserApi)
class UserApi implements IUserApi {

  final Dio _dio;

  UserApi(this._dio);

  @override
  Future<MeResponse> getMe() async {
    try {
      final response = await _dio.get('/me');
      if(response.statusCode == 200) {
        return MeResponse.fromJson(response.data);
      } else {
        throw const MyException("Terjadi kesalahan saat memuat data diri");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<LoginResponse> loginMahasiswa({required String username, required String password}) async {
    try {
      final option = baseOption;
      option.headers['requiresToken'] = false;
      final response = await _dio.post(
        '/user/login',
        data: {
          'username': username,
          'password': password
        }
      );
      if(response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        throw const MyException("Terjadi kesalahan saat mencoba login");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }
  
  @override
  Future<void> updateFcmToken({required String fcmToken}) async {
    try {
      final response = await _dio.patch(
        '/user/data',
        data: {
          "fcmToken": fcmToken
        }
      );
      if(response.statusCode == 200) {
        debugPrint("UPDATE FCM SUCCESS");
      } else {
        debugPrint("UPDATE FCM FAILED : ${response.data}");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<void> removeFcmToken() async {
    try {
      final response = await _dio.delete('/user/data/fcm-token');
      if(response.statusCode == 200) {
        debugPrint("REMOVE FCM TOKEN SUCCESS");
      } else {
        debugPrint("REMOVE FCM TOKEN FAILED : ${response.data}");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

}