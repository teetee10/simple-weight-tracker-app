import 'package:flutter/material.dart';
import 'package:tracker/providers/provider.dart';
import 'package:tracker/transforms/init_store.dart';

import '../api/weight_api.dart';
import '../models/weight_model.dart'; 

class WeightProvider extends ChangeNotifier implements AppProvider {
  @override
  final AppStore? storage;
  @override
  final WeightApi? api;
  @override
  AppState? appState;

  List<Weight>? weightHistory = [];
  WeightProvider({this.storage, this.api});

  void setWeightHistory(List<Weight> weight) {
    weightHistory = weight;
    notifyListeners();
  }

  Future<void> addToWeightHistory(weight) async { 
    weightHistory?.add(Weight.fromJson(weight));
    notifyListeners();
    _addWeight(weight);
  }

  void fetchWeightHistory() async {
    try {
      final response = await api?.getWeightHistory();
      setWeightHistory(response!);
    } catch (e) {
      throw e.toString();
    }
  }

  void updateWeightHistory(payload) async {
    try {
      await api?.updateWeight(payload);
    } catch (e) {
      throw e.toString();
    } finally {
      notifyListeners();
    }
  }

  void _addWeight(payload) async {
    try {
      await api?.saveWeight(payload);
    } catch (e) {
      weightHistory?.removeLast();
      throw e.toString();
    }
  }

  @override
  void loadFromStore() {
    // TODO: implement loadFromStore
  }
}
