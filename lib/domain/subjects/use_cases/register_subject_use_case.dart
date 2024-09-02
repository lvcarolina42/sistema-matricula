import 'package:sistema_matricula/domain/subjects/repositories/subjects_repository.dart';

import '../models/subjects_model.dart';

class RegisterSubjectUseCase {
  final SubjectsRepository _subjectsRepository;

  RegisterSubjectUseCase(this._subjectsRepository);
  Future<void> call(SubjectModel subject) {
    return _subjectsRepository.register(subject);
  }
}