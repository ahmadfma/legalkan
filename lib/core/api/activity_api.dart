import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legalkan/core/models/my_activity.dart';
import 'package:legalkan/utils/my_exception.dart';
import '../models/activity_penyetaraan.dart';

abstract class IActivityApi {
  Future<List<MyActivity>> getMyActivities();
  Future<MyActivity> getActivity(String activityId);
  Future<ActivityPenyetaraan> getActivityPenyetaraan(String activityId);
  Future<MyActivity> createActivity(form);
  Future<MyActivity> updateStatusActivity(int status, String activityId);
  Future<ActivityPenyetaraan> updateMatakuliahPenyetaraan(String activityId, List<String> matakuliahId);
  Future<ActivityPenyetaraan> updatePenyetaraanStatus(String activityId, int status);
}

@LazySingleton(as: IActivityApi)
class ActivityApi implements IActivityApi{

  final Dio _dio;

  ActivityApi(this._dio);

  @override
  Future<List<MyActivity>> getMyActivities() async {
    try {
      final response = await _dio.get('/activity');
      if(response.statusCode == 200) {
        return myActivityFromJson(jsonEncode(response.data));
      } else {
        throw const MyException("Terjadi kesalahan saat memuat daftar activity");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<MyActivity> getActivity(String activityId) async {
    try {
      final response = await _dio.get(
        '/activity',
        queryParameters: {
          'activityId': activityId
        }
      );
      return MyActivity.fromJson(response.data);
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<ActivityPenyetaraan> getActivityPenyetaraan(String activityId) async {
    try {
      final response = await _dio.get(
        '/activity/penyetaraan',
        queryParameters: {
          'activityId': activityId
        }
      );
      if(response.statusCode == 200) {
        return activityPenyetaraanFromJson(jsonEncode(response.data));
      } else {
        throw const MyException("Terjadi kesalahan saat memuat penyetaraan");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<MyActivity> createActivity(form) async {
    try {
      final response = await _dio.post(
        '/activity',
        data: form
      );
      if(response.statusCode == 200) {
        return MyActivity.fromJson(response.data);
      } else {
        throw const MyException("Terjadi kesalahan saat membuat activity");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<MyActivity> updateStatusActivity(int status, String activityId) async {
    try {
      final response = await _dio.patch(
        '/activity',
        data: {
          'status': status,
          'activityId': activityId
        }
      );
      if(response.statusCode == 200) {
        return MyActivity.fromJson(response.data);
      } else {
        throw const MyException("Terjadi kesalahan saat mengubah status activity");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<ActivityPenyetaraan> updateMatakuliahPenyetaraan(String activityId, List<String> matakuliahId) async {
    try {
      final response = await _dio.patch(
        '/activity/penyetaraan',
        data: {
          'activityId': activityId,
          'mataKuliah': matakuliahId
        }
      );
      if(response.statusCode == 200) {
        return ActivityPenyetaraan.fromJson(response.data);
      } else {
        throw const MyException('Terjadi kesalahan saat mengubah matakuliah penyetaraan');
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<ActivityPenyetaraan> updatePenyetaraanStatus(String activityId, int status) async {
    try {
      final response = await _dio.patch(
        '/activity/penyetaraan',
        data: {
          'activityId': activityId,
          'status': status
        }
      );
      return ActivityPenyetaraan.fromJson(response.data);
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

}