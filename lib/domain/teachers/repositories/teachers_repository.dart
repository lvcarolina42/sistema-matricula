import 'package:sistema_matricula/domain/login/models/teacher_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';

abstract class TeachersRepository {
  Future<List<TeacherModel>> getTeachers(SubjectModel subject);

  Future<void> register(TeacherModel teacher);
}