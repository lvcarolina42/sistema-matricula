import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/presentation/manage_teachers/controller/manage_teachers_controller.dart';

class ManageTeachersPage extends StatefulWidget {
  const ManageTeachersPage({super.key});

  @override
  State<ManageTeachersPage> createState() => _ManageTeachersPageState();
}

class _ManageTeachersPageState extends State<ManageTeachersPage> {
  final controller = Get.find<ManageTeachersController>();

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
                      controller.getSubjects();
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
              if (controller.subjects.isNotEmpty)
                DropdownButtonFormField<SubjectModel>(
                  value: controller.selectedSubject,
                  focusColor: Colors.transparent,
                  decoration: const InputDecoration(
                    labelText: "Selecione a disciplina",
                    border: OutlineInputBorder(),
                  ),
                  items: controller.subjects.map((subject) {
                    return DropdownMenuItem(
                      value: subject,
                      child: Text(subject.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        controller.setSelectedSubject(value);
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Por favor, informe a disciplina";
                    }
                    return null;
                  },
                ),
              Expanded(
                child: controller.teachers.isNotEmpty ? ListView(
                  children: [
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Nome')),
                        DataColumn(label: Text('Cpf')),
                      ],
                      rows: controller.teachers.map((teacher) {
                        return DataRow(
                          cells: [
                            DataCell(Text(teacher.name)),
                            DataCell(Text(teacher.cpf)),
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
                  if (controller.selectedSubject != null) {
                    _showAddSubjectDialog(context, controller);
                  }
                },
                child: Container(
                  height: 48.0,
<<<<<<< Updated upstream
                  width: 300.0,
=======
>>>>>>> Stashed changes
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Adicionar professor",
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

void _showAddSubjectDialog(BuildContext context, ManageTeachersController controller) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Novo professor'),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                autofocus: true,
                controller: controller.teacherName,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, informe o nome";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                autofocus: true,
                controller: controller.teacherCpf,
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
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.teacherPassword,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, informe a sua senha";
                  }
                  return null;
                },
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
              controller.addTeacher();
            },
          ),
        ],
      );
    },
  );
}

