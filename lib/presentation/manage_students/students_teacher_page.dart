import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/presentation/manage_students/controller/manage_students_controller.dart';

class StudenstsTeacherPage extends StatefulWidget {
  final int subjectId;

  const StudenstsTeacherPage({super.key, required this.subjectId});

  @override
  State<StudenstsTeacherPage> createState() => _StudenstsTeacherPageState();
}

class _StudenstsTeacherPageState extends State<StudenstsTeacherPage> {
  final controller = Get.find<ManageStudentsController>();

  @override
  void initState() {
    super.initState();
    controller.getStudentTeacher(widget.subjectId);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: controller.studentsTeacher.isNotEmpty ? ListView(
                  children: [
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Nome')),
                        DataColumn(label: Text('Cpf')),
                        DataColumn(label: Text('Período')),
                      ],
                      rows: controller.studentsTeacher.map((student) {
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