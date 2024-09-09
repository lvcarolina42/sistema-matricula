import 'package:sistema_matricula/data/registration/datasource/registration_datasource.dart';
import 'package:sistema_matricula/domain/registration/models/registration_model.dart';
import 'package:sistema_matricula/domain/registration/repositories/registration_repository.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationDataSource _datasource;

  RegistrationRepositoryImpl(this._datasource);
  
  @override
  Future<List<SubjectModel>> getSubjects(int courseId, int period) async {
    final subjects = await _datasource.getSubjects(courseId, period);

    return subjects.map((subject) => SubjectModel.fromMap(subject)).toList();
  }

  @override
  Future<void> insert(List<RegistrationModel> registrations) async {
    for (var registration in registrations) {
      await _datasource.insert(registration.toMap());
    }
  }

  @override
  Future<void> delete(int id) async {
    await _datasource.delete(id);
  }

  @override
  Future<List<RegistrationModel>> getRegistrations(int id) async {
    final registrations = await _datasource.getRegistrations(id);

    return registrations.map((registration) => RegistrationModel.fromMap(registration)).toList();
  }

  @override
  Future<List<int>> getStudentsBySubjectId(int id) async {
    final students = await _datasource.getStudentsBySubjectId(id);
    return students.map((student) => student['studentId'] as int).toList();
  }

  @override
  Future<List<int>> getStudentsByCourseId(int id) async {
    final students = await _datasource.getStudentsByCourseId(id);
    return students.map((student) => student['studentId'] as int).toList();
  }

  @override
  Future<List<int>> getSubjectsByStudentId(int id) async {
    final subjects = await _datasource.getSubjectsByStudentId(id);
    return subjects.map((student) => student['subjectId'] as int).toList();
  }
}