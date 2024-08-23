import 'package:sistema_matricula/domain/login/models/user_model.dart';

class SecretaryModel extends UserModel {
  final String id;

  SecretaryModel({
    required this.id,
    required super.cpf,
    required super.name,
    required super.type,
    required super.password,
  });
}