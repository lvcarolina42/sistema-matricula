import 'package:sistema_matricula/data/students/datasource/students_datasource.dart';
import 'package:sistema_matricula/domain/login/models/boleto_model.dart';
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/students/repositories/students_repository.dart';

class StudentsRepositoryImpl extends StudentsRepository {
  final StudentsDatasource _datasource;

  StudentsRepositoryImpl(this._datasource);

  @override
  Future<List<StudentModel>> getStudents(int subjectId) async {
    final response = await _datasource.getStudents(subjectId);
    final students = response.map((student) => StudentModel.fromMap(student)).toList();

    return students;
  }

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
}