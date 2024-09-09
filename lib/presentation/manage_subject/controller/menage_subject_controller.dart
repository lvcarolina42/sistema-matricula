import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_courses_use_case.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/subjects/use_cases/get_subjects_use_case.dart';
import 'package:sistema_matricula/domain/subjects/use_cases/register_subject_use_case.dart';

part 'menage_subject_controller.g.dart';

class ManageSubjectController = ManageSubjectControllerStore with _$ManageSubjectController;

abstract class ManageSubjectControllerStore extends DisposableInterface with Store {
  final GetCoursesUseCase _getCoursesUseCase;
  final GetSubjectsUseCase _getSubjectsUseCase;
  final RegisterSubjectUseCase _registerSubjectUseCase;

  ManageSubjectControllerStore(
    this._getCoursesUseCase,
    this._getSubjectsUseCase,
    this._registerSubjectUseCase
  );

  @observable
  ObservableList<CourseModel> _courses = ObservableList<CourseModel>.of([]);

  @computed
  List<CourseModel> get courses => _courses;

  @observable
  CourseModel? selectedCourse;

  @observable
  ObservableList<SubjectModel> _subjects = ObservableList<SubjectModel>.of([]);

  @computed
  List<SubjectModel> get subjects => _subjects;

  @computed
  CourseModel? get selectedCourseValue => selectedCourse;

  final TextEditingController period = TextEditingController();
  final TextEditingController credits = TextEditingController();
  final TextEditingController subjectName = TextEditingController();
  final TextEditingController subjectCode = TextEditingController();
  final TextEditingController price = TextEditingController();

  @observable
  SubjectType _subjectType = SubjectType.required;

  @computed
  SubjectType get subjectType => _subjectType;

  set setSubjectType (SubjectType value) => _subjectType = value;

  @action
  void setSelectedCourse(CourseModel course) {
    selectedCourse = course;
    getSubjects();
  }

  set _setDataSubjects(List<SubjectModel> data) {
    _subjects.replaceRange(0, _subjects.length, data);
    _subjects.sort((a, b) => a.period.compareTo(b.period));
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
  Future<void> addSubject() async {
    if (selectedCourse != null) {
      final subject = SubjectModel(
        id: 0,
        isOptional: subjectType.value,
        name: subjectName.text,
        courseId: selectedCourse!.id,
        period: int.parse(period.text),
        credits: int.parse(credits.text),
        code: int.parse(subjectCode.text),
        price: double.parse(price.text.replaceAll('R\$ ', '')),
      );
      await _registerSubjectUseCase(subject);
      await getSubjects();
    }
  }
  
}