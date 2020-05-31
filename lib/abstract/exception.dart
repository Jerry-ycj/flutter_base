/// 基本请求异常
class BaseRequestException implements Exception {
  String _msg;

  BaseRequestException(String msg) {
    this._msg = msg;
  }

  get msg => _msg;
}

/// 用户权限异常
class UserAuthFailException implements Exception {
  UserAuthFailException();
}
