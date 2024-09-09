<<<<<<< Updated upstream
=======
import 'package:sistema_matricula/domain/registration/models/registration_model.dart';

>>>>>>> Stashed changes
enum SubjectType { 
  required(name: "Obrigatória", value: false),
  optional(name: "Optativa", value: true),;
  
  final bool value;
  final String name;

  const SubjectType({required this.name, required this.value});
}

class SubjectModel {
  final int id;
  final int code;
  final int period;
  final String name;
  final int credits;
  final int courseId;
  final double price;
  final bool isOptional;

  SubjectModel({
    required this.id,
    required this.code,
    required this.name,
    required this.price,
    required this.period,
    required this.credits,
    required this.courseId,
    required this.isOptional,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'price': price,
      'periods': period,
      'credits': credits,
      'courseId': courseId,
      'isOptional': isOptional ? "TRUE" : "FALSE",
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'],
      code: map['code'],
      name: map['name'],
      price: map['price'],
      period: map['periods'],
      credits: map['credits'],
      courseId: map['courseId'],
      isOptional: map['isOptional'] == "TRUE",
    );
  }
<<<<<<< Updated upstream
=======

  RegistrationModel toRegistrationModel(int studentId) {
    return RegistrationModel(
      id: 0,
      subjectId: id,
      courseId: courseId,
      studentId: studentId,
    );
  }
>>>>>>> Stashed changes
}