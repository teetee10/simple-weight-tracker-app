import 'package:flutter/foundation.dart';
import 'package:tracker/api/user_api.dart';
import 'package:tracker/providers/provider.dart';
import 'package:tracker/transforms/init_store.dart';

import '../models/user_model.dart';
import 'preference_provider.dart';

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
    loadFromStore();
  }

  @override
  void loadFromStore() async {
    try {
      final _user = await storage?.getDecodedString('user');
      isAuthenticated = storage?.getBool('isAuthenticated') ?? false;
      user = User.fromJson(_user);
    } catch (e) {
      if (kDebugMode) {
        print('store is empty');
      }
    } finally {
      notifyListeners();
    }
  }

  _updateAppState(AppState _appState) {
    appState = _appState;
    notifyListeners();
  }

  clear() async {
    isAuthenticated = false;
    await storage?.clear();
    notifyListeners();
  }

  void userSignIn(payload) async {
    _updateAppState(AppState.isFetching);
    try {
      final response = await api?.login(payload);
      isAuthenticated = true;
      user = User.fromJson(response);
      storage?.setBool('isAuthenticated', isAuthenticated);
      storage?.setEncodedString('user', response);
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
