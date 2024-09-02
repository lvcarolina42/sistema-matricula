import 'package:sistema_matricula/data/courses/datasource/courses_datasource.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/repositories/courses_repository.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  final CoursesDatasource _datasource;

  CoursesRepositoryImpl(this._datasource);
  
  @override
  Future<List<CourseModel>> getCourses() async {
    final courses = await _datasource.getCourses();

    return courses.map((course) => CourseModel.fromMap(course)).toList();
  }

  @override
  Future<CourseModel> getCourse(int id) async {
    final List<Map<String, Object?>> courses = await _datasource.getCourse(id);

    return CourseModel.fromMap(courses.first);
  }

  @override
  Future<int> registerCourse(CourseModel course) async {
    return await _datasource.registerCourse(course);
  }

  @override
  Future<int> deleteCourse(CourseModel course) async {
    return await _datasource.deleteCourse(course);
  }

  @override
  Future<int> updateCourse(CourseModel course) async {
    return await _datasource.updateCourse(course);
  }
}