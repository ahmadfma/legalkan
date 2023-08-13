import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legalkan/core/models/testimoni.dart';
import 'package:legalkan/utils/my_exception.dart';

abstract class ITestimoniApi {
  Future<List<Testimoni>> getTestimoni();
}

@LazySingleton(as: ITestimoniApi)
class TestimoniApi implements ITestimoniApi {

  final Dio _dio;

  TestimoniApi(this._dio);

  @override
  Future<List<Testimoni>> getTestimoni() async {
    try {
      final response = await _dio.get('/testimoni');
      if(response.statusCode == 200) {
        return testimoniFromJson(jsonEncode(response.data));
      } else {
        throw const MyException("Terjadi kesalahan saat memuat testimoni");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

}