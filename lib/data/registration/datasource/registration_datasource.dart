import 'package:sistema_matricula/backend/db.dart';

class RegistrationDataSource {
  final _database = Db().database!;

  Future<List<Map<String, Object?>>> getSubjects(int courseId, int period) async {
    return _database.query("subject", where: "courseId = ? AND period = ?", whereArgs: [courseId, period]);
  }
}