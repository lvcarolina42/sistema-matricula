import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/repositories/courses_repository.dart';

class GetCoursesUseCase {
  final CoursesRepository _repository;

  GetCoursesUseCase(this._repository);
  
  Future<List<CourseModel>> call() async {
    final courses = await _repository.getCourses();

    return courses;
  }
}