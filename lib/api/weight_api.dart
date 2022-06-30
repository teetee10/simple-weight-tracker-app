import 'dart:convert';

import 'package:tracker/models/weight_model.dart';

import '../mixin/http_middleware.dart';

class WeightApi extends HttpMiddleware {
  Future<Weight> saveWeight(encodedParams) async {
    final response = await asPost('weight/add', encodedParams);
    final responseBody = jsonDecode(response.body);
    if (responseBody['success']) {
      return Weight.fromJson(responseBody['data']);
    }
    throw Exception(responseBody['message']);
  }

  Future<Weight> updateWeight(encodedParams) async {
    final response = await asPost('weight/update', encodedParams);
    final responseBody = jsonDecode(response.body);
    if (responseBody['success']) {
      return Weight.fromJson(responseBody['data']);
    }
    throw Exception(responseBody['message']);
  }

  Future<List<Weight>> getWeightHistory() async {
    List<Weight> weightHistory = [];
    final response = await asGet('weight/history');
    final responseBody = jsonDecode(response.body);
    if (responseBody['success'] && responseBody['data'] != null) {
      responseBody['data'].map((e) => weightHistory.add(Weight.fromJson(e))).toList();
    }
    return weightHistory;
  }
}
