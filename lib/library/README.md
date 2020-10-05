# library

## http
应用于项目的dao中。
HttpService请求错误则会抛出`UserAuthFailException`或`BaseRequestException`异常，需要外部catch处理。

```dart
try {
  await Loading.use(context, () async {
    await DemoDao.demo();
  })();
  setState(() {
    // sth
  });
} on BaseRequestException catch (e) {
  await Toast.errorDialog(msg: e.msg, context: context);
}
```

## screen
屏幕宽高通用的尺寸设置。
依赖：flutter_screenutil

https://github.com/OpenFlutter/flutter_screenutil/blob/master/README_CN.md