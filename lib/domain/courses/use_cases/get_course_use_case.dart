import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/repositories/courses_repository.dart';

class GetCourseUseCase {
  final CoursesRepository _repository;

  GetCourseUseCase(this._repository);

  Future<CourseModel> call(int id) async {
    return await _repository.getCourse(id);
  }
}