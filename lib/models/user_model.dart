import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String role;

  const UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.role,
  });

  @override
  List<Object?> get props => [uid, email, name, role];
}
