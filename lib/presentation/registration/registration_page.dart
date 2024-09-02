import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/presentation/manage_students/controller/manage_students_controller.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              if(controller.selectedSubject != null)
                Column(
                  children: [
                    Text(controller.selectedSubject!.name),
                    Text(controller.selectedSubject!.credits.toString()),
                    Text(controller.selectedSubject!.period.toString()),
                  ],
                ),
            ],
          ),
        );
      }
    );
  }
}