import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tracker/models/weight_model.dart';

import '../../env_config.dart';

class WeightApi {
  WeightApi._();

  static final instance = WeightApi._();

  static Future<Weight> saveWeight(encodedParams, token) async {
    final response = await http.post(Uri.parse(EnvConfig.API_BASE_URL + 'weight/add'),
        headers: {'Content-Type': 'application/json', 'authorization': token},
        body: encodedParams);

    final responseBody = jsonDecode(response.body);
    if (responseBody['success']) {
      return Weight.fromJson(responseBody['data']);
    }
    throw Exception(responseBody['message']);
  }

  static Future<List<Weight>> getWeightHistory(token) async {
    List<Weight> weightHistory = [];
    final response = await http.get(Uri.parse(EnvConfig.API_BASE_URL + 'weight/history'),
        headers: {'Content-Type': 'application/json', 'authorization': token});
    final responseBody = jsonDecode(response.body);
    if (responseBody['success']) {
      responseBody['data'].map((e) => weightHistory.add(Weight.fromJson(e))).toList();
      return weightHistory;
    }
    throw Exception(responseBody['message']);
  }
}
