import 'dart:convert';

import '../mixin/http_middleware.dart';
import '../models/user_model.dart';

class UserApi extends HttpMiddleware {

  Future<User> login(encodedParams) async {
    final response = await asPost('auth/login', encodedParams);
    final responseBody = jsonDecode(response.body);
    if (responseBody['success']) {
      return User.fromJson(responseBody['data']);
    }
    throw Exception(responseBody['message']);
  }

  Future<User> signup(encodedParams) async {
    final response = await asPost('auth/signup', encodedParams);
    final responseBody = jsonDecode(response.body);
    if (responseBody['success']) {
      return User.fromJson(responseBody['data']);
    }
    throw Exception(responseBody['message']);
  }
}
