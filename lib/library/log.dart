import 'package:flutter/cupertino.dart';

class Log {
  static print(Object msg) {
    var date = new DateTime.now();
    String timestamp =
        "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}.${date.millisecond.toString().padLeft(3, '0')}";
    debugPrint(timestamp + " " + msg.toString());
  }
}
