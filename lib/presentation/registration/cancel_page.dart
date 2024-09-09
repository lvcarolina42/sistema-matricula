import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/presentation/registration/controller/registration_controller.dart';

class CancelPage extends StatefulWidget {
  const CancelPage({super.key});

  @override
  State<CancelPage> createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {
  final controller = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: controller.isRegistred ? Column(
            children: [
              const SizedBox(height: 32.0),
              Expanded(
                child: ListView(
                  children: [
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Código')),
                        DataColumn(label: Text('Nome')),
                        DataColumn(label: Text('Créditos')),
                        DataColumn(label: Text('Período')),
                        DataColumn(label: Text('Preço')),
                        DataColumn(label: Text('Tipo')),
                        DataColumn(label: Text('Ação')),
                      ],
                      rows: controller.registratedSubjects.map((subject) {
                        return DataRow(
                          color: WidgetStateColor.resolveWith((states) {
                            Color color = Colors.white;
                            return color;
                          }),
                          cells: [
                            DataCell(Text(subject.code.toString())),
                            DataCell(Text(subject.name)),
                            DataCell(Text(subject.credits.toString())),
                            DataCell(Text(subject.period.toString())),
                            DataCell(Text(subject.price.toString())),
                            DataCell(Text(subject.isOptional ? 'Optativa' : 'Obrigatória')),
                            DataCell(
                              IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _showCancelDialog(context, controller: controller, subject: subject);
                                  setState(() {
                                    
                                  });
                                },
                              ),
                            ),
                          ]
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ) : const Center(
            child: Text('Você não está matriculado para este período!'),
          ),
        );
      }
    );
  }
}

void _showCancelDialog(BuildContext context, {required RegistrationController controller, required SubjectModel subject}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirmação de cancelamento"),
        content: const Text("Você deseja cancelar a matéria?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              controller.deleteRegister(subject);
            },
            child: const Text("Sim"),
          ),
        ],
      );
    },
  );
}