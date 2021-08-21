import 'package:sfframework/constant/api_url.dart';
import 'package:sfframework/constant/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'hive_service.dart';

final hiveService = HiveService();

class AuthService {
  Future login(var loginData) async {
    var param = {
      "username": loginData['mobile'],
      "password": loginData['password']
    };
    var dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response = await dio.post(LOGIN_URL, data: param);
      if (response.data['access_token'] != null) {
        await _setSessionData(response.data[access_token]);

        await hiveService.setData(userSessionData, json.encode(response.data));
      }

      return response.data;
    } on DioError catch (e) {
      print(e.response.data);
      return e.response.data;
    }
  }

  Future signUp(var signupData) async {
    // var param = {
    //   "Name": signupData['firstName'],
    //   "Email": signupData['lastName'],
    //   "PhoneNumber": signupData['mobile'],
    //   "Password": signupData['password'],
    //   "ConfirmPassword": signupData['password'],
    //   "AcceptTc": true
    // };
    var dio = Dio();
    // dio.options.contentType = Headers.formUrlEncodedContentType;

    try {
      Response response = await dio.post(SIGNUP_URL, data: signupData);
      // await _setSessionData(response.data['access_token']);
      return response.data;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  _setSessionData(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(access_token, token);
  }
}
