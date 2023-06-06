import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/constant/env.dart';
import 'package:online_learning_app/constant/storage_services.dart';

import '../models/app/category_model.dart';
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
    required String email,
    required String password,
    required String fullName,
    String userName = '',
    String dateBirth = '',
    String gender = '',
  }) async {
    var body = {
      "username": userName,
      "email": email,
      "password": password,
      "date_of_birth": dateBirth,
      "gender": gender,
      "full_name": fullName,
    };
    print(body);
    return await _postData(relativeUrl: '/register', body: body);
  }

  Future login({
    required String emailOrUsername,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      "email_or_username": emailOrUsername,
      "password": password,
    };
    print(body);
    return await _postData(relativeUrl: '/login', body: body);
  }

  Future addCourse({
    required String categoryId,
    required String memberId,
    required String title,
    required String desc,
    required String image,
  }) async {
    String? user = await storage.readData('user');
    UserModel appUserModel = UserModel.deserialize(user!);
    Map<String, dynamic> body = {
      'lecturer_id': appUserModel.idUser,
      'category_id': categoryId,
      'member_id': memberId,
      'title': title,
      'description': desc,
      'image': image,
    };
    print(body);
    return await _postData(relativeUrl: '/course/add', body: body);
  }

  Future<void> uploadImage(String imagePath, String relativeUrl) async {
    // Create MultipartRequest
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(relativeUrl), // Ganti dengan URL endpoint API Laravel Anda
    );

    request.files.add(await http.MultipartFile.fromPath('image', imagePath));

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('upload image failed');
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await _getData(relativeUrl: '/course/category'); // Ganti dengan URL endpoint API Laravel Anda

    if (response.statusCode == 200) {
      // Jika permintaan berhasil
      return response;
    } else {
      // Jika permintaan gagal
      throw Exception('Failed to fetch categories');
    }
  }
}
