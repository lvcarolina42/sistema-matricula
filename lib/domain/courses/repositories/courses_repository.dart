import 'package:sistema_matricula/domain/courses/models/course_model.dart';

abstract class CoursesRepository {
  Future<List<CourseModel>> getCourses();

  Future<CourseModel> getCourse(int id);

  Future<int> registerCourse(CourseModel course);

  Future<int> deleteCourse(CourseModel course);

  Future<int> updateCourse(CourseModel course);
}