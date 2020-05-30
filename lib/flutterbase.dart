library flutter_base;

import 'package:flutter/material.dart';
import 'package:flutter_base/library/http.dart';
import 'package:flutter_base/library/log.dart';

/// base 的初始化
class FlutterBase {
  static init({@required String serverUrl}) {
    Log.print("base core init");
    HttpService.instance(serverUrl: serverUrl);
  }
}

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
