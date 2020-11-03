import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/abstract/exception.dart';

import 'log.dart';

class HttpService {
  static Dio _dio;

  static Dio instance({@required String serverUrl}) {
    if (_dio == null) {
      _dio = new Dio();
      _dio.options.baseUrl = serverUrl;
      _dio.options.connectTimeout = 15000;
      _dio.options.receiveTimeout = 13000;
      var cookieJar = CookieJar();
      _dio.interceptors.add(CookieManager(cookieJar));
    }
    return _dio;
  }

  /// 请求错误即为抛异常
  static post({@required String url, dynamic data}) async {
    Response response;
    if (_dio == null) {
      throw new BaseRequestException("网络参数serverUrl未配置");
    }
    try {
      if (data != null) {
        response = await _dio.post(url, data: new FormData.fromMap(data));
      } else {
        response = await _dio.post(url);
      }
      var ret = new Map<String, dynamic>.from(response.data)["data"];
      if (ret == null) ret = new Map();
      return ret;
    } on DioError catch (e) {
      if (e.response != null &&
          e.response.data != null &&
          new Map<String, dynamic>.from(e.response.data)["result"] == 2) {
        throw new UserAuthFailException();
      } else if (e.response != null && e.response.data != null) {
        throw new BaseRequestException(
            new Map<String, dynamic>.from(e.response.data)["message"]);
      } else {
        Log.print("request error: " + e.message);
        throw new BaseRequestException("网络错误: " + e.message);
      }
    }
  }
}
