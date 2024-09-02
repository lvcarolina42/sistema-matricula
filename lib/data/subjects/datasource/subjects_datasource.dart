import 'package:sistema_matricula/backend/db.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';

class SubjectsDatasource {
  final _database = Db().database!;

  Future<int> register(SubjectModel subject) async {
    final teste = await _database.insert("subject", subject.toMap());

    return teste;
  }

  Future<List<Map<String, Object?>>> getSubjects(int courseId) async {
    return _database.query("subject", where: "courseId = ?", whereArgs: [courseId]);
  }

  Future<List<Map<String, Object?>>> getSubject(int id) async {
    return _database.query("subject", where: "id = ?", whereArgs: [id]);
  }
}