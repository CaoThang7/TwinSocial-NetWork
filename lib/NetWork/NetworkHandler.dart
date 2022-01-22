import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class NetworkHandler {
  String baseurl = "http://10.0.3.2:5000/api";
  var log = Logger();
  FlutterSecureStorage storage = FlutterSecureStorage();
  Future<dynamic> get(String url) async {
    url = formater(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

   Future<http.Response> post(String url, Map<String, String> body) async {
    String? access_token= await storage.read(key: "access_token");
    url = formater(url);
    log.d(body);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $access_token"
      },
      body: json.encode(body),
    );
    return response;
  }

  String formater(String url) {
    return baseurl + url;
  }

}
