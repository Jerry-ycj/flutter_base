import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 采用以下方式
 * return ScreenUtilInit(
    designSize: Size(360, 690),
    allowFontScaling: false,
    builder: () => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter_ScreenUtil',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    home: HomePage(title: 'FlutterScreenUtil Demo'),
    ),
    );
 */

class ScreenAdapt {
  static double widthVal = 750;
  static double heightVal = 1334;

  static Size size() {
    return Size(widthVal, heightVal);
  }

  static num height(num height) {
    return ScreenUtil().setHeight(height);
  }

  static num width(num width) {
    return ScreenUtil().setWidth(width);
  }

  // percent
  static num heightP(double percent) {
    return ScreenUtil().setHeight(heightVal * percent / 100);
  }

  // percent
  static num widthP(double percent) {
    return ScreenUtil().setWidth(widthVal * percent / 100);
  }
}
