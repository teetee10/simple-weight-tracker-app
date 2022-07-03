import 'package:flutter/foundation.dart';
import 'package:tracker/api/user_api.dart';
import 'package:tracker/providers/provider.dart';
import 'package:tracker/transforms/init_store.dart';

import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier implements AppProvider {
  @override
  final AppStore? storage;
  @override
  final AuthApi? api;
  @override
  AppState? appState = AppState.idle;

  User? user;
  bool isAuthenticated = false;

  AuthProvider({this.api, this.storage}) {
    _loadFromStore();
  }

  _updateAppState(AppState _appState) {
    appState = _appState;
    notifyListeners();
  }

  void _loadFromStore() async {
    try {
      user = User.fromJson(await storage?.getDecodedString('user'));
      isAuthenticated = storage?.getBool('isAuthenticated') ?? false;
    } finally {
      notifyListeners();
    }
  }

  void _saveToStore() {
    try {
      storage?.setBool('isAuthenticated', isAuthenticated);
      storage?.setEncodedString('user', user!.toJson());
    } finally {
      notifyListeners();
    }
  }

   logout() async {
    isAuthenticated = false;
    await storage?.clear();
    notifyListeners();
  }

  void userSignIn(payload) async {
    _updateAppState(AppState.isFetching);
    try {
      user = User.fromJson(await api?.login(payload));
      isAuthenticated = true;
      _saveToStore();
    } catch (e) {
      throw e.toString();
    } finally {
      _updateAppState(AppState.idle);
    }
  }

  void userSignup(payload) async {
    _updateAppState(AppState.isFetching);
    try {
      await api?.signup(payload);
    } catch (e) {
      throw e.toString();
    } finally {
      _updateAppState(AppState.idle);
    }
  }
}
