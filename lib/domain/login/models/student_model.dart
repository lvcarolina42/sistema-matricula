import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';

class StudentModel extends UserModel {
  final int id;
  final int period;
  final int courseId;
  final String? courseName;
  final List<SubjectModel>? subjects;

  StudentModel({
    this.subjects,
    this.courseName,
    required this.id,
    required super.cpf,
    required super.name,
    required this.period,
    required this.courseId,
    required super.password,
    super.type = UserType.student,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      cpf: map['cpf'],
      name: map['name'],
      period: map['period'],
      password: map['password'],
      courseId: map['courseId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'name': name,
      'period': period,
      'password': password,
      'courseId': courseId,
    };
  }

  StudentModel copyWith({
    required String courseName,
    required List<SubjectModel> subjects,
  }) {
    return StudentModel(
      id: id,
      cpf: cpf,
      name: name,
      period: period,
      password: password,
      courseId: courseId,
      subjects: this.subjects,
      courseName: this.courseName,
    );
  }
}