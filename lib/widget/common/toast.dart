import 'package:flutter/material.dart';
import 'package:flutter_base/constant/color.dart';

class Toast {
  /// 发起者所在的组件必须使用在Scaffold中
  /// 并且 注意在Scaffold body中 builder wrap the context
  static infoSnack({@required String msg, BuildContext context}) {
    if (msg == null) return;
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Row(
        children: <Widget>[
          Icon(
            Icons.check,
            color: Colors.green,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(msg, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      duration: Duration(seconds: 1),
      action: SnackBarAction(
        label: '关闭',
        textColor: Colors.white70,
        onPressed: () {},
      ),
    ));
  }

  /// 发起者所在的组件必须使用在Scaffold中
  /// 并且 注意在Scaffold body中 builder wrap the context
  static errorSnack({@required String msg, BuildContext context}) {
    if (msg == null) return;
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: AppBaseColor.red5,
      content: Row(
        children: <Widget>[
          Icon(
            Icons.error,
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(msg, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: '关闭',
        textColor: Colors.white70,
        onPressed: () {},
      ),
    ));
//    Fluttertoast.showToast(
//      msg: msg,
//      textColor: Colors.white,
//      backgroundColor: AppColor.red5,
//      gravity: ToastGravity.BOTTOM,
//        webShowClose: true
//    );
  }

  /// dialog方式
  /// 注意：请勿在loading中使用，pop会影响，异常处理在loading外层。
  static Future<dynamic> errorDialog(
      {@required String msg, @required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '出错啦',
              style: TextStyle(color: AppBaseColor.red5),
            ),
            content: Text(msg),
            actions: <Widget>[
              FlatButton(
                child: Text('确认'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  static Future<dynamic> infoDialog(
      {@required String msg, @required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '信息',
              style: TextStyle(color: AppBaseColor.green5),
            ),
            content: Text(msg),
            actions: <Widget>[
              FlatButton(
                child: Text('确认'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }
}
