import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:sistema_matricula/presentation/login/controller/login_controller.dart';

class LoginModule extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
      doLogin: GetIt.I(),
    ));
  }
}