import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/login/repositories/login_repository.dart';

class DoLoginUseCase {
  final LoginRepository _repository;

  DoLoginUseCase(this._repository);

  Future<UserModel?> call({required UserType userType, required String cpf, required String password}) async {
    return await _repository.login(userType, cpf, password);
  }
}