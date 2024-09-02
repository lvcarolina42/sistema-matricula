import 'package:sistema_matricula/data/students/datasource/students_datasource.dart';
import 'package:sistema_matricula/data/subjects/datasource/subjects_datasource.dart';
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/students/repositories/students_repository.dart';

class StudentsRepositoryImpl extends StudentsRepository {
  final StudentsDatasource _datasource;
  final SubjectsDatasource _subjectsDatasource;

  StudentsRepositoryImpl(this._datasource, this._subjectsDatasource);

  @override
  Future<List<StudentModel>> getStudents(int subjectId) async {
    final response = await _datasource.getStudents(subjectId);
    final students = response.map((student) => StudentModel.fromMap(student)).toList();

    return students;
  }
}