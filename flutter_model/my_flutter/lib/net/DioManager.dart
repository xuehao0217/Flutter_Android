import 'package:dio/dio.dart';
import 'dart:convert';
import 'GlobalConfig.dart';
import 'HttpInterceptor.dart';
import 'ResultCode.dart';

/*
 * 网络请求管理类
 */
class DioManager {
  static DioManager _instance = DioManager._internal();

  Dio dio;

  DioManager._internal({String baseUrl}) {
    if (null == dio) {
      dio = new Dio(new BaseOptions(
          baseUrl: GlobalConfig.BASE_URL, connectTimeout: 15000));
      dio.interceptors.add(CommonHeaderInterceptor());
      dio.interceptors.add(LogsInterceptors());
    }
  }

  static DioManager getInstance({String baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  //用于指定特定域名，比如cdn和kline首次的http请求
  DioManager _baseUrl(String baseUrl) {
    if (dio != null) {
      dio.options.baseUrl = baseUrl;
    }
    return this;
  }

  //一般请求，默认域名
  DioManager _normal() {
    if (dio != null) {
      if (dio.options.baseUrl != GlobalConfig.BASE_URL) {
        dio.options.baseUrl = GlobalConfig.BASE_URL;
      }
    }
    return this;
  }

  reset() {
    _instance = null;
  }

  //get请求
  get(String url, Function successCallBack,
      {Map<String, dynamic> params, Function errorCallBack}) async {
    _requstHttp(url, successCallBack, 'get', params, errorCallBack);
  }

  //post请求
  post(String url, params, Function successCallBack,
      {Function errorCallBack}) async {
    _requstHttp(url, successCallBack, "post", params, errorCallBack);
  }

  _requstHttp(String url, Function successCallBack,
      [String method,
      Map<String, dynamic> params,
      Function errorCallBack]) async {
    Response response;
    try {
      if (method == 'get') {
        if (params != null && params.isNotEmpty) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == 'post') {
        if (params != null && params.isNotEmpty) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }
    } on DioError catch (error) {
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      // 请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }

      // debug模式才打印
      if (GlobalConfig.isDebug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
        print('method: ' + dio.options.method);
      }
      _error(errorCallBack, error.message);
      return '';
    }
    // debug模式打印相关数据
    if (GlobalConfig.isDebug) {
      print('请求url: ' + url);
      print('请求头: ' + dio.options.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }
    String dataStr = json.encode(response.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);
    if (dataMap == null || dataMap['state'] == 0) {
      _error(
          errorCallBack,
          '错误码：' +
              dataMap['errorCode'].toString() +
              '，' +
              response.data.toString());
    } else if (successCallBack != null) {
      successCallBack(dataMap);
    }
  }

  _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }
}
