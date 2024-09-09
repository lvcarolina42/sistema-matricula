import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/presentation/registration/controller/registration_controller.dart';

class BoletoPage extends StatefulWidget {
  const BoletoPage({super.key});

  @override
  State<BoletoPage> createState() => _BoletoPageState();
}

class _BoletoPageState extends State<BoletoPage> {
  final controller = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: controller.boleto != null ? Container(
            child: Column(
              children: [
                Text(
                  'Novo boleto',
                ),
                Text(
                  "R\$ ${controller.boleto!.value.toStringAsFixed(2)}",
                ),
              ],
            ),
          ) : Container(),
        );
      }
    );
  }
}
