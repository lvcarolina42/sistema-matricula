import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/presentation/manage_students/controller/manage_students_controller.dart';

class CreateBoleto extends StatefulWidget {
  const CreateBoleto({super.key});

  @override
  State<CreateBoleto> createState() => _CreateBoletoState();
}

class _CreateBoletoState extends State<CreateBoleto> {
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
              if (controller.studentsBoleto.isNotEmpty)
                DropdownButtonFormField<StudentModel>(
                  value: controller.selectedStudent,
                  focusColor: Colors.transparent,
                  decoration: const InputDecoration(
                    labelText: "Selecione o aluno",
                    border: OutlineInputBorder(),
                  ),
                  items: controller.studentsBoleto.map((subject) {
                    return DropdownMenuItem(
                      value: subject,
                      child: Text(subject.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        controller.setSelectedStudent(value);
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Por favor, informe o aluno";
                    }
                    return null;
                  },
                ),
                Expanded(
                  child: controller.subjectsBoleto.isNotEmpty ? ListView(
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
                        rows: controller.subjectsBoleto.map((subject) {
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
              Text("Total: R\$ ${controller.totalValue.toStringAsFixed(2)}"),
              const SizedBox(height: 24.0),
              GestureDetector(
                onTap: () {
                  controller.generatedBoleto ? null : controller.insertBoleto();
                },
                child: Container(
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: controller.generatedBoleto ? Colors.grey : Colors.amber,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Gerar boleto",
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