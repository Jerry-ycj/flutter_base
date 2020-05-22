import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonDialog {
  static Future<bool> simple({
    @required BuildContext context,
    @required String msg,
    IconData icon,
    String title,
  }) {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              content: new Text(msg),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text("取消")),
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: new Text("确定"))
              ],
            ));
  }
}
