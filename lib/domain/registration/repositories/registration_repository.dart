import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';

abstract class RegistrationRepository {
  Future<List<SubjectModel>> getSubjects(int courseId, int period);
}