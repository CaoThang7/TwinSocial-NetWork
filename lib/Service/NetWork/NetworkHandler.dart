import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:twin_social_network/Utils/App_Url.dart';

class NetworkHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();
  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json",
    });
    print(response.body);
    return response.body;
  }

  static Uri buildUrl(String endpoint) {
    final apiPath = AppUrl.baseUrl + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: "access_token", value: token);
  }

  static Future<String?> getToken(String token) async {
    return await storage.read(key: "access_token");
  }
}
