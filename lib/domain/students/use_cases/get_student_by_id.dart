import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/students/repositories/students_repository.dart';

class GetStudentByIdUseCase {
  final StudentsRepository _repository;

  GetStudentByIdUseCase(this._repository);

  Future<StudentModel> call(int id) async {
    return await _repository.getStudentById(id);
  }
}