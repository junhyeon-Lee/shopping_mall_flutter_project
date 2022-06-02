import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('📲📲 DIO-REQUEST[method: ${options.method}] => PATH: ${options.path}');
    debugPrint('📲📲 DIO-REQUEST[queryParameters: ${options.queryParameters}]');
    debugPrint('📲📲 DIO-REQUEST[data: ${options.data}]');
    debugPrint('📲📲 DIO-REQUEST[headers: ${options.headers}]');
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint('🐝🐝 DIO-RESPONSE[statusCode: ${response.statusCode}] => PATH: ${response.requestOptions.path}');
    debugPrint('🐝🐝 DIO-RESPONSE[data: ${response.data}]');
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint('🐞🐞 DIO-ERROR[statusCode: ${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    debugPrint('🐞🐞 DIO-ERROR[data: ${err.response?.data}]');
    debugPrint('🐞🐞 DIO-ERROR[extra: ${err.response?.extra}]');
    debugPrint('🐞🐞 DIO-ERROR[message: ${err.message}]');
    return super.onError(err, handler);
  }
}
