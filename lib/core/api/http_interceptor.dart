import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:legalkan/core/local/preferences/shared_preferences_keys.dart';
import 'package:legalkan/core/models/response/login_response.dart';

class HttpInterceptors extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint("REQUIRES TOKEN : ${options.headers['requiresToken'].toString()}");

    if (options.headers['requiresToken']) {
      //remove the auxiliary header
      try {
        options.headers.remove('requiresToken');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final loginSession = LoginResponse.fromJson(json.decode(prefs.getString(SharedPreferencesKey.loginSession.key)!));
        options.headers.addAll({'Authorization': 'Bearer ${loginSession.accessToken}'});
      } catch(e) {
        debugPrint("HttpInterceptors REQUEST ERROR : $e");
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<dynamic> onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}
