import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_courses_use_case.dart';
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_students_by_subject_id.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/subjects/use_cases/get_subjects_use_case.dart';

part 'manage_students_controller.g.dart';

class ManageStudentsController = ManageStudentsControllerStore with _$ManageStudentsController;

abstract class ManageStudentsControllerStore extends DisposableInterface with Store {
  final GetCoursesUseCase _getCoursesUseCase;
  final GetSubjectsUseCase _getSubjectsUseCase;
  final GetStudentsBySubjectId _getStudentsBySubjectId;

  ManageStudentsControllerStore(
    this._getCoursesUseCase,
    this._getSubjectsUseCase,
    this._getStudentsBySubjectId,
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
  ObservableList<StudentModel> _students = ObservableList<StudentModel>.of([]);

  @computed
  List<StudentModel> get students => _students;

  final TextEditingController teacherCpf = TextEditingController();
  final TextEditingController teacherName = TextEditingController();
  final TextEditingController teacherPassword = TextEditingController();
  final TextEditingController teacherPasswordConfirm = TextEditingController();

  @action
  void setSelectedCourse(CourseModel course) {
    selectedCourse = course;
    getSubjects();
  }

  @action
  void setSelectedSubject(SubjectModel subject) {
    selectedSubject = subject;
    getStudents();
  }

  set _setDataSubjects(List<SubjectModel> data) {
    _subjects.replaceRange(0, _subjects.length, data);
  }

  set _setDataTeachers(List<StudentModel> data) {
    _students.replaceRange(0, _students.length, data);
    _students.sort((a, b) => a.name.compareTo(b.name));
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
      final response = await _getSubjectsUseCase(selectedCourse!.id).asObservable();
      _setDataSubjects = response;
    }
  }

  @action
  Future<void> getStudents() async {
    if (selectedSubject != null) {
      final response = await _getStudentsBySubjectId(selectedSubject!.id);
      _setDataTeachers = response;
    }
  }
}