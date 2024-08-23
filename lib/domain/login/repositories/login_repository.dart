import 'package:sistema_matricula/domain/login/models/user_model.dart';

abstract class LoginRepository {
  Future<bool> register(UserModel user);
  Future<UserModel?> login(UserType userType, String cpf, String password);
}