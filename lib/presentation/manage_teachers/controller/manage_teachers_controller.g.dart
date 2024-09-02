// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_teachers_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManageTeachersController on ManageTeachersControllerStore, Store {
  Computed<List<CourseModel>>? _$coursesComputed;

  @override
  List<CourseModel> get courses =>
      (_$coursesComputed ??= Computed<List<CourseModel>>(() => super.courses,
              name: 'ManageTeachersControllerStore.courses'))
          .value;
  Computed<CourseModel?>? _$selectedCourseValueComputed;

  @override
  CourseModel? get selectedCourseValue => (_$selectedCourseValueComputed ??=
          Computed<CourseModel?>(() => super.selectedCourseValue,
              name: 'ManageTeachersControllerStore.selectedCourseValue'))
      .value;
  Computed<List<SubjectModel>>? _$subjectsComputed;

  @override
  List<SubjectModel> get subjects =>
      (_$subjectsComputed ??= Computed<List<SubjectModel>>(() => super.subjects,
              name: 'ManageTeachersControllerStore.subjects'))
          .value;
  Computed<SubjectModel?>? _$selectedSubjectValueComputed;

  @override
  SubjectModel? get selectedSubjectValue => (_$selectedSubjectValueComputed ??=
          Computed<SubjectModel?>(() => super.selectedSubjectValue,
              name: 'ManageTeachersControllerStore.selectedSubjectValue'))
      .value;
  Computed<List<TeacherModel>>? _$teachersComputed;

  @override
  List<TeacherModel> get teachers =>
      (_$teachersComputed ??= Computed<List<TeacherModel>>(() => super.teachers,
              name: 'ManageTeachersControllerStore.teachers'))
          .value;

  late final _$_coursesAtom =
      Atom(name: 'ManageTeachersControllerStore._courses', context: context);

  @override
  ObservableList<CourseModel> get _courses {
    _$_coursesAtom.reportRead();
    return super._courses;
  }

  @override
  set _courses(ObservableList<CourseModel> value) {
    _$_coursesAtom.reportWrite(value, super._courses, () {
      super._courses = value;
    });
  }

  late final _$selectedCourseAtom = Atom(
      name: 'ManageTeachersControllerStore.selectedCourse', context: context);

  @override
  CourseModel? get selectedCourse {
    _$selectedCourseAtom.reportRead();
    return super.selectedCourse;
  }

  @override
  set selectedCourse(CourseModel? value) {
    _$selectedCourseAtom.reportWrite(value, super.selectedCourse, () {
      super.selectedCourse = value;
    });
  }

  late final _$_subjectsAtom =
      Atom(name: 'ManageTeachersControllerStore._subjects', context: context);

  @override
  ObservableList<SubjectModel> get _subjects {
    _$_subjectsAtom.reportRead();
    return super._subjects;
  }

  @override
  set _subjects(ObservableList<SubjectModel> value) {
    _$_subjectsAtom.reportWrite(value, super._subjects, () {
      super._subjects = value;
    });
  }

  late final _$selectedSubjectAtom = Atom(
      name: 'ManageTeachersControllerStore.selectedSubject', context: context);

  @override
  SubjectModel? get selectedSubject {
    _$selectedSubjectAtom.reportRead();
    return super.selectedSubject;
  }

  @override
  set selectedSubject(SubjectModel? value) {
    _$selectedSubjectAtom.reportWrite(value, super.selectedSubject, () {
      super.selectedSubject = value;
    });
  }

  late final _$_teachersAtom =
      Atom(name: 'ManageTeachersControllerStore._teachers', context: context);

  @override
  ObservableList<TeacherModel> get _teachers {
    _$_teachersAtom.reportRead();
    return super._teachers;
  }

  @override
  set _teachers(ObservableList<TeacherModel> value) {
    _$_teachersAtom.reportWrite(value, super._teachers, () {
      super._teachers = value;
    });
  }

  late final _$getCoursesAsyncAction =
      AsyncAction('ManageTeachersControllerStore.getCourses', context: context);

  @override
  Future<void> getCourses() {
    return _$getCoursesAsyncAction.run(() => super.getCourses());
  }

  late final _$getSubjectsAsyncAction = AsyncAction(
      'ManageTeachersControllerStore.getSubjects',
      context: context);

  @override
  Future<void> getSubjects() {
    return _$getSubjectsAsyncAction.run(() => super.getSubjects());
  }

  late final _$getTeachersAsyncAction = AsyncAction(
      'ManageTeachersControllerStore.getTeachers',
      context: context);

  @override
  Future<void> getTeachers() {
    return _$getTeachersAsyncAction.run(() => super.getTeachers());
  }

  late final _$addTeacherAsyncAction =
      AsyncAction('ManageTeachersControllerStore.addTeacher', context: context);

  @override
  Future<void> addTeacher() {
    return _$addTeacherAsyncAction.run(() => super.addTeacher());
  }

  late final _$ManageTeachersControllerStoreActionController =
      ActionController(name: 'ManageTeachersControllerStore', context: context);

  @override
  void setSelectedCourse(CourseModel course) {
    final _$actionInfo = _$ManageTeachersControllerStoreActionController
        .startAction(name: 'ManageTeachersControllerStore.setSelectedCourse');
    try {
      return super.setSelectedCourse(course);
    } finally {
      _$ManageTeachersControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedSubject(SubjectModel subject) {
    final _$actionInfo = _$ManageTeachersControllerStoreActionController
        .startAction(name: 'ManageTeachersControllerStore.setSelectedSubject');
    try {
      return super.setSelectedSubject(subject);
    } finally {
      _$ManageTeachersControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCourse: ${selectedCourse},
selectedSubject: ${selectedSubject},
courses: ${courses},
selectedCourseValue: ${selectedCourseValue},
subjects: ${subjects},
selectedSubjectValue: ${selectedSubjectValue},
teachers: ${teachers}
    ''';
  }
}
