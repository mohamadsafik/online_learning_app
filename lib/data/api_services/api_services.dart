import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/constant/env.dart';
import 'package:online_learning_app/constant/storage_services.dart';

import '../../export.dart';
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

  getData({required String relativeUrl}) async {
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

  Future getCourseById({required String id}) async {
    return await getData(relativeUrl: '/course/$id');
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
    required String title,
    required String desc,
    // required String? image,
    required String memberId,
  }) async {
    String? user = await storage.readData('user');
    UserModel appUserModel = UserModel.deserialize(user!);
    Map<String, dynamic> body = {
      'author_id': appUserModel.idUser,
      'category_id': categoryId,
      'title': title,
      'member_id': memberId,
      'description': desc,
      // 'image': image,
    };
    print(body);
    return await _postData(relativeUrl: '/course/add', body: body);
  }

  Future uploadImageCourse({required imagePath}) async {
    if (imagePath != null) {
      // Membuka file gambar yang dipilih
      final file = File(imagePath!);
      String format = imagePath!.path.split('.').last;
      final base64String = base64Encode(file.readAsBytesSync());
      var base64 = 'data:image/$format;base64,$base64String';
      // Mengonversi gambar ke Base64

      // Mengirim permintaan HTTP menggunakan package http
      final url = Uri.parse('${AppConstants().baseUrl}course/add'); // Ganti dengan URL endpoint API Anda
      final request = http.MultipartRequest('POST', url);
      request.fields['image'] = base64;
      request.files.add(await http.MultipartFile.fromPath('images/courses', file.path));

      // Mengirim permintaan dan menangani responsenya
      final response = await request.send();
      if (response.statusCode == 200) {
        // Gambar berhasil diunggah
        print('Image uploaded successfully');
      } else {
        // Terjadi kesalahan saat mengunggah gambar
        print('Image upload failed');
      }
    }
  }
}
