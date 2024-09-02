import 'package:sistema_matricula/backend/db.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';

class CoursesDatasource {
  final _database = Db().database!;

  Future<List<Map<String, Object?>>> getCourses() async {
    final courses = await _database.query("course");

    return courses;
  }

  Future<List<Map<String, Object?>>> getCourse(int id) async {
    final courses = await _database.query("course", where: "id = ?", whereArgs: [id]);

    return courses;
  }

  Future<int> registerCourse(CourseModel course) async {
    return await _database.insert("course", course.toMap());
  }

  Future<int> deleteCourse(CourseModel course) async {
    return await _database.delete("course", where: "code = ?", whereArgs: [course.code]);
  }

  Future<int> updateCourse(CourseModel course) async {
    return await _database.update("course", course.toMap(), where: "code = ?", whereArgs: [course.code]);
  }
}