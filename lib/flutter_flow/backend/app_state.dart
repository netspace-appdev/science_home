import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();


  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _UserId = prefs.getString('ff_UserId') ?? _UserId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  // UserId
  String _UserId = '';

  String get UserId => _UserId;

  set UserId(String _value) {
    _UserId = _value;
    prefs.setString('ff_UserId', _value);
  }

  Future<void> deleteUserId() async {
    _UserId = '';
    await prefs.remove('ff_UserId');
    notifyListeners(); // To update UI if necessary
  }

  void _safeInit(Function() initializeField) {
    try {
      initializeField();
    } catch (_) {}
  }

  Future _safeInitAsync(Function() initializeField) async {
    try {
      await initializeField();
    } catch (_) {}
  }
}
