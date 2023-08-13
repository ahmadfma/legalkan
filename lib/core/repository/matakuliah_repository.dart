import 'package:injectable/injectable.dart';
import 'package:legalkan/core/api/matakuliah_api.dart';
import 'package:legalkan/utils/my_exception.dart';

import '../models/matakuliah.dart';

abstract class IMatakuliahRepository {

  Future<List<Matakuliah>> getMatakuliah(List<String>? ids);

}

@LazySingleton(as: IMatakuliahRepository)
class MatakuliahRepository implements IMatakuliahRepository {

  final IMatakuliahApi _iMatakuliahApi;

  const MatakuliahRepository(this._iMatakuliahApi);

  @override
  Future<List<Matakuliah>> getMatakuliah(List<String>? ids) {
    try {
      return _iMatakuliahApi.getMatakuliah(ids);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

}