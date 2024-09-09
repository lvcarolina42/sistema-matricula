// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationController on RegistrationControllerStore, Store {
  Computed<List<SubjectModel>>? _$subjectsComputed;

  @override
  List<SubjectModel> get subjects =>
      (_$subjectsComputed ??= Computed<List<SubjectModel>>(() => super.subjects,
              name: 'RegistrationControllerStore.subjects'))
          .value;
<<<<<<< Updated upstream
  Computed<SubjectModel?>? _$selectedSubjectValueComputed;

  @override
  SubjectModel? get selectedSubjectValue => (_$selectedSubjectValueComputed ??=
          Computed<SubjectModel?>(() => super.selectedSubjectValue,
              name: 'RegistrationControllerStore.selectedSubjectValue'))
      .value;
=======
  Computed<List<SubjectModel>>? _$selectedRequiredSubjectsComputed;

  @override
  List<SubjectModel> get selectedRequiredSubjects =>
      (_$selectedRequiredSubjectsComputed ??= Computed<List<SubjectModel>>(
              () => super.selectedRequiredSubjects,
              name: 'RegistrationControllerStore.selectedRequiredSubjects'))
          .value;
  Computed<List<SubjectModel>>? _$selectedOptionalSubjectsComputed;

  @override
  List<SubjectModel> get selectedOptionalSubjects =>
      (_$selectedOptionalSubjectsComputed ??= Computed<List<SubjectModel>>(
              () => super.selectedOptionalSubjects,
              name: 'RegistrationControllerStore.selectedOptionalSubjects'))
          .value;
  Computed<bool>? _$isMaxRequiredSubjectsComputed;

  @override
  bool get isMaxRequiredSubjects => (_$isMaxRequiredSubjectsComputed ??=
          Computed<bool>(() => super.isMaxRequiredSubjects,
              name: 'RegistrationControllerStore.isMaxRequiredSubjects'))
      .value;
  Computed<bool>? _$isMaxOptionalSubjectsComputed;

  @override
  bool get isMaxOptionalSubjects => (_$isMaxOptionalSubjectsComputed ??=
          Computed<bool>(() => super.isMaxOptionalSubjects,
              name: 'RegistrationControllerStore.isMaxOptionalSubjects'))
      .value;
  Computed<bool>? _$isRegistredComputed;

  @override
  bool get isRegistred =>
      (_$isRegistredComputed ??= Computed<bool>(() => super.isRegistred,
              name: 'RegistrationControllerStore.isRegistred'))
          .value;
  Computed<List<RegistrationModel>>? _$registrationsComputed;

  @override
  List<RegistrationModel> get registrations => (_$registrationsComputed ??=
          Computed<List<RegistrationModel>>(() => super.registrations,
              name: 'RegistrationControllerStore.registrations'))
      .value;
  Computed<List<SubjectModel>>? _$registratedSubjectsComputed;

  @override
  List<SubjectModel> get registratedSubjects =>
      (_$registratedSubjectsComputed ??= Computed<List<SubjectModel>>(
              () => super.registratedSubjects,
              name: 'RegistrationControllerStore.registratedSubjects'))
          .value;
>>>>>>> Stashed changes

  late final _$_subjectsAtom =
      Atom(name: 'RegistrationControllerStore._subjects', context: context);

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

<<<<<<< Updated upstream
  late final _$selectedSubjectAtom = Atom(
      name: 'RegistrationControllerStore.selectedSubject', context: context);

  @override
  SubjectModel? get selectedSubject {
    _$selectedSubjectAtom.reportRead();
    return super.selectedSubject;
  }

  @override
  set selectedSubject(SubjectModel? value) {
    _$selectedSubjectAtom.reportWrite(value, super.selectedSubject, () {
      super.selectedSubject = value;
=======
  late final _$_selectedRequiredSubjectsAtom = Atom(
      name: 'RegistrationControllerStore._selectedRequiredSubjects',
      context: context);

  @override
  ObservableList<SubjectModel> get _selectedRequiredSubjects {
    _$_selectedRequiredSubjectsAtom.reportRead();
    return super._selectedRequiredSubjects;
  }

  @override
  set _selectedRequiredSubjects(ObservableList<SubjectModel> value) {
    _$_selectedRequiredSubjectsAtom
        .reportWrite(value, super._selectedRequiredSubjects, () {
      super._selectedRequiredSubjects = value;
    });
  }

  late final _$_selectedOptionalSubjectsAtom = Atom(
      name: 'RegistrationControllerStore._selectedOptionalSubjects',
      context: context);

  @override
  ObservableList<SubjectModel> get _selectedOptionalSubjects {
    _$_selectedOptionalSubjectsAtom.reportRead();
    return super._selectedOptionalSubjects;
  }

  @override
  set _selectedOptionalSubjects(ObservableList<SubjectModel> value) {
    _$_selectedOptionalSubjectsAtom
        .reportWrite(value, super._selectedOptionalSubjects, () {
      super._selectedOptionalSubjects = value;
    });
  }

  late final _$_isMaxRequiredSubjectsAtom = Atom(
      name: 'RegistrationControllerStore._isMaxRequiredSubjects',
      context: context);

  @override
  bool get _isMaxRequiredSubjects {
    _$_isMaxRequiredSubjectsAtom.reportRead();
    return super._isMaxRequiredSubjects;
  }

  @override
  set _isMaxRequiredSubjects(bool value) {
    _$_isMaxRequiredSubjectsAtom
        .reportWrite(value, super._isMaxRequiredSubjects, () {
      super._isMaxRequiredSubjects = value;
    });
  }

  late final _$_isMaxOptionalSubjectsAtom = Atom(
      name: 'RegistrationControllerStore._isMaxOptionalSubjects',
      context: context);

  @override
  bool get _isMaxOptionalSubjects {
    _$_isMaxOptionalSubjectsAtom.reportRead();
    return super._isMaxOptionalSubjects;
  }

  @override
  set _isMaxOptionalSubjects(bool value) {
    _$_isMaxOptionalSubjectsAtom
        .reportWrite(value, super._isMaxOptionalSubjects, () {
      super._isMaxOptionalSubjects = value;
    });
  }

  late final _$_isRegistredAtom =
      Atom(name: 'RegistrationControllerStore._isRegistred', context: context);

  @override
  bool get _isRegistred {
    _$_isRegistredAtom.reportRead();
    return super._isRegistred;
  }

  @override
  set _isRegistred(bool value) {
    _$_isRegistredAtom.reportWrite(value, super._isRegistred, () {
      super._isRegistred = value;
    });
  }

  late final _$_registrationsAtom = Atom(
      name: 'RegistrationControllerStore._registrations', context: context);

  @override
  ObservableList<RegistrationModel> get _registrations {
    _$_registrationsAtom.reportRead();
    return super._registrations;
  }

  @override
  set _registrations(ObservableList<RegistrationModel> value) {
    _$_registrationsAtom.reportWrite(value, super._registrations, () {
      super._registrations = value;
    });
  }

  late final _$_registratedSubjectsAtom = Atom(
      name: 'RegistrationControllerStore._registratedSubjects',
      context: context);

  @override
  ObservableList<SubjectModel> get _registratedSubjects {
    _$_registratedSubjectsAtom.reportRead();
    return super._registratedSubjects;
  }

  @override
  set _registratedSubjects(ObservableList<SubjectModel> value) {
    _$_registratedSubjectsAtom.reportWrite(value, super._registratedSubjects,
        () {
      super._registratedSubjects = value;
>>>>>>> Stashed changes
    });
  }

  late final _$getCourseAsyncAction =
      AsyncAction('RegistrationControllerStore.getCourse', context: context);

  @override
  Future<void> getCourse() {
    return _$getCourseAsyncAction.run(() => super.getCourse());
  }

  late final _$getSubjectsAsyncAction =
      AsyncAction('RegistrationControllerStore.getSubjects', context: context);

  @override
  Future<void> getSubjects() {
    return _$getSubjectsAsyncAction.run(() => super.getSubjects());
  }

<<<<<<< Updated upstream
=======
  late final _$registerAsyncAction =
      AsyncAction('RegistrationControllerStore.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$deleteRegisterAsyncAction = AsyncAction(
      'RegistrationControllerStore.deleteRegister',
      context: context);

  @override
  Future<void> deleteRegister(SubjectModel subject) {
    return _$deleteRegisterAsyncAction.run(() => super.deleteRegister(subject));
  }

>>>>>>> Stashed changes
  late final _$RegistrationControllerStoreActionController =
      ActionController(name: 'RegistrationControllerStore', context: context);

  @override
<<<<<<< Updated upstream
  void setSelectedSubject(SubjectModel subject) {
    final _$actionInfo = _$RegistrationControllerStoreActionController
        .startAction(name: 'RegistrationControllerStore.setSelectedSubject');
    try {
      return super.setSelectedSubject(subject);
=======
  void toggleSubjectSelected(SubjectModel subject) {
    final _$actionInfo = _$RegistrationControllerStoreActionController
        .startAction(name: 'RegistrationControllerStore.toggleSubjectSelected');
    try {
      return super.toggleSubjectSelected(subject);
    } finally {
      _$RegistrationControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSubjectSelected(SubjectModel subject) {
    final _$actionInfo = _$RegistrationControllerStoreActionController
        .startAction(name: 'RegistrationControllerStore.removeSubjectSelected');
    try {
      return super.removeSubjectSelected(subject);
    } finally {
      _$RegistrationControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isSubjectSelected(SubjectModel subject) {
    final _$actionInfo = _$RegistrationControllerStoreActionController
        .startAction(name: 'RegistrationControllerStore.isSubjectSelected');
    try {
      return super.isSubjectSelected(subject);
    } finally {
      _$RegistrationControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isRegistredSubject(SubjectModel subject) {
    final _$actionInfo = _$RegistrationControllerStoreActionController
        .startAction(name: 'RegistrationControllerStore.isRegistredSubject');
    try {
      return super.isRegistredSubject(subject);
>>>>>>> Stashed changes
    } finally {
      _$RegistrationControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
<<<<<<< Updated upstream
selectedSubject: ${selectedSubject},
subjects: ${subjects},
selectedSubjectValue: ${selectedSubjectValue}
=======
subjects: ${subjects},
selectedRequiredSubjects: ${selectedRequiredSubjects},
selectedOptionalSubjects: ${selectedOptionalSubjects},
isMaxRequiredSubjects: ${isMaxRequiredSubjects},
isMaxOptionalSubjects: ${isMaxOptionalSubjects},
isRegistred: ${isRegistred},
registrations: ${registrations},
registratedSubjects: ${registratedSubjects}
>>>>>>> Stashed changes
    ''';
  }
}
