import 'package:get_it/get_it.dart';
import 'package:sistema_matricula/data/courses/datasource/courses_datasource.dart';
import 'package:sistema_matricula/data/courses/repositories/courses_repository_impl.dart';
import 'package:sistema_matricula/data/login/datasources/login_datasource.dart';
import 'package:sistema_matricula/data/login/repositories/login_repository_impl.dart';
import 'package:sistema_matricula/domain/courses/repositories/courses_repository.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_courses_use_case.dart';
import 'package:sistema_matricula/domain/courses/use_cases/register_course_use_case.dart';
import 'package:sistema_matricula/domain/login/repositories/login_repository.dart';
import 'package:sistema_matricula/domain/login/use_cases/do_login_use_case.dart';
import 'package:sistema_matricula/domain/login/use_cases/register_user_use_case.dart';

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
    // _getIt.registerFactory<LoginDatasource>(
    //   () => LoginDatasource(
    //     apiHandler: _getIt(),
    //     sharedServices: _getIt(),
    //     saveTokenUseCase: _getIt(),
    //   ),
    // );
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
    // _getIt.registerFactory<GenerateV3TokenRepository>(
    //   () => V3TokenRepositoryImpl(
    //     internalTokenDatasource: _getIt(),
    //   ),
    // );
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
    // _getIt.registerFactory(
    //   () => GenerateV3TokenUseCase(
    //     _getIt(),
    //   ),
    // );
  }
}
