import 'dart:convert';

import 'package:http/http.dart';

import '../env_config.dart';
import '../transforms/init_store.dart';

class HttpMiddleware {
  HttpMiddleware() {
    headerWithToken();
  }

  final String _baseUrl = EnvConfig.API_BASE_URL;
  Map<String, String> header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> headerWithToken() async {
    final check = StoreInit.instance.containsKey('user');
    if (check) {
      final user = jsonDecode(StoreInit.instance.getString('user')!);
      header['Authorization'] = 'Bearer ${user['token']}';
    }
  }

  Future<dynamic> asPost(url, encodedParams) async {
    final response =
        await post(Uri.parse(_baseUrl + url), headers: header, body: encodedParams);
    final responseBody = jsonDecode(response.body); 
    return responseBody;
  }

  Future<dynamic> asGet(url, [encodedParams]) async {
    final response = await get(
      Uri.parse(_baseUrl + url),
      headers: header,
    );
    final responseBody = jsonDecode(response.body); 
    return responseBody;
  }
}
