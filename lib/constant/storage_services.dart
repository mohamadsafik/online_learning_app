import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final StorageService storage = StorageService();

class StorageItem {
  StorageItem(this.key, this.value);

  final String key;
  final String value;
}

class StorageService {
  final _secureStorage = const FlutterSecureStorage();
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  //write data
  Future<void> writeData({required String key, required value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<void> saveData(
      {required String idUser,
      required String fullname,
      required String role,
      required String email}) async {
    await storage.writeData(
        key: "user",
        value: jsonEncode({
          "user_id": idUser,
          "email": email,
          "name": fullname,
          "role": role
        }));
    writeData(key: "islogin", value: "Y");
  }
//end write data

//read data
  Future<String?> readData(String key) async {
    var readData = await _secureStorage.read(
      key: key,
    );
    return readData;
  }

//delete data
  Future<void> deleteData(String key) async {
    await _secureStorage.delete(
      key: key,
    );
  }

  Future<bool> containsKeyInSecureData(String key) async {
    var containsKey = await _secureStorage.containsKey(
      key: key,
    );
    return containsKey;
  }

//READALL
  Future<Map<String, dynamic>> readAllData() async {
    var allData = await _secureStorage.readAll();

    return allData;
  }

//DELETEALL
  Future<void> deleteAllData() async {
    await _secureStorage.deleteAll();
  }
}
