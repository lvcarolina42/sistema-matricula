import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/subjects/repositories/subjects_repository.dart';

class GetSubjectsUseCase {
  final SubjectsRepository _subjectsRepository;

  GetSubjectsUseCase(this._subjectsRepository);

  Future<List<SubjectModel>> call(int courseId) async {
    return await _subjectsRepository.getSubjects(courseId);
  }
}