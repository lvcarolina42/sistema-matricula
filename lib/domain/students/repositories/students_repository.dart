<<<<<<< Updated upstream
=======
import 'package:sistema_matricula/domain/login/models/boleto_model.dart';
>>>>>>> Stashed changes
import 'package:sistema_matricula/domain/login/models/student_model.dart';

abstract class StudentsRepository {
  Future<List<StudentModel>> getStudents(int subjectId);
<<<<<<< Updated upstream
=======

  Future<StudentModel> getStudentById(int id);

  Future<BoletoModel> getBoletoByStudentId(int id);

  Future<void> insertBoleto(BoletoModel data);
>>>>>>> Stashed changes
}