import 'package:sistema_matricula/domain/login/models/boleto_model.dart';
import 'package:sistema_matricula/domain/students/repositories/students_repository.dart';

class GetBoletoUseCase {
  final StudentsRepository _repository;

  GetBoletoUseCase(this._repository);

  Future<BoletoModel> call(int id) async {
    return await _repository.getBoletoByStudentId(id);
  }
}