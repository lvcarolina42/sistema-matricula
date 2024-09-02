import 'package:sistema_matricula/backend/db.dart';
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';

class LoginDatasource {
  final _database = Db().database!;
  Future<bool> register(UserModel user) async {
    if(user.type == UserType.student) {
      await _database.insert("student", (user as StudentModel).toMap());
    }

    if(user.type == UserType.teacher) {
      await _database.insert("teacher", <String, Object?>{'cpf': user.cpf, 'password': user.password, 'name': user.name});
    }

    if(user.type == UserType.secretary) {
      await _database.insert("secretary", <String, Object?>{'cpf': user.cpf, 'password': user.password, 'name': user.name});
    }
    
    return true;
  }

  Future<Map<String, Object?>> login(UserType userType, String cpf, String password) async {
    final tableName = userType == UserType.student ? 'student' : userType == UserType.teacher ? 'teacher' : 'secretary';
    final users = await _database.query(
      tableName,
      where: 'cpf=? AND password=?',
      whereArgs: [
        cpf,
        password,
      ],
    );

    if(users.isEmpty) return {};

    return users.first;
  }
}