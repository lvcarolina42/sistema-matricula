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
  Computed<SubjectModel?>? _$selectedSubjectValueComputed;

  @override
  SubjectModel? get selectedSubjectValue => (_$selectedSubjectValueComputed ??=
          Computed<SubjectModel?>(() => super.selectedSubjectValue,
              name: 'RegistrationControllerStore.selectedSubjectValue'))
      .value;

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

  late final _$RegistrationControllerStoreActionController =
      ActionController(name: 'RegistrationControllerStore', context: context);

  @override
  void setSelectedSubject(SubjectModel subject) {
    final _$actionInfo = _$RegistrationControllerStoreActionController
        .startAction(name: 'RegistrationControllerStore.setSelectedSubject');
    try {
      return super.setSelectedSubject(subject);
    } finally {
      _$RegistrationControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedSubject: ${selectedSubject},
subjects: ${subjects},
selectedSubjectValue: ${selectedSubjectValue}
    ''';
  }
}
