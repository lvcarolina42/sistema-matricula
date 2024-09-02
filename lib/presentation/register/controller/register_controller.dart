import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_courses_use_case.dart';
import 'package:sistema_matricula/domain/login/models/secretary_model.dart';
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/login/models/teacher_model.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/login/use_cases/register_user_use_case.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerStore with _$RegisterController;

abstract class RegisterControllerStore extends DisposableInterface with Store {
  final RegisterUserUseCase registerUser;
  final GetCoursesUseCase getCoursesUseCase;

  RegisterControllerStore({required this.registerUser, required this.getCoursesUseCase});

  UserType userTypeRegister = UserType.teacher;
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  final TextEditingController cpfControllerRegister = TextEditingController();
  final TextEditingController nameControllerRegister = TextEditingController();
  final TextEditingController passwordControllerRegister = TextEditingController();
  final TextEditingController confirmPasswordControllerRegister = TextEditingController();  

  @observable
  bool _showPasswordRegister = false;

  @computed
  bool get showPasswordRegister => _showPasswordRegister;

  @observable
  bool _showConfirmPasswordRegister = false;

  @computed
  bool get showConfirmPasswordRegister => _showConfirmPasswordRegister;

  @observable
  ObservableList<CourseModel> _courses = ObservableList<CourseModel>.of([]);

  @computed
  List<CourseModel> get courses => _courses;

  UserModel? initialUser;

  CourseModel? selectedCourse;

  @action
  Future<void> getCourses() async {
    _courses = (await getCoursesUseCase()).asObservable();
  }

  @action
  void toggleShowPasswordRegister() {
    _showPasswordRegister = !_showPasswordRegister;
  }

  @action
  void toggleShowConfirmPasswordRegister() {
    _showConfirmPasswordRegister = !_showConfirmPasswordRegister;
  }

  @action
  Future<void> registerBaseInfo() async {
    if (formKeyRegister.currentState!.validate()) {
      if(userTypeRegister == UserType.secretary) {
        final secretary = SecretaryModel(
          id: 0,
          cpf: cpfControllerRegister.text,
          name: nameControllerRegister.text,
          password: passwordControllerRegister.text,
        );
        
        initialUser = secretary;
      } else if(userTypeRegister == UserType.student) {
        final student = StudentModel(
          courseId: selectedCourse!.id,
          id: 0,
          period: 1,
          cpf: cpfControllerRegister.text,
          courseName: selectedCourse?.name,
          name: nameControllerRegister.text,
          password: passwordControllerRegister.text,
        );

        initialUser = student;
      }

      await registerUser(initialUser!);
    }
  }
}