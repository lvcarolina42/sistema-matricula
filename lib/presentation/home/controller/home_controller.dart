import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/login/models/boleto_model.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/login/use_cases/do_login_use_case.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_boleto_use_case.dart';
import 'package:sistema_matricula/shared/app_routes/paths.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerStore with _$HomeController;

abstract class HomeControllerStore extends DisposableInterface with Store {
  final GetBoletoUseCase _getBoletoUseCase;

  HomeControllerStore(this._getBoletoUseCase);

  UserModel? user;

  @observable
  BoletoModel? _boleto;

  @computed
  BoletoModel? get boleto => _boleto;

  @override
  void onInit() async {
    user = Get.arguments;

    final response = await _getBoletoUseCase.call(user!.id);

    _boleto = response;

    super.onInit();
  }
}