import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class StorageProvider {
  static final StorageProvider _storageProvider =
      new StorageProvider._internal();

  StorageProvider._internal();

  factory StorageProvider() {
    return _storageProvider;
  }

  Future<String> getItem(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

  Future<bool> setItem(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, value);
  }

  Future<bool> removeItem(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.remove(key);
  }

  Future<bool> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.clear();
  }
}
