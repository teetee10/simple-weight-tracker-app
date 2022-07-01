import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker/constants.dart';

import '../api/user_api.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final SharedPreferences? storage;
  final UserApi?  api;

  User? user;
  bool isAuthenticated = false;
  User? get getUser => user;
  bool get getIsAuthenticated => isAuthenticated;

  AuthProvider({this.storage, this.api}) {
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

  void userSignIn(context, payload) async {
    try {
      final response = await api?.login(payload);
      user = response;
      isAuthenticated = true;
      _saveToStore();
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  void userSignup(context, payload) async {
    try {
      final response = await api?.signup(payload);
      user = response;
      Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
}
