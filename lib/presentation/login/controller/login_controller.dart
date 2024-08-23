import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/login/use_cases/do_login_use_case.dart';
import 'package:sistema_matricula/domain/login/use_cases/register_user_use_case.dart';
import 'package:sistema_matricula/shared/app_routes/paths.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerStore with _$LoginController;

abstract class LoginControllerStore extends DisposableInterface with Store {
  final DoLoginUseCase doLogin;

  LoginControllerStore({required this.doLogin});

  UserType userType = UserType.student;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();  

  @observable
  bool _showPassword = false;

  @computed
  bool get showPassword => _showPassword;

  @action
  void toggleShowPassword() {
    _showPassword = !_showPassword;
  }

  @action
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final user = await doLogin(
        userType: userType, 
        cpf: cpfController.text, 
        password: passwordController.text,
      );

      if(user != null) {
        Get.offAllNamed(Paths.home, arguments: user);
      }
    }
  }
}