import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker/api/user_api.dart';

import '../models/user_model.dart';
import '../transforms/init_store.dart';

class AuthProvider extends ChangeNotifier {
  final SharedPreferences? storage;
  final AuthApi? api;

  User? user;
  bool isAuthenticated = false;
  User? get getUser => user;
  bool get getIsAuthenticated => isAuthenticated;

  AuthProvider({this.api, this.storage}) {
    _loadFromStore();
  }

  void _loadFromStore() {
    var check = storage?.containsKey('user') ?? false;
    if (check) {
      final String? userString = storage?.getString('user');
      Map<String, dynamic> userJson = jsonDecode(userString!);
      user = User.fromJson(userJson);
    }
    isAuthenticated = storage?.getBool('isAuthenticated') ?? false;
    notifyListeners();
  }

  void _saveToStore() {
    final String? userString = jsonEncode(user);
    if (userString != null) storage?.setString('user', userString);
    storage?.setBool('isAuthenticated', isAuthenticated);
  }

  void userSignIn(payload) async {
    try {
      user = await api?.login(payload);
      isAuthenticated = true;
      _saveToStore();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  void userSignup(payload) async {
    try {
      user = await api?.signup(payload);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
