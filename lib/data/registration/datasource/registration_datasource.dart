import 'package:sistema_matricula/backend/db.dart';

class RegistrationDataSource {
  final _database = Db().database!;

  Future<List<Map<String, Object?>>> getSubjects(int courseId, int period) async {
    return _database.query("subject", where: "courseId = ? AND period = ?", whereArgs: [courseId, period]);
  }

  Future<void> insert(Map<String, Object?> data) async {
    await _database.insert("registration", data);
  }

  Future<void> delete(int id) async {
    await _database.delete("registration", where: "id = ?", whereArgs: [id]);
  }

  Future<List<Map<String, Object?>>> getRegistrations(int id) async {
    return _database.query("registration", where: "studentId = ?", whereArgs: [id]);
  }

  Future<List<Map<String, Object?>>> getStudentsBySubjectId(int id) async {
    return _database.query("registration", where: "subjectId = ?", whereArgs: [id]);
  }

   Future<List<Map<String, Object?>>> getStudentsByCourseId(int id) async {
    return _database.query("registration", where: "courseId = ?", whereArgs: [id]);
  }

  Future<List<Map<String, Object?>>> getSubjectsByStudentId(int id) async {
    return _database.query("registration", where: "studentId = ?", whereArgs: [id]);
  }
}