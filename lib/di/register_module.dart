import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:sistema_matricula/presentation/register/controller/register_controller.dart';

class RegisterModule extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(
      registerUser: GetIt.I(),
      getCoursesUseCase: GetIt.I(),
    ));
  }
}