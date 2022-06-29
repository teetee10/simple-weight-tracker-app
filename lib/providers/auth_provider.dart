import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/user_api.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  late SharedPreferences storage;
  late User user;

  User get getUser => user;
  bool get getIsAuthenticated => isAuthenticated;
  AuthProvider({required this.storage}) {
    _loadFromPrefs();
  }

  void _loadFromPrefs() {
    final String? storedUser = storage.getString('user') ?? null; 
    if (storedUser != null) {
      Map<String, dynamic> userJson = jsonDecode(storedUser);
      user = User.fromJson(userJson);
    }
    isAuthenticated = storage.getBool('isAuthenticated') ?? false;
    notifyListeners();
  }

  void _saveToPrefs() {
    final String? userString = jsonEncode(user);
    if (userString != null) storage.setString('user', userString);
    storage.setBool('isAuthenticated', isAuthenticated);
  }

  void signIn(context, payload) async {
    try {
      final user = await UserApi.userLogin(payload);
      this.user = user;
      isAuthenticated = true;
      _saveToPrefs();
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  void signUp(context, payload) async {
    try {
      final user = await UserApi.userSignup(payload);
      this.user = user;
      isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
}
