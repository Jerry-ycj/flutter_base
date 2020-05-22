import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/abstract/exception.dart';
import 'package:flutter_base/constant/config.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading {
  /// fun需要async
  /// fun中不可加入Navigator的pop操作
  static Function use(BuildContext context, Function fun) {
    return () async {
      show(context);
      try {
        await fun();
      } on UserAuthFailException {
        await Navigator.of(context).pushNamed(PageNameConstant.LoginPageName);
      } finally {
        end(context);
      }
    };
  }

  static Future<Null> show(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new Material(
              color: Colors.transparent,
              child: WillPopScope(
                onWillPop: () => new Future.value(false),
                child: Center(
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                    padding: new EdgeInsets.all(4.0),
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      //用一个BoxDecoration装饰器提供背景图片
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                            child:
                                SpinKitDoubleBounce(color: Colors.blue[300])),
//                        new Container(height: 10.0),
//                        new Container(child: new Text(GSYStrings.loading_text, style: GSYConstant.normalTextWhite)),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  static void end(BuildContext context) {
    Navigator.pop(context);
  }
}
