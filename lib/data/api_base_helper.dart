import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'endpoints.dart';
import 'header.dart';

class ApiBaseHelper {
  final Header _header = Header();

  Map<String, String> _buildHeaders(
      {bool requiresAuth = true,
      Map<String, String>? contentType,
      String? token}) {
    final Map<String, String> headers = {};

    if (requiresAuth) {
      headers['Authorization'] = 'Token $token';
    }
    if (contentType != null && contentType.isNotEmpty) {
      headers.addAll(contentType);
    }
    log('Header_1 -> $headers');
    return headers;
  }

  Future<dynamic> get(
      {required String endpoint,
      required bool requiresAuth,
      required String? token,
      Map<String, dynamic>? queryParams,
      bool? showProgress}) async {
    try {
      log('Token ' + token.toString());

      String url;
      if (queryParams != null) {
        String queryString = Uri(queryParameters: queryParams).query;
        url = Endpoints.baseUrl + endpoint + '?' + queryString;
      } else {
        url = Endpoints.baseUrl + endpoint;
      }
      log('base url ' + url.toString());

      http.Response response;
      if (requiresAuth) {
        response = await http.get(
          Uri.parse(url),
          headers: _buildHeaders(
              requiresAuth: requiresAuth,
              contentType: _header.applicationJsonHeader,
              token: token),
        );
      } else {
        response = await http.get(Uri.parse(url));
      }

      var responseJson = _returnResponse(response);
      if (showProgress != null && showProgress) {
        Navigator.pop(Get.context!);
      }
      return responseJson;
    } catch (e) {
      if (showProgress != null && showProgress) {
        Navigator.pop(Get.context!);
      }
      log(e.toString());
    }
  }

  Future<dynamic> postJson({
    required String endpoint,
    required String? body,
    required bool requiresAuth,
    required String? token,
    required bool showProgressBar,
  }) async {
    try {
      log('Api Post, url $endpoint');
      log('Api Post, params $body');
      final url = Uri.parse(Endpoints.baseUrl + endpoint);
      http.Response response;
      if (requiresAuth) {
        response = await http.post(
          url,
          body: body,
          headers: _buildHeaders(
              requiresAuth: requiresAuth,
              contentType: _header.applicationJsonHeader,
              token: token),
        );
      } else {
        response = await http.post(url,
            body: body,
            headers: _buildHeaders(
                requiresAuth: false,
                contentType: _header.applicationJsonHeader));
      }

      var responseJson = _returnResponse(response);
      if (showProgressBar) {
        Navigator.pop(Get.context!);
      }
      // log('Response ' + responseJson.toString());
      return responseJson;
    } catch (e) {
      if (showProgressBar) {
        Navigator.pop(Get.context!);
      }
      log(e.toString());
    }
  }

  Future<dynamic> postFormData({
    required String endpoint,
    required dynamic body,
    required bool requiresAuth,
    required String? token,
  }) async {
    log('Api Post, url ${Endpoints.baseUrl + endpoint}');
    final url = Uri.parse(Endpoints.baseUrl + endpoint);
    log('Body Form Data ' + body.toString());
    http.Response response;
    if (requiresAuth) {
      response = await http.post(url,
          body: body,
          headers: _buildHeaders(
              requiresAuth: requiresAuth,
              contentType: _header.applicationJsonHeader,
              token: token),
          encoding: Encoding.getByName('utf-8'));
    } else {
      response = await http.post(url, body: body);
    }

    var responseJson = _returnResponse(response);
    Navigator.pop(Get.context!);
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) async {
    log('Status Code ' + response.statusCode.toString());
    log('Response ' + response.body);

    Map<String, dynamic>? responseJson;
    if (response.body.isNotEmpty) {
      responseJson = json.decode(response.body);
    }

    Future<dynamic> patchJson({
      required String endpoint,
      required String body,
      required bool requiresAuth,
      required String? token,
      bool? showProgress,
    }) async {
      try {
        log('Api Post, url $endpoint');
        log('Api Post, params $body');
        final url = Uri.parse(Endpoints.baseUrl + endpoint);
        http.Response response;
        if (requiresAuth) {
          response = await http.patch(
            url,
            body: body,
            headers: _buildHeaders(
                requiresAuth: requiresAuth,
                contentType: _header.applicationJsonHeader,
                token: token),
          );
        } else {
          response = await http.patch(url,
              body: body,
              headers: _buildHeaders(
                  requiresAuth: requiresAuth,
                  contentType: _header.applicationJsonHeader));
        }

        var responseJson = _returnResponse(response);
        if (showProgress != null && showProgress) {
          Navigator.pop(Get.context!);
        }
        log('Response ' + responseJson.toString());
        return responseJson;
      } catch (e) {
        Navigator.pop(Get.context!);
        log(e.toString());
      }
    }
  }
}
