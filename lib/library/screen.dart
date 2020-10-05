import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapt {
  double _width = 750;
  double _height = 1334;

  ScreenAdapt(BuildContext context) {
    /// 屏幕适配初始, 每个需要适配的页面都需要init
    ScreenUtil.init(context,
        designSize: Size(_width, _height), allowFontScaling: false);
  }

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
