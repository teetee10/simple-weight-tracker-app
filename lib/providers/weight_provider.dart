import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/weight_api.dart';
import '../models/weight_model.dart';

class WeightProvider extends ChangeNotifier {
  final SharedPreferences? storage;
  final WeightApi? api;

  List<Weight>? weightHistory = [];
  List<Weight>? get getWeightHistory => weightHistory;

  WeightProvider({this.storage, this.api});

  void setWeightHistory(List<Weight> weight) {
    weightHistory = weight;
    notifyListeners();
  }

  void addToWeightHistory(Weight weight) {
    weightHistory?.add(weight);
    notifyListeners();
  }

  void fetchWeightHistory(context) async {
    try {
      final response = await api?.getWeightHistory();
      setWeightHistory(response!);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  void updateWeightHistory(context, payload) async {
    try {
      final weight = await api?.updateWeight(payload);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('updated weight'),
      ));
      addToWeightHistory(weight!);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  void addWeight(context, payload) async {
    try {
      final weight = await api?.saveWeight(payload);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Added weight'),
      ));
      addToWeightHistory(weight!);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
}
