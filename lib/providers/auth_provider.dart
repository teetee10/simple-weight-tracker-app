import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final storage;
  final api;

  User? user;
  bool isAuthenticated = false;
  User? get getUser => user;
  bool get getIsAuthenticated => isAuthenticated;

  AuthProvider({this.storage, this.api}) {
    _loadFromPrefs();
  }

  void _loadFromPrefs() {
    var check = storage?.containsKey('user') ?? false;
    if (check) {
      Map<String, dynamic> userJson = jsonDecode(storage?.getString('user'));
      user = User.fromJson(userJson);
    }
    isAuthenticated = storage?.getBool('isAuthenticated') ?? false;
    notifyListeners();
  }

  void _saveToPrefs() {
    final String? userString = jsonEncode(user);
    if (userString != null) storage?.setString('user', userString);
    storage?.setBool('isAuthenticated', isAuthenticated);
  }

  void userSignIn(context, payload) async {
    try {
      final response = await api.login(payload);
      user = response;
      isAuthenticated = true;
      _saveToPrefs();
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  void userSignup(context, payload) async {
    try {
      final response = await api.signup(payload);
      user = response;
      isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
}
