import 'package:sistema_matricula/domain/login/models/user_model.dart';

class SecretaryModel extends UserModel {
  SecretaryModel({
    super.id,
    required super.cpf,
    required super.name,
    required super.password,
    super.type = UserType.secretary,
  });
}