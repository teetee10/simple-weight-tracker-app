import '../mixin/http.dart';

abstract class Temp<T> {
  Future<T> login(encodedParams);
  Future<T> signup(encodedParams);
}

class TempApi extends HttpMiddleware implements Temp {
  @override
  Future login(encodedParams) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future signup(encodedParams) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}

class TempData extends Temp {
  @override
  Future login(encodedParams) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future signup(encodedParams) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
