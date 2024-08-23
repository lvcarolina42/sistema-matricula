import 'package:get/get.dart';

class ManageCoursesModule extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ManageCoursesModule());
  }
}