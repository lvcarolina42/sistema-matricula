import 'package:sistema_matricula/data/subjects/datasource/subjects_datasource.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/subjects/repositories/subjects_repository.dart';

class SubjectsRepositoryImpl implements SubjectsRepository {
  final SubjectsDatasource _datasource;

  SubjectsRepositoryImpl(this._datasource);
  
  @override
<<<<<<< Updated upstream
  Future<List<SubjectModel>> getSubjects(int courseId) async {
    final subjects = await _datasource.getSubjects(courseId);
=======
  Future<List<SubjectModel>> getSubjects(int courseId, int? period) async {
    final subjects = await _datasource.getSubjects(courseId, period);
>>>>>>> Stashed changes
    return subjects.map((subject) => SubjectModel.fromMap(subject)).toList();
  }

  @override
  Future<void> register(SubjectModel subject) async {
    await _datasource.register(subject);
  }

  @override
<<<<<<< Updated upstream
  Future<SubjectModel> getSubjectById(int id) async {
    final subjects = await _datasource.getSubject(id);
=======
  Future<SubjectModel> getSubjectById(int id, int? period) async {
    final subjects = await _datasource.getSubject(id, period);
>>>>>>> Stashed changes
    final subject = subjects.first;
    return SubjectModel.fromMap(subject);
  }
}