import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_course_use_case.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_courses_use_case.dart';
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_students_by_subject_id.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/subjects/use_cases/get_subjects_use_case.dart';
import 'package:sistema_matricula/presentation/home/controller/home_controller.dart';

part 'registration_controller.g.dart';

class RegistrationController = RegistrationControllerStore with _$RegistrationController;

abstract class RegistrationControllerStore extends DisposableInterface with Store {
  final GetCourseUseCase _getCourseUseCase;
  final GetSubjectsUseCase _getSubjectsUseCase;

  RegistrationControllerStore(
    this._getCourseUseCase,
    this._getSubjectsUseCase,
  );

  CourseModel? _course;

  @observable
  ObservableList<SubjectModel> _subjects = ObservableList<SubjectModel>.of([]);

  @computed
  List<SubjectModel> get subjects => _subjects;

  @observable
  SubjectModel? selectedSubject;

  @computed
  SubjectModel? get selectedSubjectValue => selectedSubject;

  UserModel? userModel;

  @action
  void setSelectedSubject(SubjectModel subject) {
    selectedSubject = subject;
  }

  set _setDataSubjects(List<SubjectModel> data) {
    _subjects.replaceRange(0, _subjects.length, data);
  }

  @override
  void onInit() async {
    final HomeController homeController = Get.find<HomeController>();
    userModel = homeController.user;
    await getCourse();
    await getSubjects();
    super.onInit();
  }

  @action
  Future<void> getCourse() async {
    final response = await _getCourseUseCase(userModel!.courseId);
    _course = response;
  }

  @action
  Future<void> getSubjects() async {
    final response = await _getSubjectsUseCase(_course!.id).asObservable();
      _setDataSubjects = response;
  }

}