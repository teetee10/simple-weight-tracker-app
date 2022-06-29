import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../env_config.dart';
import '../models/user_model.dart';

class UserApi {
  UserApi._();

  static final instance = UserApi._();

  static Future<User> userLogin(encodedParams) async {
    final response = await http.post(Uri.parse(EnvConfig.API_BASE_URL + 'auth/login'),
        headers: {'Content-Type': 'application/json'}, body: encodedParams);
    final responseBody = jsonDecode(response.body);
    if (responseBody['success']) {
      return User.fromJson(responseBody['data']);
    }
    throw Exception(responseBody['message']);
  }

  static Future<User> userSignup(encodedParams) async {
    final response = await http.post(Uri.parse(EnvConfig.API_BASE_URL + 'auth/signup'),
        headers: {'Content-Type': 'application/json'}, body: encodedParams);
    final responseBody = jsonDecode(response.body);
    if (responseBody['success']) {
      return User.fromJson(responseBody['data']);
    }
    throw Exception(responseBody['message']);
  }
}
