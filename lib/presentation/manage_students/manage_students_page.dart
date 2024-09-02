import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/presentation/manage_students/controller/manage_students_controller.dart';

class ManageStudentsPage extends StatefulWidget {
  const ManageStudentsPage({super.key});

  @override
  State<ManageStudentsPage> createState() => _ManageStudentsPageState();
}

class _ManageStudentsPageState extends State<ManageStudentsPage> {
  final controller = Get.find<ManageStudentsController>();

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
                child: controller.students.isNotEmpty ? ListView(
                  children: [
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Nome')),
                        DataColumn(label: Text('Cpf')),
                        DataColumn(label: Text('Período')),
                      ],
                      rows: controller.students.map((student) {
                        return DataRow(
                          cells: [
                            DataCell(Text(student.name)),
                            DataCell(Text(student.cpf)),
                            DataCell(Text(student.period.toString())),
                          ]
                        );
                      }).toList(),
                    ),
                  ],
                ) : const Center(
                  child: Text('Nenhuma aluno encontrado'),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}