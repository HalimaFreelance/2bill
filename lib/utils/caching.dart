import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

saveLoginData(String user) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('UserData', user);
}
// Future<LoginUserResponse> isLogin() async {
//   final prefs = await SharedPreferences.getInstance();
//   String user = prefs.get('UserData') ?? null;
//   if (user != null) {
//     return LoginUserResponse.fromJson(json.decode(user));
//   }
//   return null;
// }



saveDeviceToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('FCMToken', token);
}

onBoard() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('on_board_screen', true);
}


Future<String> fetchFCMToken() async {
  var prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('FCMToken');
  if (token != null) {
    return token;
  }
  return '';
}

Future<bool> removeUserData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('UserData');
  return true;
}
