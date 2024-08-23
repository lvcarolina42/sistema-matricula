import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/login/use_cases/do_login_use_case.dart';
import 'package:sistema_matricula/shared/app_routes/paths.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerStore with _$HomeController;

abstract class HomeControllerStore extends DisposableInterface with Store {
  HomeControllerStore();

  UserModel? user;

  @override
  void onInit() {
    user = Get.arguments;

    super.onInit();
  }
}