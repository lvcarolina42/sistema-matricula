import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/presentation/register/controller/register_controller.dart';

enum BodyStage {
  baseInfo,
  address,
  finish
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = Get.find<RegisterController>();

  BodyStage bodyStage = BodyStage.baseInfo;
  
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 420.0, vertical: 32.0),
            child: BodyInitialBaseInfo(controller: controller),
          ),
        );
      }
    );
  }
}

class BodyInitialBaseInfo extends StatefulWidget {
  const BodyInitialBaseInfo({
    super.key,
    required this.controller,
  });

  final RegisterController controller;

  @override
  State<BodyInitialBaseInfo> createState() => _BodyInitialBaseInfoState();
}

class _BodyInitialBaseInfoState extends State<BodyInitialBaseInfo> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.formKeyRegister,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Seja bem-vindo!",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            "Crie sua conta para acessar o sistema de matrículas",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 30.0),
          DropdownButtonFormField(
            value: null,
            decoration: const InputDecoration(
              labelText: "Tipo de usuário",
              border: OutlineInputBorder(),
            ),
            items: UserType.values.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(type.name),
              );
            }).toList(),
            onChanged: (value) {
              widget.controller.userTypeRegister = value!;
            },
            validator: (value) {
              if (value == null) {
                return "Selecione o tipo de usuário";
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: widget.controller.nameControllerRegister,
            decoration: const InputDecoration(
              labelText: "Nome completo",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, informe o seu nome";
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: widget.controller.cpfControllerRegister,
            decoration: const InputDecoration(
              labelText: "CPF",
              border: OutlineInputBorder(),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')}),
            ],
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, informe o seu CPF";
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: widget.controller.passwordControllerRegister,
            obscureText: !widget.controller.showPasswordRegister,
            decoration: InputDecoration(
              labelText: "Senha",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(!widget.controller.showPasswordRegister ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    widget.controller.toggleShowPasswordRegister();
                  });
                }
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, informe a sua senha";
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: widget.controller.confirmPasswordControllerRegister,
            obscureText: !widget.controller.showConfirmPasswordRegister,
            decoration: InputDecoration(
              labelText: "Confirmar senha",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(!widget.controller.showConfirmPasswordRegister ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    widget.controller.toggleShowConfirmPasswordRegister();
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, confirme a sua senha";
              }
              if (value != widget.controller.passwordControllerRegister.text) {
                return "As senhas não conferem";
              }
              return null;
            },
          ),
          const SizedBox(height: 32.0),
          GestureDetector(
            onTap: () {
              widget.controller.registerBaseInfo();
            },
            child: Container(
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Text(
                  "Continuar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}