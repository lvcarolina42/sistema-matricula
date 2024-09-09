import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_courses_use_case.dart';
import 'package:sistema_matricula/domain/login/models/teacher_model.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/subjects/use_cases/get_subjects_use_case.dart';
import 'package:sistema_matricula/domain/teachers/use_cases/get_teachers_use_case.dart';
import 'package:sistema_matricula/domain/teachers/use_cases/register_teacher_use_case.dart';

part 'manage_teachers_controller.g.dart';

class ManageTeachersController = ManageTeachersControllerStore with _$ManageTeachersController;

abstract class ManageTeachersControllerStore extends DisposableInterface with Store {
  final GetCoursesUseCase _getCoursesUseCase;
  final GetSubjectsUseCase _getSubjectsUseCase;
  final GetTeachersUseCase _getTeachersUseCase;
  final RegisterTeacherUseCase _registerTeacherUseCase;

  ManageTeachersControllerStore(
    this._getCoursesUseCase,
    this._getSubjectsUseCase,
    this._getTeachersUseCase,
    this._registerTeacherUseCase,
  );

  @observable
  ObservableList<CourseModel> _courses = ObservableList<CourseModel>.of([]);

  @computed
  List<CourseModel> get courses => _courses;

  @observable
  CourseModel? selectedCourse;

  @computed
  CourseModel? get selectedCourseValue => selectedCourse;

  @observable
  ObservableList<SubjectModel> _subjects = ObservableList<SubjectModel>.of([]);

  @computed
  List<SubjectModel> get subjects => _subjects;

  @observable
  SubjectModel? selectedSubject;

  @computed
  SubjectModel? get selectedSubjectValue => selectedSubject;

  @observable
  ObservableList<TeacherModel> _teachers = ObservableList<TeacherModel>.of([]);

  @computed
  List<TeacherModel> get teachers => _teachers;

  final TextEditingController teacherCpf = TextEditingController();
  final TextEditingController teacherName = TextEditingController();
  final TextEditingController teacherPassword = TextEditingController();
  final TextEditingController teacherPasswordConfirm = TextEditingController();

  @action
  void setSelectedCourse(CourseModel course) {
    selectedSubject = null;
    selectedCourse = course;
    getSubjects();
  }

  @action
  void setSelectedSubject(SubjectModel subject) {
    selectedSubject = subject;
    getTeachers();
  }

  set _setDataSubjects(List<SubjectModel> data) {
    _subjects.replaceRange(0, _subjects.length, data);
  }

  set _setDataTeachers(List<TeacherModel> data) {
    _teachers.replaceRange(0, _teachers.length, data);
    _teachers.sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  void onInit() {
    getCourses();
    super.onInit();
  }

  @action
  Future<void> getCourses() async {
    _courses = (await _getCoursesUseCase()).asObservable();
  }

  @action
  Future<void> getSubjects() async {
    if (selectedCourse != null) {
      final response = await _getSubjectsUseCase(selectedCourse!.id, null);
      _setDataSubjects = response;
    }
  }

  @action
  Future<void> getTeachers() async {
    if (selectedSubject != null) {
      final response = await _getTeachersUseCase(selectedSubject!);
      _setDataTeachers = response;
    }
  }

  @action
  Future<void> addTeacher() async {
    if (selectedSubject != null) {
      final teacher = TeacherModel(
        id: 0,
        cpf: teacherCpf.text,
        name: teacherName.text,
        subject: selectedSubject!,
        password: teacherPassword.text,
      );
      await _registerTeacherUseCase(teacher);
      
      selectedSubject = null;
      await getSubjects();
    }
  }
}