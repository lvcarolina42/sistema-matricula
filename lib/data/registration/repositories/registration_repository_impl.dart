import 'package:sistema_matricula/data/courses/datasource/courses_datasource.dart';
import 'package:sistema_matricula/data/registration/datasource/registration_datasource.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/repositories/courses_repository.dart';
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
}