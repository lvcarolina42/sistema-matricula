import 'package:sistema_matricula/domain/login/models/teacher_model.dart';
import 'package:sistema_matricula/domain/teachers/repositories/teachers_repository.dart';

class RegisterTeacherUseCase {
  final TeachersRepository _teachersRepository;

  RegisterTeacherUseCase(this._teachersRepository);

  Future<void> call(TeacherModel teacher) async {
    await _teachersRepository.register(teacher);
  }
}