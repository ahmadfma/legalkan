import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legalkan/core/models/dosen.dart';
import 'package:legalkan/core/models/matakuliah_dosen.dart';
import 'package:legalkan/core/models/my_activity.dart';
import 'package:legalkan/utils/my_exception.dart';

abstract class IDosenApi {
  Future<List<Dosen>> getDosens();
  Future<Dosen> getDosen(String nip);
  Future<List<MyActivity>> getMahasiswaBimbinganActivity();
  Future<List<MatakuliahDosen>> getMatakuliah(List<String>? ids);
}

@LazySingleton(as: IDosenApi)
class DosenApi implements IDosenApi {
  final Dio _dio;

  DosenApi(this._dio);

  @override
  Future<List<Dosen>> getDosens() async {
    try {
      final response = await _dio.get('/dosen');
      if(response.statusCode == 200) {
        return dosenFromJson(jsonEncode(response.data));
      } else {
        throw const MyException("Terjadi kesalahan saat memuat daftar dosen");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<Dosen> getDosen(String nip) async {
    try {
      final response = await _dio.get('/dosen', queryParameters: {
        'nip': nip
      });
      return Dosen.fromJson(response.data);
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<List<MyActivity>> getMahasiswaBimbinganActivity() async {
    try {
      final response = await _dio.get('/mahasiswa-bimbingan/activity');
      return myActivityFromJson(response.data);
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }
  
  @override
  Future<List<MatakuliahDosen>> getMatakuliah(List<String>? ids) async {
    try {
      final response = await _dio.get(
        '/dosen/matakuliah',
        queryParameters: ids != null ? {"ids": ids.join(",")} : null
      );
      if(response.statusCode == 200) {
        return matakuliahDosenFromJson(response.data);
      } else {
        throw const MyException("Terjadi kesalahan saat memuat daftar matakuliah");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    } catch(e) {
      throw MyException("Terjadi kesalahan : $e");
    }
  }

}