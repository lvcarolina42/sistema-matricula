import 'package:sistema_matricula/domain/login/models/user_model.dart';

class SecretaryModel extends UserModel {
  final String id;

  SecretaryModel({
    required this.id,
    required super.cpf,
    required super.name,
    required super.email,
    required super.address,
    required super.password,
    required super.phoneNumber,
  });
}