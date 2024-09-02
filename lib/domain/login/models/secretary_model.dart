import 'package:sistema_matricula/domain/login/models/user_model.dart';

class SecretaryModel extends UserModel {
  final int id;

  SecretaryModel({
    required this.id,
    required super.cpf,
    required super.name,
    required super.password,
    super.type = UserType.secretary,
  });
}