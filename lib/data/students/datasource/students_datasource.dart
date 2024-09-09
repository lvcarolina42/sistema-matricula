import 'package:sistema_matricula/backend/db.dart';

class StudentsDatasource {
  final _database = Db().database!;

  Future<List<Map<String, Object?>>> getStudents(int subjectId) async {
    final students = await _database.query("student", where: "subjectId = ?", whereArgs: [subjectId]);
    return students;
  }

  Future<Map<String, Object?>> getStudentById(int id) async {
    final student = await _database.query("student", where: "id = ?", whereArgs: [id]);
    return student.first;
  }

  Future<Map<String, Object?>> getBoletoByStudentId(int id) async {
    final student = await _database.query("boleto", where: "studentId = ?", whereArgs: [id]);
    return student.first;
  }

  Future<void> insertBoleto(Map<String, Object?> data) async {
    await _database.insert("boleto", data);
  }
}