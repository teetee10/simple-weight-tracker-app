import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/providers/auth_provider.dart';

import '../api/weight_api.dart';
import '../models/weight_model.dart';

class WeightProvider extends ChangeNotifier {
  List<Weight> weightHistory = [];
  List<Weight> get getWeightHistory => weightHistory;

  void setWeightHistory(List<Weight> weight) {
    weightHistory = weight;
    notifyListeners();
  }

  void addToWeightHistory(Weight weight) {
    weightHistory.add(weight);
    notifyListeners();
  }

// refactor -> utils
  String getToken(context) {
    final userProvider = Provider.of<AuthProvider>(context, listen: false);
    return 'Bearer ${userProvider.user.token}';
  }

  void fetchWeightHistory(context) async {
    try {
      final token = getToken(context);
      final response = await WeightApi.getWeightHistory(token);
      setWeightHistory(response);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  void addWeight(context, payload) async {
    try {
      final token = getToken(context);
      final weight = await WeightApi.saveWeight(payload, token);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Added weight'),
      ));
      addToWeightHistory(weight);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
}
