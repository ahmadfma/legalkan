import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legalkan/core/models/activity_type.dart';
import 'package:legalkan/utils/my_exception.dart';

abstract class IActivityTypeApi {
  Future<List<ActivityType>> getActivityTypes();
}

@LazySingleton(as: IActivityTypeApi)
class ActivityTypeApi implements IActivityTypeApi{

  final Dio _dio;

  ActivityTypeApi(this._dio);

  @override
  Future<List<ActivityType>> getActivityTypes() async {
    try {
      final response = await _dio.get('/jenisKegiatan');
      if(response.statusCode == 200) {
        return activityTypeFromJson(jsonEncode(response.data));
      } else {
        throw const MyException("Terjadi kesalahan saat memuat daftar jenis kegiatan");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

}