import 'package:injectable/injectable.dart';
import 'package:legalkan/core/api/user_api.dart';
import 'package:legalkan/utils/my_exception.dart';

import '../models/response/login_response.dart';
import '../models/response/me_response.dart';

abstract class IUserRepository {

  Future<MeResponse> getMe();

  Future<LoginResponse> loginMahasiswa({required String username, required String password});

  Future<void> updateFcmToken({required String fcmToken});

  Future<void> removeFcmToken();

}

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {

  final IUserApi _iUserApi;

  const UserRepository(this._iUserApi);

  @override
  Future<MeResponse> getMe() {
    try {
      return _iUserApi.getMe();
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<LoginResponse> loginMahasiswa({required String username, required String password}) {
    try {
      return _iUserApi.loginMahasiswa(username: username, password: password);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<void> updateFcmToken({required String fcmToken}) {
    try {
      return _iUserApi.updateFcmToken(fcmToken: fcmToken);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<void> removeFcmToken() {
    try {
      return _iUserApi.removeFcmToken();
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

}