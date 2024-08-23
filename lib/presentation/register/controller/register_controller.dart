import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/login/use_cases/register_user_use_case.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerStore with _$RegisterController;

abstract class RegisterControllerStore extends DisposableInterface with Store {
  final RegisterUserUseCase registerUser;

  RegisterControllerStore({required this.registerUser});

  UserType userTypeRegister = UserType.student;
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  final TextEditingController cpfControllerRegister = TextEditingController();
  final TextEditingController nameControllerRegister = TextEditingController();
  final TextEditingController passwordControllerRegister = TextEditingController();
  final TextEditingController confirmPasswordControllerRegister = TextEditingController();  

  @observable
  bool _showPasswordRegister = false;

  @computed
  bool get showPasswordRegister => _showPasswordRegister;

  @observable
  bool _showConfirmPasswordRegister = false;

  @computed
  bool get showConfirmPasswordRegister => _showConfirmPasswordRegister;

  UserModel? initialUser;

  @action
  void toggleShowPasswordRegister() {
    _showPasswordRegister = !_showPasswordRegister;
  }

  @action
  void toggleShowConfirmPasswordRegister() {
    _showConfirmPasswordRegister = !_showConfirmPasswordRegister;
  }

  @action
  Future<void> registerBaseInfo() async {
    if (formKeyRegister.currentState!.validate()) {
      final user = UserModel(
        type: userTypeRegister,
        cpf: cpfControllerRegister.text,
        name: nameControllerRegister.text,
        password: passwordControllerRegister.text,
      );

      initialUser = user;

      await registerUser(user);
    }
  }
}