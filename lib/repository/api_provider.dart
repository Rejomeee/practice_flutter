import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:igdb_app/repository/dio_connectivity_request_retrier.dart';
import 'package:igdb_app/repository/retry_interceptor.dart';
import 'package:igdb_app/utils/constant/constants.dart';

class ApiProvider {
  final String _endpoint = "api-projectfort.day3.co";
  final Dio _dio = Dio();
  final bool secure = true;

  get(String url) async {
    return await _dio.get(url,
        options: Options(
          headers: httpOptions,
        ));
  }

  post(String url, dynamic jsonData) async {
    return await _dio.post(url,
        data: jsonEncode(jsonData),
        options: Options(
          headers: httpOptions,
        ));
  }

  Future makeRequest({
    String urlPath,
    dynamic jsonData,
    String method = 'POST',
  }) async {
    dynamic request;
    _dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: Dio(),
          connectivity: Connectivity(),
        ),
      ),
    );
    urlPath = getUrl(urlPath);
    print('urlPath done out');
    print(urlPath);
    if (method == 'POST') {
      request = this.post(urlPath, jsonData);
    } else if (method == 'GET') {
      request = this.get(urlPath);
    }

    return await request;
  }

  getUrl(String path) {
    print('getUrl');
    String returnUrl = '';
    if (secure == true) {
      returnUrl += 'https://$_endpoint';
    } else {
      returnUrl += 'http://$_endpoint';
    }
    return returnUrl += path;
  }
}
