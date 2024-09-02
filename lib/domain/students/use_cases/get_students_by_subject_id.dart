import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/students/repositories/students_repository.dart';

class GetStudentsBySubjectId {
  final StudentsRepository _repository;

  GetStudentsBySubjectId(this._repository);

  Future<List<StudentModel>> call(int subjectId) async {
    final students = await _repository.getStudents(subjectId);
    return students;
  }
}