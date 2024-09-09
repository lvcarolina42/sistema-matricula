import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/registration/repositories/registration_repository.dart';

class GetStudentsBySubjectId {
  final RegistrationRepository _repository;

  GetStudentsBySubjectId(this._repository);

  Future<List<int>> call(int id) async {
    return await _repository.getStudentsBySubjectId(id);
  }
}