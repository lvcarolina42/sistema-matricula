import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:sistema_matricula/presentation/home/controller/home_controller.dart';
import 'package:sistema_matricula/presentation/manage_courses/controller/menage_courses_controller.dart';
import 'package:sistema_matricula/presentation/manage_students/controller/manage_students_controller.dart';
import 'package:sistema_matricula/presentation/manage_subject/controller/menage_subject_controller.dart';
import 'package:sistema_matricula/presentation/manage_teachers/controller/manage_teachers_controller.dart';
import 'package:sistema_matricula/presentation/registration/controller/registration_controller.dart';

class HomeModule extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ManageCoursesController(
      GetIt.I(),
      GetIt.I(),
    ));
    Get.lazyPut(() => ManageSubjectController(
      GetIt.I(),
      GetIt.I(),
      GetIt.I(),
    ));
    Get.lazyPut(() => ManageTeachersController(
      GetIt.I(),
      GetIt.I(),
      GetIt.I(),
      GetIt.I(),
    ));
    Get.lazyPut(() => ManageStudentsController(
      GetIt.I(),
      GetIt.I(),
      GetIt.I(),
    ));
    Get.lazyPut(() => RegistrationController(
      GetIt.I(),
      GetIt.I(),
    ));
  }
}