import '../mixin/http_middleware.dart';
import '../models/user_model.dart';

class UserApi extends HttpMiddleware {
  Future<User> login(encodedParams) async {
    final response = await asPost('auth/login', encodedParams);
    if (response['success']) {
      return User.fromJson(response['data']);
    }
    throw Exception(response['message']);
  }

  Future<User> signup(encodedParams) async {
    final response = await asPost('auth/signup', encodedParams);
    if (response['success']) {
      return User.fromJson(response['data']);
    }
    throw Exception(response['message']);
  }
}
