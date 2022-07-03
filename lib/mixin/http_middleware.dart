import 'dart:convert';

import 'package:http/http.dart';

import '../env_config.dart';
import '../transforms/store.dart';

class HttpMiddleware {
  final String _baseUrl = EnvConfig.API_BASE_URL;
  Map<String, String> header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  void _refreshHeader() {
    final keyExists = AppStore.storage.containsKey('auth');
    if (keyExists) {
      final user = jsonDecode(AppStore.storage.getString('auth')!);
      header['Authorization'] = 'Bearer ${user['token']}';
    }
  }

  dynamic getResponseData(response) {
    final responseBody = jsonDecode(response.body);
    if (responseBody['success']) {
      return responseBody['data'];
    }
    throw responseBody['message'];
  }

  Future<dynamic> withPost(url, encodedParams) async {
    _refreshHeader();
    final response = await post(Uri.parse(_baseUrl + url),
        headers: header, body: jsonEncode(encodedParams));
    return getResponseData(response);
  }

  Future<dynamic> withGet(url, [encodedParams]) async {
    _refreshHeader();
    final response = await get(
      Uri.parse(_baseUrl + url),
      headers: header,
    );
 
    return getResponseData(response);
  }
}
