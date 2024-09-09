import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';

abstract class SubjectsRepository {
  Future<void> register(SubjectModel subject);

<<<<<<< Updated upstream
  Future<List<SubjectModel>> getSubjects(int courseId);

  Future<SubjectModel> getSubjectById(int id);
=======
  Future<List<SubjectModel>> getSubjects(int courseId, int? period);

  Future<SubjectModel> getSubjectById(int id, int? period);
>>>>>>> Stashed changes
}