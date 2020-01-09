
import 'dart:async';

import 'package:dio/dio.dart';

class CommonHeaderInterceptor extends Interceptor {
  @override
  Future<FutureOr> onRequest(RequestOptions options) async {
    options.headers.addAll({
      "deviceId":"123444",
      "requestId":"ddfsgg"
    });
    return super.onRequest(options);
  }
}


class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    print(
        "\n================================= 请求数据 =================================");
    print("method = ${options.method.toString()}");
    print("url = ${options.uri.toString()}");
    print("headers = ${options.headers}");
    print("params = ${options.queryParameters}");

    return super.onRequest(options);
  }

  @override
  onResponse(Response response) {
    if (response != null) {
      var responseStr = response.toString();
    }
//    print(
//        "\n================================= 响应数据开始 =================================");
    print("code = ${response.statusCode}");
    print("data = ${response.data}");
    print(
        "================================= 响应数据结束 =================================\n");
    return super.onResponse(response); // continue
  }

  @override
  onError(DioError err) {
    print(
        "\n=================================错误响应数据 =================================");
    print("type = ${err.type}");
    print("message = ${err.message}");
    print("\n");
    return super.onError(err);
  }
}
