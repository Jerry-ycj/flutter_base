# flutterbase

flutter app base services and widgets

# Usage

## init config
```dart
/// 在main的build中需要先初始化本库需要的服务端信息
FlutterBase.init(serverUrl: AppConfig.serverUrl);
```
## provider
```dart
void main() => runApp(
  // 全局的store
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserStore(),),
      // other provider
    ],
    child: new MyApp(),
  )
);
```
