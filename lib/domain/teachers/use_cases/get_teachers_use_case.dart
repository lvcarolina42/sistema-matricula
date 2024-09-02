import 'package:sistema_matricula/domain/login/models/teacher_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/teachers/repositories/teachers_repository.dart';

class GetTeachersUseCase {
  final TeachersRepository _teachersRepository;

  GetTeachersUseCase(this._teachersRepository);

  Future<List<TeacherModel>> call(SubjectModel subject) async {
    return await _teachersRepository.getTeachers(subject);
  }
}