import 'package:sistema_matricula/domain/login/models/student_model.dart';

abstract class StudentsRepository {
  Future<List<StudentModel>> getStudents(int subjectId);
}