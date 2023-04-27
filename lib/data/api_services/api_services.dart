import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:online_learning_app/constant/env.dart';
import 'package:online_learning_app/constant/storage_services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/app/user_model.dart';

class ApiServices {
  _generateSignature(
      {required String method,
      required String relativeUrl,
      required String requestBody,
      required String timestamp}) {
    requestBody.replaceAll(RegExp(r"\r+"), "");
    requestBody.replaceAll(RegExp(r"\n+"), "");
    requestBody.replaceAll(RegExp(r"\t+"), "");
    // print("request body: " + requestBody);
    // print(relativeUrl);
    var stringToSign = '';
    stringToSign += "${method.toUpperCase()}:";
    stringToSign += "v3/$relativeUrl:";
    stringToSign += "${AppConstants().apiKey}:";
    stringToSign +=
        "${sha256.convert(utf8.encode(requestBody)).toString().toLowerCase()}:";
    stringToSign += timestamp;
    // print("string to sign: " + stringToSign);
    var key = utf8.encode(AppConstants().secretKey);
    var bytes = utf8.encode(stringToSign);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    return digest.toString();
  }

  generateHeader({
    required String method,
    required String relativeUrl,
    required Map<String, dynamic>? body,
  }) async {
    DateTime now = DateTime.now().toUtc();
    String timestamp =
        "${DateFormat('yyyy-MM-dd').format(now)}T${DateFormat('HH:mm:ss').format(now)}.000Z";

    String signature = _generateSignature(
        method: method.toUpperCase(),
        relativeUrl: relativeUrl,
        requestBody: json.encode(body).toString(),
        timestamp: timestamp);

    Map<String, String> header = {};

    header = {
      "Authorization": base64.encode(utf8
          .encode('${AppConstants().clientID}:${AppConstants().clientSecret}')),
      "Content-Type": "application/json",
      "Origin": "emaskita.id",
      "X-GSI-Key": AppConstants().secretKey,
      "X-GSI-Timestamp": timestamp,
      "X-GSI-Signature": signature
    };
    // print("ini header" + "${header}");
    return header;
  }

  _postData({required String relativeUrl, Map<String, dynamic>? body}) async {
    Map<String, String> headers = await generateHeader(
        method: 'POST', relativeUrl: relativeUrl, body: body);

    var url = Uri.parse(AppConstants().baseUrl + relativeUrl);

    var response = await http.post(url, body: body);

    print('Api POST to:$url');
    print(response.body);
    print(response.statusCode);
    var data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return data;
    } else {
      return throw Exception();
    }
  }

  _getData({required String relativeUrl}) async {
    Map<String, String> headers =
        await generateHeader(method: 'GET', relativeUrl: relativeUrl, body: {});

    var url = Uri.parse(AppConstants().baseUrl + relativeUrl);

    http.Response response = await http.get(url);
    print('Api GET to:$url');
    print(response.body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      return throw Exception();
    }
  }

  // Future login() async {
  //   String? user = await storage.readData('user');
  //   UserModel appUserModel = UserModel.deserialize(user!);
  //   var body = {"id_customer": appUserModel.idUser};
  //   print(body);
  //   return await _postData(relativeUrl: 'Emaskita_point/is_active', body: body);
  // }

  Future register({
    required String userName,
    required String email,
    required String password,
    required String dateBirth,
    required String gender,
    required String fullName,
  }) async {
    var body = {
      "username": userName,
      "email": email,
      "password": password,
      "date_of_birth": dateBirth,
      "gender": gender,
      "full_name": fullName
    };
    print(body);
    return await _postData(relativeUrl: '/users', body: body);
  }

  Future login({
    required String emailOrPassword,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      "email_or_username": emailOrPassword,
      "password": password,
    };
    print(body);
    return await _postData(relativeUrl: '/login', body: body);
  }
}
