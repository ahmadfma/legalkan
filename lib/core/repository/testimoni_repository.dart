import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legalkan/core/models/testimoni.dart';
import 'package:legalkan/utils/my_exception.dart';

import '../api/testimoni_api.dart';

abstract class ITestimoniRepository {
  Future<List<Testimoni>> getTestimoni();
}

@LazySingleton(as: ITestimoniRepository)
class TestimoniRepository implements ITestimoniRepository {

  final ITestimoniApi _iTestimoniApi;

  const TestimoniRepository(this._iTestimoniApi);

  @override
  Future<List<Testimoni>> getTestimoni() {
    try {
      return _iTestimoniApi.getTestimoni();
    } on DioError catch(e) {
      throw MyException(e.message);
    }
  }

}