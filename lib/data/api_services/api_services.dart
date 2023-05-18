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
  _postData({required String relativeUrl, Map<String, dynamic>? body}) async {
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

  Future addCourse({
    required String categoryId,
    required String memberId,
    required String transactionId,
    required String title,
    required String desc,
    required String image,
  }) async {
    String? user = await storage.readData('user');
    UserModel appUserModel = UserModel.deserialize(user!);
    Map<String, dynamic> body = {
      'author_id': appUserModel.idUser,
      'category_id': categoryId,
      'member_id': memberId,
      'transaction_id': transactionId,
      'title': title,
      'description': desc,
      'image': image
    };
    print(body);
    return await _postData(relativeUrl: '/course/add', body: body);
  }
}

//  'author_id' => $request->author_id,
//                 'category_id' => $request->category_id,
//                 'member_id' => $request->member_id,
//                 'transaction_id' => $request->transaction_id,
//                 'title' => $request->title,
//                 'description' => $request->description,
//                 'image' => $request->image,