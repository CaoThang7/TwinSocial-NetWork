import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:twin_social_network/Utils/App_Url.dart';

class NetworkHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();

  // http post
  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json",
    });
    print(response.body);
    return response.body;
  }

  // http createPostUser
  static Future<String> createPostUser(
      var body, String endpoint, String? access_token) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json",
      "authorization": "Bearer $access_token"
    });
    print(response.body);
    return response.body;
  }

  // http patch
  static Future<String> patch(
      var body, String endpoint, String? access_token) async {
    var response = await client.patch(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json",
      "authorization": "Bearer $access_token"
    });
    print(response.body);
    return response.body;
  }

  // http patchFollow, unFollow
  static Future<String> patchFollow(
      var body, String endpoint, String? access_token) async {
    var response = await client.patch(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json",
      "authorization": "Bearer $access_token"
    });
    print(response.body);
    return response.body;
  }

  // http get
  static Future<dynamic> get(String endpoint, String? access_token) async {
    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-type": "application/json",
      "authorization": "Bearer $access_token"
    });
    return response.body;
  }

  // buildUrl
  static Uri buildUrl(String endpoint) {
    final apiPath = AppUrl.baseUrl + endpoint;
    return Uri.parse(apiPath);
  }

  // store save Token
  static Future<void> storeToken(String token) async {
    await storage.write(key: "access_token", value: token);
  }

  // get token in storage
  static Future<String?> getToken(String token) async {
    return await storage.read(key: "access_token");
  }

  // removeToken in storage
  static Future<void> removeToken() async {
    return await storage.delete(key: "access_token");
  }
}
