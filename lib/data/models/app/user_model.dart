import 'dart:convert';

class UserModelStorage {
  final String idUser;
  final String name;
  final String email;
  final String role;

  UserModelStorage({
    required this.idUser,
    required this.name,
    required this.email,
    required this.role,
  });
  factory UserModelStorage.deserialize(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return UserModelStorage(
      email: json['email'],
      idUser: json['user_id'],
      name: json['name'],
      role: json['role'],
    );
  }
}
