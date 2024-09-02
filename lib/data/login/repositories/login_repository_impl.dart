import 'package:sistema_matricula/data/login/datasources/login_datasource.dart';
import 'package:sistema_matricula/domain/login/models/teacher_model.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/login/repositories/login_repository.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/subjects/use_cases/get_subject_by_id_use_case.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _datasource;

  LoginRepositoryImpl(this._datasource);

  @override
  Future<bool> register(UserModel user) async {
    return _datasource.register(user);
  }

  @override
  Future<UserModel?> login(UserType userType, String cpf, String password) async {
    final user = await _datasource.login(userType, cpf, password);

    if(user.isEmpty) return null;

    return UserModel.fromMap(user, userType);
  }
}