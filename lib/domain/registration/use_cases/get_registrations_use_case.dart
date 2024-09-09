import 'package:sistema_matricula/domain/registration/models/registration_model.dart';
import 'package:sistema_matricula/domain/registration/repositories/registration_repository.dart';

class GetRegistrationsUseCase {
  final RegistrationRepository _repository;

  GetRegistrationsUseCase(this._repository);

  Future<List<RegistrationModel>> call(int id) async {
    return await _repository.getRegistrations(id);
  }

}