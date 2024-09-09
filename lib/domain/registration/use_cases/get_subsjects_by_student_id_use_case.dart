import 'package:sistema_matricula/domain/registration/repositories/registration_repository.dart';

class GetSubsjectsByStudentIdUseCase {
  final RegistrationRepository _repository;

  GetSubsjectsByStudentIdUseCase(this._repository);

  Future<List<int>> call(int id) async {
    return await _repository.getSubjectsByStudentId(id);
  }
}