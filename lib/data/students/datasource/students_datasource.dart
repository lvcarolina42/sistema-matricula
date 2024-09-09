import 'package:sistema_matricula/backend/db.dart';
<<<<<<< Updated upstream
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/login/models/teacher_model.dart';
=======
>>>>>>> Stashed changes

class StudentsDatasource {
  final _database = Db().database!;

<<<<<<< Updated upstream
   Future<List<Map<String, Object?>>> getStudents(int subjectId) async {
=======
  Future<List<Map<String, Object?>>> getStudents(int subjectId) async {
>>>>>>> Stashed changes
    final students = await _database.query("student", where: "subjectId = ?", whereArgs: [subjectId]);
    return students;
  }

<<<<<<< Updated upstream
  // Future<void> register(StudentModel student) async {
  //   await _database.insert("teacher", student.toMap());
  // }
=======
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
>>>>>>> Stashed changes
}