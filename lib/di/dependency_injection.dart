import 'package:get_it/get_it.dart';
import 'package:sistema_matricula/data/courses/datasource/courses_datasource.dart';
import 'package:sistema_matricula/data/courses/repositories/courses_repository_impl.dart';
import 'package:sistema_matricula/data/login/datasources/login_datasource.dart';
import 'package:sistema_matricula/data/login/repositories/login_repository_impl.dart';
<<<<<<< Updated upstream
=======
import 'package:sistema_matricula/data/registration/datasource/registration_datasource.dart';
import 'package:sistema_matricula/data/registration/repositories/registration_repository_impl.dart';
>>>>>>> Stashed changes
import 'package:sistema_matricula/data/students/datasource/students_datasource.dart';
import 'package:sistema_matricula/data/students/repositories/students_repository_impl.dart';
import 'package:sistema_matricula/data/subjects/datasource/subjects_datasource.dart';
import 'package:sistema_matricula/data/subjects/repository/subjects_repository_impl.dart';
import 'package:sistema_matricula/data/teachers/datasource/teachers_datasource.dart';
import 'package:sistema_matricula/data/teachers/repositories/teachers_repository_impl.dart';
import 'package:sistema_matricula/domain/courses/repositories/courses_repository.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_course_use_case.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_courses_use_case.dart';
import 'package:sistema_matricula/domain/courses/use_cases/register_course_use_case.dart';
import 'package:sistema_matricula/domain/login/repositories/login_repository.dart';
import 'package:sistema_matricula/domain/login/use_cases/do_login_use_case.dart';
import 'package:sistema_matricula/domain/login/use_cases/register_user_use_case.dart';
<<<<<<< Updated upstream
import 'package:sistema_matricula/domain/students/repositories/students_repository.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_students_by_subject_id.dart';
import 'package:sistema_matricula/domain/subjects/repositories/subjects_repository.dart';
=======
import 'package:sistema_matricula/domain/registration/repositories/registration_repository.dart';
import 'package:sistema_matricula/domain/registration/use_cases/delete_registration_use_case.dart';
import 'package:sistema_matricula/domain/registration/use_cases/get_registrations_use_case.dart';
import 'package:sistema_matricula/domain/registration/use_cases/get_students_by_course_id.dart';
import 'package:sistema_matricula/domain/registration/use_cases/get_students_by_subject_id.dart';
import 'package:sistema_matricula/domain/registration/use_cases/get_subsjects_by_student_id_use_case.dart';
import 'package:sistema_matricula/domain/registration/use_cases/register_use_case.dart';
import 'package:sistema_matricula/domain/students/repositories/students_repository.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_boleto_use_case.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_student_by_id.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_students_use_case.dart';
import 'package:sistema_matricula/domain/students/use_cases/insert_boleto_use_case.dart';
import 'package:sistema_matricula/domain/subjects/repositories/subjects_repository.dart';
import 'package:sistema_matricula/domain/subjects/use_cases/get_subject_by_id_use_case.dart';
>>>>>>> Stashed changes
import 'package:sistema_matricula/domain/subjects/use_cases/get_subjects_use_case.dart';
import 'package:sistema_matricula/domain/subjects/use_cases/register_subject_use_case.dart';
import 'package:sistema_matricula/domain/teachers/repositories/teachers_repository.dart';
import 'package:sistema_matricula/domain/teachers/use_cases/get_teachers_use_case.dart';
import 'package:sistema_matricula/domain/teachers/use_cases/register_teacher_use_case.dart';

class DependencyInjector {
  final GetIt _getIt = GetIt.I;

  void setup() {
    _registerInternalDatabase();
    _registerDatasources();
    _registerRepository();
    _registerUseCase();
  }

  void _registerInternalDatabase() {
    // _getIt.registerFactory<SharedPreferencesRepository>(() => SharedPrefRepositoryImpl());
    // _getIt.registerSingleton<Database>(DatabaseClient());
    // _getIt.registerFactory<DatabaseHandler>(
    //   () => DatabaseHandlerImpl(
    //     _getIt(),
    //   ),
    // );
  }
  
  void _registerDatasources() {
    _getIt.registerFactory<LoginDatasource>(
      () => LoginDatasource(),
    );
    _getIt.registerFactory<CoursesDatasource>(
      () => CoursesDatasource(),
    );
    _getIt.registerFactory<SubjectsDatasource>(
      () => SubjectsDatasource(),
    );
    _getIt.registerFactory<TeachersDatasource>(
      () => TeachersDatasource(),
    );
    _getIt.registerFactory<StudentsDatasource>(
      () => StudentsDatasource(),
    );
<<<<<<< Updated upstream
    // _getIt.registerFactory<LoginDatasource>(
    //   () => LoginDatasource(
    //     apiHandler: _getIt(),
    //     sharedServices: _getIt(),
    //     saveTokenUseCase: _getIt(),
    //   ),
    // );
=======
    _getIt.registerFactory<RegistrationDataSource>(
      () => RegistrationDataSource(),
    );
>>>>>>> Stashed changes
  }

  void _registerRepository() {
    _getIt.registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(
        _getIt(),
      ),
    );
    _getIt.registerFactory<CoursesRepository>(
      () => CoursesRepositoryImpl(
        _getIt(),
      ),
    );
    _getIt.registerFactory<SubjectsRepository>(
      () => SubjectsRepositoryImpl(
        _getIt(),
      ),
    );
    _getIt.registerFactory<TeachersRepository>(
      () => TeachersRepositoryImpl(
        _getIt(),
        _getIt(),
      ),
    );
    _getIt.registerFactory<StudentsRepository>(
      () => StudentsRepositoryImpl(
        _getIt(),
<<<<<<< Updated upstream
=======
      ),
    );
    _getIt.registerFactory<RegistrationRepository>(
      () => RegistrationRepositoryImpl(
>>>>>>> Stashed changes
        _getIt(),
      ),
    );
  }

  void _registerUseCase() {
    _getIt.registerFactory(
      () => DoLoginUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => RegisterUserUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => GetCoursesUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => RegisterCourseUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => GetSubjectsUseCase(GetIt.I())
    );
    _getIt.registerFactory(
<<<<<<< Updated upstream
=======
      () => GetSubjectByIdUseCase(GetIt.I())
    );
    _getIt.registerFactory(
>>>>>>> Stashed changes
      () => RegisterSubjectUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => GetTeachersUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => RegisterTeacherUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => GetStudentsBySubjectId(GetIt.I())
    );
    _getIt.registerFactory(
<<<<<<< Updated upstream
      () => GetCourseUseCase(GetIt.I())
    );
    // _getIt.registerFactory(
    //   () => GenerateV3TokenUseCase(
    //     _getIt(),
    //   ),
    // );
=======
      () => GetStudentsByCourseId(GetIt.I())
    );
    _getIt.registerFactory(
      () => GetCourseUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => RegisterUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => GetRegistrationsUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => DeleteRegistrationUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => GetStudentByIdUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => GetSubsjectsByStudentIdUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => GetBoletoUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => InsertBoletoUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => GetStudentsUseCase(GetIt.I())
    );
>>>>>>> Stashed changes
  }
}
