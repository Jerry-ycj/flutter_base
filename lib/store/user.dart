import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_base/library/storage.dart';

class UserStore with ChangeNotifier {
  Map _user;
  String _token;
  bool _autoLogin;
  String _pwd;
  String _username;
  DateTime _dt;

  init() async {
    var json = await LocalStorage.get("user");
    if (json != null) {
      _user = jsonDecode(json);
    }
    _token = await LocalStorage.get("token");
    _username = await LocalStorage.get("username");
    _pwd = await LocalStorage.get("pwd");
    _autoLogin = await LocalStorage.get("autoLogin") ?? false;
    int dt0 = await LocalStorage.get("dt");
    _dt = dt0 == null ? null : new DateTime.fromMillisecondsSinceEpoch(dt0);
  }

  save({Map u, String t, bool al, String username, String pwd}) {
    if (u != null) {
      _user = u;
      LocalStorage.setString("user", jsonEncode(_user));
    }
    if (t != null) {
      _token = t;
      LocalStorage.setString("token", _token);
    }
    if (username != null) {
      _username = username;
      LocalStorage.setString("username", _username);
    }
    if (pwd != null) {
      _pwd = pwd;
      LocalStorage.setString("pwd", _pwd);
    }
    if (al != null) {
      _autoLogin = al;
      LocalStorage.setBool("autoLogin", _autoLogin);
    }
    _dt = new DateTime.now();
    LocalStorage.setInt("dt", _dt.millisecondsSinceEpoch);
    notifyListeners();
  }

  void clear() {
    _token = null;
    _user = null;
    _autoLogin = false;
    _username = null;
    _pwd = null;
    _dt = null;
    LocalStorage.remove("user");
    LocalStorage.remove("token");
    LocalStorage.remove("autoLogin");
    LocalStorage.remove("username");
    LocalStorage.remove("pwd");
    LocalStorage.remove("dt");
  }

  get user => _user;

  get token => _token;

  get autoLogin => _autoLogin;

  get username => _username;

  get pwd => _pwd;

  get dt => _dt;
}
