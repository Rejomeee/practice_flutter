import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:igdb_app/repository/dio_connectivity_request_retrier.dart';
import 'package:igdb_app/repository/retry_interceptor.dart';
import 'package:igdb_app/utils/constant/constants.dart';

class ApiProvider {
  // final String _endpoint = "api-projectfort.day3.co";
  final String _endpoint = "192.168.5.39";
  final Dio _dio = Dio();
  final bool secure = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  get(String url) async {
    try {
      return await _dio.get(url,
          options: Options(
            headers: httpOptions,
          ));
    } catch (e) {
      print('Error get request: $e');
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Something went wrong.')));
      return e;
    }
  }

  post(String url, dynamic jsonData) async {
    try {
      return await _dio.post(url,
          data: jsonEncode(jsonData),
          options: Options(
            headers: httpOptions,
          ));
    } catch (e) {
      print('Error get post: $e');
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Something went wrong.')));
      return e;
    }
  }

  Future makeRequest({
    String urlPath,
    dynamic jsonData,
    String method = 'POST',
  }) async {
    dynamic request;
    // _dio.interceptors.add(
    //   RetryOnConnectionChangeInterceptor(
    //     requestRetrier: DioConnectivityRequestRetrier(
    //       dio: Dio(),
    //       connectivity: Connectivity(),
    //     ),
    //   ),
    // );
    urlPath = getUrl(urlPath);
    print('urlPath done out');
    print(urlPath);
    if (method == 'POST') {
      request = await this.post(urlPath, jsonData);
    } else if (method == 'GET') {
      request = await this.get(urlPath);
    }
    print('object');
    print(httpOptions);
    if (request.statusCode == 200)
      return request;
    else {
      print('Error status code: ${request.statusCode}');
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Something went wrong.')));
    }
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
