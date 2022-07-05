import 'package:flutter/material.dart';

import '../api/index.dart';
import '../transforms/index.dart';
import 'index.dart';

class TempProvider extends ChangeNotifier implements AppProvider {
  @override
  final Api? api;
  @override
  final AppStore? storage;

  TempProvider({
    this.api,
    this.storage,
  });
  @override
  AppState? appState;
}
