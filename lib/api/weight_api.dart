import 'package:tracker/models/weight_model.dart';

import '../mixin/http_middleware.dart';

abstract class WeightApi<T> {
  Future<T> saveWeight(encodedParams);
  Future<T> updateWeight(encodedParams);
  Future<T> getWeightHistory();
}

class UseWeightApi extends HttpMiddleware implements WeightApi {
  @override
  Future<Map<String, dynamic>> saveWeight(encodedParams) async {
    return await withPost('weight/add', encodedParams); 
  }

  @override
  Future<Map<String, dynamic>> updateWeight(encodedParams) async {
    return await withPost('weight/update', encodedParams);
 
  }

  @override
  Future<List<Weight>> getWeightHistory() async {
    List<Weight> weightHistory = [];
    final response = await withGet('weight/history');
    if (response != null) {
      response.map((e) => weightHistory.add(Weight.fromJson(e))).toList();
    }
    return weightHistory;
  }
}

class UseWeightData implements WeightApi {
  @override
  Future<Map<String, dynamic>> saveWeight(encodedParams) async {
    return {'weight': '80', 'time': DateTime.now().toString()};
  }

  @override
  Future<Map<String, dynamic>> updateWeight(encodedParams) async {
    return {'weight': '80', 'time': DateTime.now().toString()};
  }

  @override
  Future<List<Weight>> getWeightHistory() async {
    List<Weight> weightHistory = [];
    weightHistory.add(Weight(weight: '80', time: DateTime.now().toString()));
    weightHistory.add(Weight(weight: '85', time: DateTime.now().toString()));
    weightHistory.add(Weight(weight: '90', time: DateTime.now().toString()));
    return weightHistory;
  }
}
