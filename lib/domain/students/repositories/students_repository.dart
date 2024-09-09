import 'package:sistema_matricula/domain/login/models/boleto_model.dart';
import 'package:sistema_matricula/domain/login/models/student_model.dart';

abstract class StudentsRepository {
  Future<List<StudentModel>> getStudents(int subjectId);

  Future<StudentModel> getStudentById(int id);

  Future<BoletoModel> getBoletoByStudentId(int id);

  Future<void> insertBoleto(BoletoModel data);
}