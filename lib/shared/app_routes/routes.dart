import 'package:get/get.dart';
import 'package:sistema_matricula/di/home_module.dart';
import 'package:sistema_matricula/di/login_module.dart';
import 'package:sistema_matricula/di/register_module.dart';
import 'package:sistema_matricula/presentation/home/home_page.dart';
import 'package:sistema_matricula/presentation/login/login_page.dart';
import 'package:sistema_matricula/presentation/register/register_page.dart';
import 'package:sistema_matricula/shared/app_routes/paths.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(
      name: Paths.login,
      page: () => const LoginPage(),
      binding: LoginModule(),
    ),
    GetPage(
      name: Paths.register,
      page: () => const RegisterPage(),
      binding: RegisterModule(),
    ),
    GetPage(
      name: Paths.home,
      page: () => const HomePage(),
      binding: HomeModule(),
    ),
  ];
}