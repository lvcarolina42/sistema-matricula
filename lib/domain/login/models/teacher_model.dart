import 'package:sistema_matricula/domain/login/models/user_model.dart';

class TeacherModel extends UserModel {
  final String id;
  final double wage;
  final String workload;

  TeacherModel({
    required this.id,
    required super.cpf,
    required this.wage,
    required super.name,
    required super.type,
    required this.workload,
    required super.password,
  });
}