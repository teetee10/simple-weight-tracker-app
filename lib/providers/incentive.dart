

import 'package:flutter/material.dart';

import '../api/index.dart';
import '../models/index.dart';
import '../transforms/index.dart';
import 'index.dart';

class IncentiveProvider extends ChangeNotifier implements AppProvider {
  @override
  final Api? api;
  @override
  final AppStore? storage;

  Incentive? incentive;
  IncentiveProvider({
    this.api,
    this.storage,
  });
  @override
  AppState? appState;
}
