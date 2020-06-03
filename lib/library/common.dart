import 'package:flutter/material.dart';
import 'package:flutter_base/widget/common/dialog.dart';
import 'package:flutter_base/widget/common/toast.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class Common {
  ///版本更新
  static Future upgrade(BuildContext context, int buildNumber,
      String versionName, String url) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int old = int.parse(packageInfo.buildNumber);
    if (buildNumber != null && buildNumber > old) {
      var ret = await CommonDialog.simple(
          context: context, msg: "发现新版本 ${versionName}, 是否前往下载？");
      if (ret != null && ret) {
        launch(url);
      }
    } else {
      await Toast.infoDialog(msg: "当前无新版本", context: context);
    }
  }
}
