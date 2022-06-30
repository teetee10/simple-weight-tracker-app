import 'dart:convert';

import 'package:http/http.dart';

import '../env_config.dart';
import '../transforms/init_store.dart';

class HttpMiddleware {
  HttpMiddleware() {
    refreshHeader();
  }

  final String _baseUrl = EnvConfig.API_BASE_URL;
  Map<String, String> header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> refreshHeader() async {
    final check = StoreInit.instance.containsKey('user');
    if (check) {
      final user = jsonDecode(StoreInit.instance.getString('user')!);
      header['Authorization'] = 'Bearer ${user['token']}';
    }
  }

  Future<Response> asPost(url, encodedParams) async {
    return await post(Uri.parse(_baseUrl + url), headers: header, body: encodedParams);
  }

  Future<Response> asGet(url, [encodedParams]) async {
    return await get(
      Uri.parse(_baseUrl + url),
      headers: header,
    );
  }
}
