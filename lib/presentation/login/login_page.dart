import 'package:flutter/material.dart';
import 'package:sistema_matricula/presentation/login/widgets/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Row(
        children: [
          Spacer(),
          LoginWidget(),
        ],
      )
    );
  }
}