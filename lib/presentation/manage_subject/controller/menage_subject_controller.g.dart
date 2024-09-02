// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menage_subject_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManageSubjectController on ManageSubjectControllerStore, Store {
  Computed<List<CourseModel>>? _$coursesComputed;

  @override
  List<CourseModel> get courses =>
      (_$coursesComputed ??= Computed<List<CourseModel>>(() => super.courses,
              name: 'ManageSubjectControllerStore.courses'))
          .value;
  Computed<List<SubjectModel>>? _$subjectsComputed;

  @override
  List<SubjectModel> get subjects =>
      (_$subjectsComputed ??= Computed<List<SubjectModel>>(() => super.subjects,
              name: 'ManageSubjectControllerStore.subjects'))
          .value;
  Computed<CourseModel?>? _$selectedCourseValueComputed;

  @override
  CourseModel? get selectedCourseValue => (_$selectedCourseValueComputed ??=
          Computed<CourseModel?>(() => super.selectedCourseValue,
              name: 'ManageSubjectControllerStore.selectedCourseValue'))
      .value;
  Computed<SubjectType>? _$subjectTypeComputed;

  @override
  SubjectType get subjectType =>
      (_$subjectTypeComputed ??= Computed<SubjectType>(() => super.subjectType,
              name: 'ManageSubjectControllerStore.subjectType'))
          .value;

  late final _$_coursesAtom =
      Atom(name: 'ManageSubjectControllerStore._courses', context: context);

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
      name: 'ManageSubjectControllerStore.selectedCourse', context: context);

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
      Atom(name: 'ManageSubjectControllerStore._subjects', context: context);

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

  late final _$_subjectTypeAtom =
      Atom(name: 'ManageSubjectControllerStore._subjectType', context: context);

  @override
  SubjectType get _subjectType {
    _$_subjectTypeAtom.reportRead();
    return super._subjectType;
  }

  @override
  set _subjectType(SubjectType value) {
    _$_subjectTypeAtom.reportWrite(value, super._subjectType, () {
      super._subjectType = value;
    });
  }

  late final _$getCoursesAsyncAction =
      AsyncAction('ManageSubjectControllerStore.getCourses', context: context);

  @override
  Future<void> getCourses() {
    return _$getCoursesAsyncAction.run(() => super.getCourses());
  }

  late final _$getSubjectsAsyncAction =
      AsyncAction('ManageSubjectControllerStore.getSubjects', context: context);

  @override
  Future<void> getSubjects() {
    return _$getSubjectsAsyncAction.run(() => super.getSubjects());
  }

  late final _$addSubjectAsyncAction =
      AsyncAction('ManageSubjectControllerStore.addSubject', context: context);

  @override
  Future<void> addSubject() {
    return _$addSubjectAsyncAction.run(() => super.addSubject());
  }

  late final _$ManageSubjectControllerStoreActionController =
      ActionController(name: 'ManageSubjectControllerStore', context: context);

  @override
  void setSelectedCourse(CourseModel course) {
    final _$actionInfo = _$ManageSubjectControllerStoreActionController
        .startAction(name: 'ManageSubjectControllerStore.setSelectedCourse');
    try {
      return super.setSelectedCourse(course);
    } finally {
      _$ManageSubjectControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCourse: ${selectedCourse},
courses: ${courses},
subjects: ${subjects},
selectedCourseValue: ${selectedCourseValue},
subjectType: ${subjectType}
    ''';
  }
}
