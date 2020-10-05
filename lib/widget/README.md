# widget

## dialog

```dart
var ret = await CommonDialog.use(context: context, msg: "msg");
// ret == false / true;
```

## loading

```dart
await Loading.use(context, () async {
    // 注：内部不可再使用Navigator
})();
```

## select 单选/多选dialog

## toast