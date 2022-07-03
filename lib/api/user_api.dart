import '../mixin/http_middleware.dart';

abstract class AuthApi<T> {
  Future<T> login(encodedParams);
  Future<T> signup(encodedParams);
}

class UseAuthApi extends HttpMiddleware implements AuthApi {
  @override
  Future<Map<String, dynamic>> login(encodedParams) async {
    return await withPost('auth/login', encodedParams);
  }

  @override
  Future<Map<String, dynamic>> signup(encodedParams) async {
    return await withPost('auth/signup', encodedParams);
  }
}

class UseAuthData extends AuthApi {
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
