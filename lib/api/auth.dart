import '../mixin/http.dart';

abstract class Auth<T> {
  Future<T> login(encodedParams);
  Future<T> signup(encodedParams);
}

class AuthApi extends HttpMiddleware implements Auth {
  @override
  Future<Map<String, dynamic>?> login(encodedParams) async {
    return await withPost('auth/login', encodedParams);
  }

  @override
  Future<Map<String, dynamic>?> signup(encodedParams) async {
    return await withPost('auth/signup', encodedParams);
  }
}

class AuthData extends Auth {
  @override
  Future<Map<String, dynamic>> login(encodedParams) async {
    return Future.delayed(const Duration(seconds: 2),
        () => {'token': '1111', 'name': 'John Doe', 'email': 'test@email.com'});
  }

  @override
  Future<Map<String, dynamic>> signup(encodedParams) async {
    return {'name': 'John Doe', 'email': '', 'password': '1111'};
  }
}
