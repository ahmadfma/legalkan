import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legalkan/core/models/matakuliah.dart';
import 'package:legalkan/utils/my_exception.dart';

abstract class IMatakuliahApi {
  Future<List<Matakuliah>> getMatakuliah(List<String>? ids);
}

@LazySingleton(as: IMatakuliahApi)
class MatakuliahApi implements IMatakuliahApi {
  final Dio _dio;

  MatakuliahApi(this._dio);

  @override
  Future<List<Matakuliah>> getMatakuliah(List<String>? ids) async {
    try {
      final response = await _dio.get('/matakuliah', queryParameters: ids != null ? {"ids": ids.join(",")} : null);
      if(response.statusCode == 200) {
        return matakuliahFromJson(jsonEncode(response.data));
      } else {
        throw const MyException("Terjadi kesalahan saat memuat daftar matakuliah");
      }
    } on DioError catch (e) {
      throw MyException(e.response?.data['error']);
    }
  }

}
