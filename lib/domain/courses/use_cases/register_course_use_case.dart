import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/repositories/courses_repository.dart';

class RegisterCourseUseCase {
  final CoursesRepository _repository;

  RegisterCourseUseCase(this._repository);

  Future<int> call(CourseModel course) async {
    return await _repository.registerCourse(course);
  }
}