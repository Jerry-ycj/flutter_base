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
  double _width = 750;
  double _height = 1334;

  num height(num height) {
    return ScreenUtil().setHeight(height);
  }

  num width(num width) {
    return ScreenUtil().setWidth(width);
  }

  // percent
  num heightP(double percent) {
    return ScreenUtil().setHeight(_height * percent / 100);
  }

  // percent
  num widthP(double percent) {
    return ScreenUtil().setWidth(_width * percent / 100);
  }
}
