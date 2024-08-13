import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/Repository/api_urls.dart';

// ignore: unused_import

class Api {
  static final authHeader = {'accept': "application/json"};
  Dio api = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      contentType: "application/json",
    ),
  );
  Future<dynamic> request({
    required String url,
    required RequestMethod method,
    Object? payload,
    required Map<String, dynamic> header,
  }) async {
    try {
      Response<dynamic> response;
      switch (method) {
        case RequestMethod.get:
          response = await api.get(url,
              data: payload, options: Options(headers: header));
          break;
        case RequestMethod.post:
          response = await api.post(url,
              data: payload, options: Options(headers: header));
          break;
        case RequestMethod.patch:
          response = await api.patch(url,
              data: payload, options: Options(headers: header));
          break;
        case RequestMethod.delete:
          response = await api.delete(url, options: Options(headers: header));
          break;
      }
      // log("message${response.data}");
      return response.data;
    } on DioException catch (e) {
      log("message${e.toString()}");
      return null;
    }
  }
}

enum RequestMethod { get, post, patch, delete }
