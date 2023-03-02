import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String role;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
  });

  @override
  List<Object?> get props => [id, email, name, role];
}
