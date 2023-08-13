import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:legalkan/core/local/preferences/shared_preferences_keys.dart';
import 'package:legalkan/core/models/response/login_response.dart';
import '../models/response/me_response.dart';

abstract class ILocalDataSource {
  Future<bool> saveUserSession(User user);
  User? getUserSession();
  Future<bool> deleteUserSession();
  Future<bool> saveLoginSession(LoginResponse loginResponse);
  LoginResponse? getLoginSession();
  Future<bool> deleteLoginSession();
  Future<bool> saveUserImagePath(String imagePath);
  String? getUserImagePath();
}

@LazySingleton(as: ILocalDataSource)
class LocalDataSource implements ILocalDataSource {

  final SharedPreferences _sharedPreferences;

  const LocalDataSource(this._sharedPreferences);

  @override
  Future<bool> saveUserSession(User user) {
    return _sharedPreferences.setString(SharedPreferencesKey.userSession.key, json.encode(user));
  }

  @override
  User? getUserSession() {
    final data = _sharedPreferences.getString(SharedPreferencesKey.userSession.key);
    if(data != null) return User.fromJson(json.decode(data));
    return null;
  }

  @override
  Future<bool> deleteUserSession() {
    return _sharedPreferences.remove(SharedPreferencesKey.userSession.key);
  }

  @override
  Future<bool> saveLoginSession(LoginResponse loginResponse) {
    return _sharedPreferences.setString(SharedPreferencesKey.loginSession.key, json.encode(loginResponse));
  }

  @override
  LoginResponse? getLoginSession() {
    final data = _sharedPreferences.getString(SharedPreferencesKey.loginSession.key);
    if(data != null) return LoginResponse.fromJson(json.decode(data));
    return null;
  }

  @override
  Future<bool> deleteLoginSession() {
    return _sharedPreferences.remove(SharedPreferencesKey.loginSession.key);
  }

  @override
  Future<bool> saveUserImagePath(String imagePath) async {
    final user = getUserSession();
    if(user != null) {
      return _sharedPreferences.setString("image_${user.username}", imagePath);
    }
    return Future.value(false);
  }
  
  @override
  String? getUserImagePath() {
    final user = getUserSession();
    if(user != null) {
      return _sharedPreferences.getString("image_${user.username}");
    }
    return null;
  }

}