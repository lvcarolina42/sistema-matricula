import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/presentation/registration/controller/registration_controller.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final controller = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: !controller.isRegistred ? Column(
            children: [
              SizedBox(height: 16.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue[100],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text('Matriculado'),
                  const SizedBox(width: 32,),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green[100],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text('Selecionado'),
                ],
              ),
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
                      rows: controller.subjects.map((subject) {
                        return DataRow(
                          color: WidgetStateColor.resolveWith((states) {
                            Color color = Colors.white;
                            if (controller.isSubjectSelected(subject)) {
                              color = Colors.green[100]!;
                            }
                            
                            if (controller.isRegistredSubject(subject)) {
                              color = Colors.blue[100]!;
                            }
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
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      controller.toggleSubjectSelected(subject);
                                      setState(() {
                                        
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      controller.removeSubjectSelected(subject);
                                      setState(() {
                                        
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ]
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              GestureDetector(
                onTap: () {
                  controller.register();
                },
                child: Container(
                  height: 48.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Efetuar matrícula",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ) : const Center(
            child: Text('Você já está matriculado neste período!'),
          ),
        );
      }
    );
  }
}