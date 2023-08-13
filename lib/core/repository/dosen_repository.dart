import 'package:injectable/injectable.dart';
import 'package:legalkan/core/api/dosen_api.dart';
import 'package:legalkan/core/models/my_activity.dart';
import 'package:legalkan/utils/my_exception.dart';
import '../models/dosen.dart';
import '../models/matakuliah_dosen.dart';

abstract class IDosenRepository {
  Future<List<Dosen>> getDosens();
  Future<Dosen> getDosen(String dosenId);
  Future<List<MyActivity>> getMahasiswaBimbinganActivities();
  Future<List<MatakuliahDosen>> getMatakuliah(List<String>? ids);
}

@LazySingleton(as: IDosenRepository)
class DosenRepository implements IDosenRepository {

  final IDosenApi _dosenApi;

  const DosenRepository(this._dosenApi);

  @override
  Future<List<Dosen>> getDosens() {
    try {
      return _dosenApi.getDosens();
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }
  
  @override
  Future<Dosen> getDosen(String dosenId) {
    try {
      return _dosenApi.getDosen(dosenId);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<List<MyActivity>> getMahasiswaBimbinganActivities() {
    try {
      return _dosenApi.getMahasiswaBimbinganActivity();
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<List<MatakuliahDosen>> getMatakuliah(List<String>? ids) {
    try {
      return _dosenApi.getMatakuliah(ids);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

}