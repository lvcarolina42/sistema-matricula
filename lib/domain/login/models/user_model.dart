import 'package:sistema_matricula/domain/login/models/address_model.dart';

enum UserType { 
  student("Aluno"),
  teacher("Professor"),
  secretary("Secretário");

  const UserType(this.name);

  final String name;
}

class UserModel {
  final String cpf;
  final String name;
  final UserType type;
  final String password;

  UserModel({
    required this.cpf,
    required this.type,
    required this.name,
    required this.password,
  });

  factory UserModel.fromMap(Map<String, Object?> map, UserType type) {
    return UserModel(
      type: type,
      cpf: map['cpf'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
    );
  }
}