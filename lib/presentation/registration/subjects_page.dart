import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/presentation/registration/controller/registration_controller.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
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
