import 'dart:convert';

import 'package:flutter/material.dart';

import '../api/user_api.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  late User user;

  User get getUser => user;
  bool get getIsAuthenticated => isAuthenticated;

  void signIn(context, payload) async {
    try {
      final user = await UserApi.userLogin(payload);
      this.user = user;
      isAuthenticated = true;
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
