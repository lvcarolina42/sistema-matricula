import 'package:get/get.dart';
import 'package:sistema_matricula/di/home_module.dart';
import 'package:sistema_matricula/di/login_module.dart';
import 'package:sistema_matricula/di/manage_courses_module.dart';
import 'package:sistema_matricula/di/register_module.dart';
import 'package:sistema_matricula/presentation/home/home_page.dart';
import 'package:sistema_matricula/presentation/login/login_page.dart';
import 'package:sistema_matricula/presentation/manage_courses/controller/menage_courses_controller.dart';
import 'package:sistema_matricula/presentation/manage_courses/menage_courses_page.dart';
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
    GetPage(
      name: Paths.manageCourses,
      page: () => ManageCoursesPage(),
      binding: ManageCoursesModule(),
    ),
  ];
}