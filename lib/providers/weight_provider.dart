import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/providers/auth_provider.dart';

import '../models/weight_model.dart';

class WeightProvider extends ChangeNotifier {
  final storage;
  final api;

  List<Weight> weightHistory = [];
  List<Weight> get getWeightHistory => weightHistory;

  WeightProvider({this.storage, this.api});

  void setWeightHistory(List<Weight> weight) {
    weightHistory = weight;
    notifyListeners();
  }

  void addToWeightHistory(Weight weight) {
    weightHistory.add(weight);
    notifyListeners();
  }

  void fetchWeightHistory(context) async {
    try {
      final response = await api.getWeightHistory();
      setWeightHistory(response);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  void updateWeightHistory(context, payload) async {
    try {
      final weight = await api.updateWeight(payload);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('updated weight'),
      ));
      addToWeightHistory(weight);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  void addWeight(context, payload) async {
    try {
      final weight = await api.saveWeight(payload);
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
