import 'package:sistema_matricula/domain/registration/models/registration_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';

abstract class RegistrationRepository {
  Future<List<SubjectModel>> getSubjects(int courseId, int period);
  Future<void> insert(List<RegistrationModel> registrations);
  Future<void> delete(int id);
  Future<List<RegistrationModel>> getRegistrations(int id);
   Future<List<int>> getStudentsBySubjectId(int id);
   Future<List<int>> getStudentsByCourseId(int id);
   Future<List<int>> getSubjectsByStudentId(int id);
}