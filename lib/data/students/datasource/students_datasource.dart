import 'package:sistema_matricula/backend/db.dart';
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/login/models/teacher_model.dart';

class StudentsDatasource {
  final _database = Db().database!;

   Future<List<Map<String, Object?>>> getStudents(int subjectId) async {
    final students = await _database.query("student", where: "subjectId = ?", whereArgs: [subjectId]);
    return students;
  }

  // Future<void> register(StudentModel student) async {
  //   await _database.insert("teacher", student.toMap());
  // }
}