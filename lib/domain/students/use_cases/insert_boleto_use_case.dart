import 'package:sistema_matricula/domain/login/models/boleto_model.dart';
import 'package:sistema_matricula/domain/students/repositories/students_repository.dart';

class InsertBoletoUseCase {
  final StudentsRepository _repository;

  InsertBoletoUseCase(this._repository);

  Future<void> call(BoletoModel data) async {
    await _repository.insertBoleto(data);
  }
}