import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class Store {
  Future<bool> setEncodedString(key, Map<String, dynamic> arg);
  Future<dynamic> getDecodedString(key);
}

class AppStore implements Store, SharedPreferences {
  static late final SharedPreferences storage;

  static Future init() async {
    storage = await SharedPreferences.getInstance();
  }

  @override
  Future<dynamic> getDecodedString(key) async {
    try {
      final savedString = storage.getString(key);
      final json = jsonDecode(savedString!);
      return json;
    } catch (e) {
      throw "storage key:$key does not exist";
    }
  }

  @override
  Future<bool> setEncodedString(key, payload) async {
    final String? savedString = jsonEncode(payload);
    if (savedString == null) return Future.value(false);
    return await storage.setString(key, savedString);
  }

  @override
  Future<bool> setBool(key, payload) {
    return storage.setBool(key, payload);
  }

  @override
  bool? getBool(String key) {
    return storage.getBool(key);
  }

  @override
  Future<bool> setString(String key, String value) {
    return storage.setString(key, value);
  }

  @override
  String? getString(String key) {
    return storage.getString(key);
  }

  @override
  Future<bool> clear() {
     return storage.clear();
  }

  @override
  Future<bool> commit() {
    // TODO: implement commit
    throw UnimplementedError();
  }

  @override
  bool containsKey(String key) {
    return storage.containsKey(key);
  }

  @override
  Object? get(String key) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  double? getDouble(String key) {
    // TODO: implement getDouble
    throw UnimplementedError();
  }

  @override
  int? getInt(String key) {
    // TODO: implement getInt
    throw UnimplementedError();
  }

  @override
  Set<String> getKeys() {
    // TODO: implement getKeys
    throw UnimplementedError();
  }

  @override
  List<String>? getStringList(String key) {
    // TODO: implement getStringList
    throw UnimplementedError();
  }

  @override
  Future<void> reload() {
    // TODO: implement reload
    throw UnimplementedError();
  }

  @override
  Future<bool> remove(String key) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<bool> setDouble(String key, double value) {
    // TODO: implement setDouble
    throw UnimplementedError();
  }

  @override
  Future<bool> setInt(String key, int value) {
    // TODO: implement setInt
    throw UnimplementedError();
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    // TODO: implement setStringList
    throw UnimplementedError();
  }
}
