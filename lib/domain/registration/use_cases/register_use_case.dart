import 'package:sistema_matricula/domain/registration/models/registration_model.dart';
import 'package:sistema_matricula/domain/registration/repositories/registration_repository.dart';

class RegisterUseCase {
  final RegistrationRepository _repository;

  RegisterUseCase(this._repository);

  Future<void> call(List<RegistrationModel> registrations) async {
    await _repository.insert(registrations);
  }
}