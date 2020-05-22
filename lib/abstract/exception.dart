class BaseRequestException implements Exception {
  String _msg;

  BaseRequestException(String msg) {
    this._msg = msg;
  }

  get msg => _msg;
}

class UserAuthFailException implements Exception {
  UserAuthFailException();
}
