import 'package:flutter/material.dart';
import 'package:tracker/providers/type.dart';
import 'package:tracker/transforms/store.dart';

import '../api/wieght.dart';
import '../models/weight.dart';

class WeightProvider extends ChangeNotifier implements AppProvider {
  @override
  final AppStore? storage;
  @override
  final WeightApi? api;
  @override
  AppState? appState;

  List<Weight> weightHistory = [];
  WeightProvider({this.storage, this.api});

  void setWeightHistory(List<Weight> weight) {
    weightHistory = weight;
    notifyListeners();
  }

  Future<void> addToWeightHistory(weight) async {
    weightHistory.add(Weight.fromJson(weight));
    notifyListeners();
    await _createWeight(weight);
  }

  Future<void> fetchWeightHistory() async {
    try {
      final response = await api?.getWeightHistory();
      setWeightHistory(response!);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateWeightHistory(payload) async {
    try {
      await api?.updateWeight(payload);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> _createWeight(payload) async {
    try {
      await api?.saveWeight(payload);
    } catch (e) {
      weightHistory.removeLast();
      throw e.toString();
    }
  }
}
