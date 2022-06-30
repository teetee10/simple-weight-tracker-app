import 'dart:convert';

import 'package:tracker/models/weight_model.dart';

import '../mixin/http_middleware.dart';

class WeightApi extends HttpMiddleware {
  
  Future<Weight> saveWeight(encodedParams) async {
    final response = await asPost('weight/add', encodedParams); 
    if (response['success']) {
      return Weight.fromJson(response['data']);
    }
    throw Exception(response['message']);
  }

  Future<Weight> updateWeight(encodedParams) async {
    final response = await asPost('weight/update', encodedParams); 
    if (response['success']) {
      return Weight.fromJson(response['data']);
    }
    throw Exception(response['message']);
  }

  Future<List<Weight>> getWeightHistory() async {
    List<Weight> weightHistory = [];
    final response = await asGet('weight/history'); 
    if (response['success'] && response['data'] != null) {
      response['data'].map((e) => weightHistory.add(Weight.fromJson(e))).toList();
    }
    return weightHistory;
  }
}
