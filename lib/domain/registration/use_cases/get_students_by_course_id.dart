import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/registration/repositories/registration_repository.dart';

class GetStudentsByCourseId {
  final RegistrationRepository _repository;

  GetStudentsByCourseId(this._repository);

  Future<List<int>> call(int id) async {
    return await _repository.getStudentsByCourseId(id);
  }
}