import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
      _isonboarding = prefs.getBool('ff_isonboarding') ?? _isonboarding;
    });
    _safeInit(() {
      _messname = prefs.getString('ff_messname') ?? _messname;
    });
    _safeInit(() {
      _jsondata = prefs.getStringList('ff_jsondata')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _jsondata;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isonboarding = false;
  bool get isonboarding => _isonboarding;
  set isonboarding(bool _value) {
    _isonboarding = _value;
    prefs.setBool('ff_isonboarding', _value);
  }

  String _messname = '';
  String get messname => _messname;
  set messname(String _value) {
    _messname = _value;
    prefs.setString('ff_messname', _value);
  }

  List<dynamic> _jsondata = [];
  List<dynamic> get jsondata => _jsondata;
  set jsondata(List<dynamic> _value) {
    _jsondata = _value;
    prefs.setStringList(
        'ff_jsondata', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToJsondata(dynamic _value) {
    _jsondata.add(_value);
    prefs.setStringList(
        'ff_jsondata', _jsondata.map((x) => jsonEncode(x)).toList());
  }

  void removeFromJsondata(dynamic _value) {
    _jsondata.remove(_value);
    prefs.setStringList(
        'ff_jsondata', _jsondata.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromJsondata(int _index) {
    _jsondata.removeAt(_index);
    prefs.setStringList(
        'ff_jsondata', _jsondata.map((x) => jsonEncode(x)).toList());
  }

  void updateJsondataAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _jsondata[_index] = updateFn(_jsondata[_index]);
    prefs.setStringList(
        'ff_jsondata', _jsondata.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInJsondata(int _index, dynamic _value) {
    _jsondata.insert(_index, _value);
    prefs.setStringList(
        'ff_jsondata', _jsondata.map((x) => jsonEncode(x)).toList());
  }

  final _homepageManager = StreamRequestManager<List<MessRecord>>();
  Stream<List<MessRecord>> homepage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MessRecord>> Function() requestFn,
  }) =>
      _homepageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHomepageCache() => _homepageManager.clear();
  void clearHomepageCacheKey(String? uniqueKey) =>
      _homepageManager.clearRequest(uniqueKey);

  final _menupageManager = StreamRequestManager<MessRecord>();
  Stream<MessRecord> menupage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<MessRecord> Function() requestFn,
  }) =>
      _menupageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMenupageCache() => _menupageManager.clear();
  void clearMenupageCacheKey(String? uniqueKey) =>
      _menupageManager.clearRequest(uniqueKey);

  final _indexpageManager = StreamRequestManager<List<MessRecord>>();
  Stream<List<MessRecord>> indexpage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MessRecord>> Function() requestFn,
  }) =>
      _indexpageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearIndexpageCache() => _indexpageManager.clear();
  void clearIndexpageCacheKey(String? uniqueKey) =>
      _indexpageManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
