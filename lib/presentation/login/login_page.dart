import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/presentation/login/controller/login_controller.dart';
import 'package:sistema_matricula/shared/app_routes/paths.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<LoginController>();


  @override
  void dispose() {
    controller.cpfController.dispose();
    controller.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 420.0, vertical: 32.0),
            child: Form(
              key: controller.formKey,
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
                    "Faça login para consultar o sistema de matrículas",
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
                      if (value != null) {
                        controller.userType = value;
                      }
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Por favor, informe o tipo de usuário";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32.0),
                  TextFormField(
                    autofocus: true,
                    controller: controller.cpfController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')}),
                    ],
                    decoration: const InputDecoration(
                      labelText: "CPF",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, informe o seu CPF";
                      }
                      if (value.length != 14) {
                        return "Por favor, informe um CPF válido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32.0),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: !controller.showPassword,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(!controller.showPassword ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            controller.toggleShowPassword();
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, informe a sua senha";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32.0),
                  GestureDetector(
                    onTap: () {
                      controller.login();
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
                          "Entrar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Paths.register);
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
                          "Cadastrar",
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
            ),
          ),
        );
      }
    );
  }
}