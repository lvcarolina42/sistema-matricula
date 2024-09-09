import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';

abstract class SubjectsRepository {
  Future<void> register(SubjectModel subject);

  Future<List<SubjectModel>> getSubjects(int courseId, int? period);

  Future<SubjectModel> getSubjectById(int id, int? period);
}