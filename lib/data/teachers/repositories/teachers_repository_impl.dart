import 'package:sistema_matricula/data/subjects/datasource/subjects_datasource.dart';
import 'package:sistema_matricula/data/teachers/datasource/teachers_datasource.dart';
import 'package:sistema_matricula/domain/login/models/teacher_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/teachers/repositories/teachers_repository.dart';

class TeachersRepositoryImpl implements TeachersRepository {
  final TeachersDatasource _datasource;
  final SubjectsDatasource _subjectsDatasource;

  TeachersRepositoryImpl(this._datasource, this._subjectsDatasource);

  @override
  Future<List<TeacherModel>> getTeachers(SubjectModel subject) async {
    final teachers = await _datasource.getTeachers(subject.id);
<<<<<<< Updated upstream
    final subjects = await _subjectsDatasource.getSubjects(subject.courseId);
=======
    final subjects = await _subjectsDatasource.getSubjects(subject.courseId, null);
>>>>>>> Stashed changes
    return teachers.map((teacher) {
      final subjectId = teacher['subjectId'];
      final subject = subjects.firstWhere((subject) => subject['id'] == subjectId);
      return TeacherModel.fromMap(teacher, subject);
    }).toList();
  }

  @override
  Future<void> register(TeacherModel teacher) async {
    await _datasource.register(teacher);
  }
  
}