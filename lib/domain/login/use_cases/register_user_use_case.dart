import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/login/repositories/login_repository.dart';

class RegisterUserUseCase {
  final LoginRepository _repository;

  RegisterUserUseCase(this._repository);

  Future<void> call(UserModel user) async {
    await _repository.register(user);
  }
}