import 'package:sistema_matricula/domain/registration/repositories/registration_repository.dart';

class DeleteRegistrationUseCase {
  final RegistrationRepository _repository;

  DeleteRegistrationUseCase(this._repository);

  Future<void> call(int id) async {
    await _repository.delete(id);
  }
}