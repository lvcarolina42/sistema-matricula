import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/presentation/manage_subject/controller/menage_subject_controller.dart';

class ManageSubjectPage extends StatefulWidget {
  const ManageSubjectPage({super.key});

  @override
  State<ManageSubjectPage> createState() => _ManageSubjectPageState();
}

class _ManageSubjectPageState extends State<ManageSubjectPage> {
  final controller = Get.find<ManageSubjectController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<CourseModel>(
                value: controller.selectedCourse,
                focusColor: Colors.transparent,
                decoration: const InputDecoration(
                  labelText: "Selecione o curso",
                  border: OutlineInputBorder(),
                ),
                items: controller.courses.map((course) {
                  return DropdownMenuItem(
                    value: course,
                    child: Text(course.name),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      controller.setSelectedCourse(value);
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return "Por favor, informe o curso";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: controller.subjects.isNotEmpty ? ListView(
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
                      rows: controller.subjects.map((subject) {
                        return DataRow(
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
                ) : const Center(
                  child: Text('Nenhuma disciplina encontrada'),
                ),
              ),
              const SizedBox(height: 24.0),
              GestureDetector(
                onTap: () {
                  if (controller.selectedCourse != null) {
                    _showAddSubjectDialog(context, controller);
                  }
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
                      "Adicionar Disciplina",
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
    );
  }
}

void _showAddSubjectDialog(BuildContext context, ManageSubjectController controller) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Nova disciplina'),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                autofocus: true,
                controller: controller.subjectCode,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Código",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, informe o código da disciplina";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.subjectName,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, informe o nome da disciplina";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.credits,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Créditos",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, informe os créditos da disciplina";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.period,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Período",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, informe o período da disciplina";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.price,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  MaskTextInputFormatter(mask: "R\$ ###.##", filter: {"#": RegExp(r'[0-9]')}),
                ],
                decoration: const InputDecoration(
                  labelText: "Preço",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<SubjectType>(
                value: controller.subjectType,
                items: SubjectType.values.map((type) {
                  return DropdownMenuItem<SubjectType>(
                    value: type,
                    child: Text(type.name),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.setSubjectType = value!;
                },
                decoration: const InputDecoration(
                  labelText: "Tipo",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Adicionar'),
            onPressed: () {
              Navigator.of(context).pop();
              controller.addSubject();
            },
          ),
        ],
      );
    },
  );
}
