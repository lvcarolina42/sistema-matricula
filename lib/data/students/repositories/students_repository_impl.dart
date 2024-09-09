import 'package:sistema_matricula/data/students/datasource/students_datasource.dart';
<<<<<<< Updated upstream
import 'package:sistema_matricula/data/subjects/datasource/subjects_datasource.dart';
=======
import 'package:sistema_matricula/domain/login/models/boleto_model.dart';
>>>>>>> Stashed changes
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/students/repositories/students_repository.dart';

class StudentsRepositoryImpl extends StudentsRepository {
  final StudentsDatasource _datasource;
<<<<<<< Updated upstream
  final SubjectsDatasource _subjectsDatasource;

  StudentsRepositoryImpl(this._datasource, this._subjectsDatasource);
=======

  StudentsRepositoryImpl(this._datasource);
>>>>>>> Stashed changes

  @override
  Future<List<StudentModel>> getStudents(int subjectId) async {
    final response = await _datasource.getStudents(subjectId);
    final students = response.map((student) => StudentModel.fromMap(student)).toList();

    return students;
  }
<<<<<<< Updated upstream
=======

  @override
  Future<StudentModel> getStudentById(int id) async {
    final response = await _datasource.getStudentById(id);
    return StudentModel.fromMap(response);
  }

  @override
  Future<BoletoModel> getBoletoByStudentId(int id) async {
    final response = await _datasource.getBoletoByStudentId(id);
    return BoletoModel.fromMap(response);
  }

  @override
  Future<void> insertBoleto(BoletoModel data) async {
    await _datasource.insertBoleto(data.toMap());
  }
>>>>>>> Stashed changes
}