import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:sistema_matricula/presentation/home/controller/home_controller.dart';
import 'package:sistema_matricula/presentation/manage_courses/controller/menage_courses_controller.dart';

class HomeModule extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ManageCoursesController(
      GetIt.I(),
      GetIt.I(),
    ));
  }
}