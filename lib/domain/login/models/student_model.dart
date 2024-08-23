import 'package:sistema_matricula/domain/login/models/user_model.dart';

class StudentModel extends UserModel {
  final String id;
  final String registration;

  StudentModel({
    required this.id,
    required super.cpf,
    required super.name,
    required super.type,
    required super.password,
    required this.registration,
  });
}