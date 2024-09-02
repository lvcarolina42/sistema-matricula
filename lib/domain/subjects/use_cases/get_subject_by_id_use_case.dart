import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/subjects/repositories/subjects_repository.dart';

class GetSubjectByIdUseCase {
  final SubjectsRepository _subjectsRepository;

  GetSubjectByIdUseCase(this._subjectsRepository);

  Future<SubjectModel> call(int id) {
    return _subjectsRepository.getSubjectById(id);
  }
}