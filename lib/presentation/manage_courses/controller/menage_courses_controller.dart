import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_courses_use_case.dart';
import 'package:sistema_matricula/domain/courses/use_cases/register_course_use_case.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';

part 'menage_courses_controller.g.dart';

class ManageCoursesController = ManageCoursesControllerStore with _$ManageCoursesController;

abstract class ManageCoursesControllerStore extends DisposableInterface with Store {
  final RegisterCourseUseCase _registerCourseUseCase;
  final GetCoursesUseCase _getCoursesUseCase;

  ManageCoursesControllerStore(this._registerCourseUseCase, this._getCoursesUseCase);

  final TextEditingController courseCode = TextEditingController();
  final TextEditingController courseName = TextEditingController();
  final TextEditingController credits = TextEditingController();
  final TextEditingController periods = TextEditingController();

  @observable
  ObservableList<CourseModel> _courses = ObservableList<CourseModel>.of([]);

  @computed
  List<CourseModel> get courses => _courses;

  @override
  void onInit() {
    getCourses();
    super.onInit();
  }

  @action
  Future<void> registerCourse() async {
    final course = CourseModel(
      code: int.parse(courseCode.text),
      name: courseName.text,
      credits: int.parse(credits.text),
      periods: int.parse(periods.text),
    );
    await _registerCourseUseCase(course);
    getCourses();
  }

  @action
  Future<void> getCourses() async {
    _courses = (await _getCoursesUseCase()).asObservable();
    print (_courses);
  }
  
}