import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/students/repositories/students_repository.dart';

class GetStudentsUseCase {
  final StudentsRepository _repository;

  GetStudentsUseCase(this._repository);

  Future<List<StudentModel>> call(int subjectId) async {
    return await _repository.getStudents(subjectId);
  }
}