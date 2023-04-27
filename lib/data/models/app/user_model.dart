import 'dart:convert';

class UserModel {
  final String idUser;
  final String name;
  final String email;
  final String role;

  UserModel(
      {required this.idUser,
      required this.name,
      required this.email,
      required this.role});
  factory UserModel.deserialize(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return UserModel(
        email: json['email'],
        idUser: json['user_id'],
        name: json['name'],
        role: json['role']);
  }
}
