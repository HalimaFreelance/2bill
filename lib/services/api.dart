import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_headers.dart';

class Api {

  static const loginURL = '/login';
  static const logOutURL = '/logout';
  static const registerURL = '/register';
  var client = new http.Client();

  // Future<LoginResponse> login(Map body) async {
  //   var response =
  //       await ApiHeaders().postFormDataRequest(path: loginURL, map: body);
  //   if (response != null) {
  //     return LoginResponse.fromJson(response.data);
  //   } else {
  //     return null;
  //   }
  // }
  //
  // Future<LoginResponse> logOut(Map body) async {
  //   var response =
  //       await ApiHeaders().postFormDataRequest(path: logOutURL, map: body);
  //   if (response != null) {
  //     return LoginResponse.fromJson(response.data);
  //   } else {
  //     return null;
  //   }
  // }
  //
  // Future<LoginResponse> register(Map body) async {
  //   var response =
  //       await ApiHeaders().postFormDataRequest(path: registerURL, map: body);
  //   if (response != null) {
  //     return LoginResponse.fromJson(response.data);
  //   } else {
  //     return null;
  //   }
  // }

}
