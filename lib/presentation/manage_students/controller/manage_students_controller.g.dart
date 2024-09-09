// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_students_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManageStudentsController on ManageStudentsControllerStore, Store {
  Computed<List<CourseModel>>? _$coursesComputed;

  @override
  List<CourseModel> get courses =>
      (_$coursesComputed ??= Computed<List<CourseModel>>(() => super.courses,
              name: 'ManageStudentsControllerStore.courses'))
          .value;
  Computed<CourseModel?>? _$selectedCourseValueComputed;

  @override
  CourseModel? get selectedCourseValue => (_$selectedCourseValueComputed ??=
          Computed<CourseModel?>(() => super.selectedCourseValue,
              name: 'ManageStudentsControllerStore.selectedCourseValue'))
      .value;
  Computed<List<SubjectModel>>? _$subjectsComputed;

  @override
  List<SubjectModel> get subjects =>
      (_$subjectsComputed ??= Computed<List<SubjectModel>>(() => super.subjects,
              name: 'ManageStudentsControllerStore.subjects'))
          .value;
  Computed<SubjectModel?>? _$selectedSubjectValueComputed;

  @override
  SubjectModel? get selectedSubjectValue => (_$selectedSubjectValueComputed ??=
          Computed<SubjectModel?>(() => super.selectedSubjectValue,
              name: 'ManageStudentsControllerStore.selectedSubjectValue'))
      .value;
  Computed<List<StudentModel>>? _$studentsComputed;

  @override
  List<StudentModel> get students =>
      (_$studentsComputed ??= Computed<List<StudentModel>>(() => super.students,
              name: 'ManageStudentsControllerStore.students'))
          .value;
<<<<<<< Updated upstream
=======
  Computed<List<StudentModel>>? _$studentsBoletoComputed;

  @override
  List<StudentModel> get studentsBoleto => (_$studentsBoletoComputed ??=
          Computed<List<StudentModel>>(() => super.studentsBoleto,
              name: 'ManageStudentsControllerStore.studentsBoleto'))
      .value;
  Computed<StudentModel?>? _$selectedStudentValueComputed;

  @override
  StudentModel? get selectedStudentValue => (_$selectedStudentValueComputed ??=
          Computed<StudentModel?>(() => super.selectedStudentValue,
              name: 'ManageStudentsControllerStore.selectedStudentValue'))
      .value;
  Computed<List<SubjectModel>>? _$subjectsBoletoComputed;

  @override
  List<SubjectModel> get subjectsBoleto => (_$subjectsBoletoComputed ??=
          Computed<List<SubjectModel>>(() => super.subjectsBoleto,
              name: 'ManageStudentsControllerStore.subjectsBoleto'))
      .value;
  Computed<bool>? _$generatedBoletoValueComputed;

  @override
  bool get generatedBoletoValue => (_$generatedBoletoValueComputed ??=
          Computed<bool>(() => super.generatedBoletoValue,
              name: 'ManageStudentsControllerStore.generatedBoletoValue'))
      .value;
  Computed<double>? _$totalValueValueComputed;

  @override
  double get totalValueValue => (_$totalValueValueComputed ??= Computed<double>(
          () => super.totalValueValue,
          name: 'ManageStudentsControllerStore.totalValueValue'))
      .value;
>>>>>>> Stashed changes

  late final _$_coursesAtom =
      Atom(name: 'ManageStudentsControllerStore._courses', context: context);

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
      name: 'ManageStudentsControllerStore.selectedCourse', context: context);

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
      Atom(name: 'ManageStudentsControllerStore._subjects', context: context);

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
      name: 'ManageStudentsControllerStore.selectedSubject', context: context);

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

  late final _$_studentsAtom =
      Atom(name: 'ManageStudentsControllerStore._students', context: context);

  @override
  ObservableList<StudentModel> get _students {
    _$_studentsAtom.reportRead();
    return super._students;
  }

  @override
  set _students(ObservableList<StudentModel> value) {
    _$_studentsAtom.reportWrite(value, super._students, () {
      super._students = value;
    });
  }

<<<<<<< Updated upstream
=======
  late final _$selectedStudentAtom = Atom(
      name: 'ManageStudentsControllerStore.selectedStudent', context: context);

  @override
  StudentModel? get selectedStudent {
    _$selectedStudentAtom.reportRead();
    return super.selectedStudent;
  }

  @override
  set selectedStudent(StudentModel? value) {
    _$selectedStudentAtom.reportWrite(value, super.selectedStudent, () {
      super.selectedStudent = value;
    });
  }

  late final _$_studentsBoletoAtom = Atom(
      name: 'ManageStudentsControllerStore._studentsBoleto', context: context);

  @override
  ObservableList<StudentModel> get _studentsBoleto {
    _$_studentsBoletoAtom.reportRead();
    return super._studentsBoleto;
  }

  @override
  set _studentsBoleto(ObservableList<StudentModel> value) {
    _$_studentsBoletoAtom.reportWrite(value, super._studentsBoleto, () {
      super._studentsBoleto = value;
    });
  }

  late final _$_subjectsBoletoAtom = Atom(
      name: 'ManageStudentsControllerStore._subjectsBoleto', context: context);

  @override
  ObservableList<SubjectModel> get _subjectsBoleto {
    _$_subjectsBoletoAtom.reportRead();
    return super._subjectsBoleto;
  }

  @override
  set _subjectsBoleto(ObservableList<SubjectModel> value) {
    _$_subjectsBoletoAtom.reportWrite(value, super._subjectsBoleto, () {
      super._subjectsBoleto = value;
    });
  }

  late final _$generatedBoletoAtom = Atom(
      name: 'ManageStudentsControllerStore.generatedBoleto', context: context);

  @override
  bool get generatedBoleto {
    _$generatedBoletoAtom.reportRead();
    return super.generatedBoleto;
  }

  @override
  set generatedBoleto(bool value) {
    _$generatedBoletoAtom.reportWrite(value, super.generatedBoleto, () {
      super.generatedBoleto = value;
    });
  }

  late final _$totalValueAtom =
      Atom(name: 'ManageStudentsControllerStore.totalValue', context: context);

  @override
  double get totalValue {
    _$totalValueAtom.reportRead();
    return super.totalValue;
  }

  @override
  set totalValue(double value) {
    _$totalValueAtom.reportWrite(value, super.totalValue, () {
      super.totalValue = value;
    });
  }

>>>>>>> Stashed changes
  late final _$getCoursesAsyncAction =
      AsyncAction('ManageStudentsControllerStore.getCourses', context: context);

  @override
  Future<void> getCourses() {
    return _$getCoursesAsyncAction.run(() => super.getCourses());
  }

  late final _$getSubjectsAsyncAction = AsyncAction(
      'ManageStudentsControllerStore.getSubjects',
      context: context);

  @override
  Future<void> getSubjects() {
    return _$getSubjectsAsyncAction.run(() => super.getSubjects());
  }

  late final _$getStudentsAsyncAction = AsyncAction(
      'ManageStudentsControllerStore.getStudents',
      context: context);

  @override
  Future<void> getStudents() {
    return _$getStudentsAsyncAction.run(() => super.getStudents());
  }

<<<<<<< Updated upstream
=======
  late final _$getStudentsByCourseAsyncAction = AsyncAction(
      'ManageStudentsControllerStore.getStudentsByCourse',
      context: context);

  @override
  Future<void> getStudentsByCourse() {
    return _$getStudentsByCourseAsyncAction
        .run(() => super.getStudentsByCourse());
  }

  late final _$getSubjectsByStudentAsyncAction = AsyncAction(
      'ManageStudentsControllerStore.getSubjectsByStudent',
      context: context);

  @override
  Future<void> getSubjectsByStudent() {
    return _$getSubjectsByStudentAsyncAction
        .run(() => super.getSubjectsByStudent());
  }

  late final _$insertBoletoAsyncAction = AsyncAction(
      'ManageStudentsControllerStore.insertBoleto',
      context: context);

  @override
  Future<void> insertBoleto() {
    return _$insertBoletoAsyncAction.run(() => super.insertBoleto());
  }

>>>>>>> Stashed changes
  late final _$ManageStudentsControllerStoreActionController =
      ActionController(name: 'ManageStudentsControllerStore', context: context);

  @override
  void setSelectedCourse(CourseModel course) {
    final _$actionInfo = _$ManageStudentsControllerStoreActionController
        .startAction(name: 'ManageStudentsControllerStore.setSelectedCourse');
    try {
      return super.setSelectedCourse(course);
    } finally {
      _$ManageStudentsControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedSubject(SubjectModel subject) {
    final _$actionInfo = _$ManageStudentsControllerStoreActionController
        .startAction(name: 'ManageStudentsControllerStore.setSelectedSubject');
    try {
      return super.setSelectedSubject(subject);
    } finally {
      _$ManageStudentsControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
<<<<<<< Updated upstream
=======
  void setSelectedStudentBoleto(StudentModel student) {
    final _$actionInfo =
        _$ManageStudentsControllerStoreActionController.startAction(
            name: 'ManageStudentsControllerStore.setSelectedStudentBoleto');
    try {
      return super.setSelectedStudentBoleto(student);
    } finally {
      _$ManageStudentsControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedStudent(StudentModel student) {
    final _$actionInfo = _$ManageStudentsControllerStoreActionController
        .startAction(name: 'ManageStudentsControllerStore.setSelectedStudent');
    try {
      return super.setSelectedStudent(student);
    } finally {
      _$ManageStudentsControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
>>>>>>> Stashed changes
  String toString() {
    return '''
selectedCourse: ${selectedCourse},
selectedSubject: ${selectedSubject},
<<<<<<< Updated upstream
=======
selectedStudent: ${selectedStudent},
generatedBoleto: ${generatedBoleto},
totalValue: ${totalValue},
>>>>>>> Stashed changes
courses: ${courses},
selectedCourseValue: ${selectedCourseValue},
subjects: ${subjects},
selectedSubjectValue: ${selectedSubjectValue},
<<<<<<< Updated upstream
students: ${students}
=======
students: ${students},
studentsBoleto: ${studentsBoleto},
selectedStudentValue: ${selectedStudentValue},
subjectsBoleto: ${subjectsBoleto},
generatedBoletoValue: ${generatedBoletoValue},
totalValueValue: ${totalValueValue}
>>>>>>> Stashed changes
    ''';
  }
}
