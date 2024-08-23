import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sistema_matricula/presentation/manage_courses/controller/menage_courses_controller.dart';

class ManageCoursesPage extends StatelessWidget {
  final ManageCoursesController controller = Get.find<ManageCoursesController>();
  
  ManageCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView(
                  children: [
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Código')),
                        DataColumn(label: Text('Nome')),
                        DataColumn(label: Text('Créditos')),
                        DataColumn(label: Text('Períodos')),
                        DataColumn(label: Text('Ações')),
                      ],
                      rows: controller.courses.map((course) {
                        return DataRow(
                          cells: [
                            DataCell(Text(course.code.toString())),
                            DataCell(Text(course.name)),
                            DataCell(Text(course.credits.toString())),
                            DataCell(Text(course.periods.toString())),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () => {}
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => {},
                                  ),
                                ],
                              )
                            )
                          ]
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () => _showAddCourseDialog(context, controller),
                child: Container(
                  height: 48.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Adicionar Curso",
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

void _showAddCourseDialog(BuildContext context, ManageCoursesController controller) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Novo curso'),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                autofocus: true,
                controller: controller.courseCode,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Código",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, informe o código do curso";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.courseName,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, informe o nome do curso";
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
                    return "Por favor, informe o crédito do curso";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.periods,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Períodos",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, informe o período do curso";
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
              controller.registerCourse();
            },
          ),
        ],
      );
    },
  );
}
