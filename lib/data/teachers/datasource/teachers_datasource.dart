import 'package:sistema_matricula/backend/db.dart';
import 'package:sistema_matricula/domain/login/models/teacher_model.dart';

class TeachersDatasource {
  final _database = Db().database!;

   Future<List<Map<String, Object?>>> getTeachers(int subjectId) async {
    final teachers = await _database.query("teacher", where: "subjectId = ?", whereArgs: [subjectId]);
    return teachers;
  }

  Future<void> register(TeacherModel teacher) async {
    await _database.insert("teacher", teacher.toMap());
  }
}