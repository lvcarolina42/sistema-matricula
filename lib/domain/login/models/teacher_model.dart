import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';

class TeacherModel extends UserModel {
  final SubjectModel subject;

  TeacherModel({
    super.id,
    required super.cpf,
    required super.name,
    required this.subject,
    required super.password,
    super.type = UserType.teacher,
  });

  factory TeacherModel.fromMap(Map<String, dynamic> map, Map<String, dynamic> subject) {
    return TeacherModel(
      id: map['id'],
      cpf: map['cpf'],
      name: map['name'],
      password: map['password'],
      subject: SubjectModel.fromMap(subject),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'name': name,
      'password': password,
      'subjectId': subject.id,
    };
  }
}