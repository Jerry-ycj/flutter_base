import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapt {

  ScreenAdapt(BuildContext context) {
    /// 屏幕适配初始, 每个需要适配的页面都需要init
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
  }

  num height(num height) {
    return ScreenUtil().setHeight(height);
  }

  num width(num width) {
    return ScreenUtil().setWidth(width);
  }

}
