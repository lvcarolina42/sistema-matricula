// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on RegisterControllerStore, Store {
  Computed<bool>? _$showPasswordRegisterComputed;

  @override
  bool get showPasswordRegister => (_$showPasswordRegisterComputed ??=
          Computed<bool>(() => super.showPasswordRegister,
              name: 'RegisterControllerStore.showPasswordRegister'))
      .value;
  Computed<bool>? _$showConfirmPasswordRegisterComputed;

  @override
  bool get showConfirmPasswordRegister =>
      (_$showConfirmPasswordRegisterComputed ??= Computed<bool>(
              () => super.showConfirmPasswordRegister,
              name: 'RegisterControllerStore.showConfirmPasswordRegister'))
          .value;
  Computed<List<CourseModel>>? _$coursesComputed;

  @override
  List<CourseModel> get courses =>
      (_$coursesComputed ??= Computed<List<CourseModel>>(() => super.courses,
              name: 'RegisterControllerStore.courses'))
          .value;

  late final _$_showPasswordRegisterAtom = Atom(
      name: 'RegisterControllerStore._showPasswordRegister', context: context);

  @override
  bool get _showPasswordRegister {
    _$_showPasswordRegisterAtom.reportRead();
    return super._showPasswordRegister;
  }

  @override
  set _showPasswordRegister(bool value) {
    _$_showPasswordRegisterAtom.reportWrite(value, super._showPasswordRegister,
        () {
      super._showPasswordRegister = value;
    });
  }

  late final _$_showConfirmPasswordRegisterAtom = Atom(
      name: 'RegisterControllerStore._showConfirmPasswordRegister',
      context: context);

  @override
  bool get _showConfirmPasswordRegister {
    _$_showConfirmPasswordRegisterAtom.reportRead();
    return super._showConfirmPasswordRegister;
  }

  @override
  set _showConfirmPasswordRegister(bool value) {
    _$_showConfirmPasswordRegisterAtom
        .reportWrite(value, super._showConfirmPasswordRegister, () {
      super._showConfirmPasswordRegister = value;
    });
  }

  late final _$_coursesAtom =
      Atom(name: 'RegisterControllerStore._courses', context: context);

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

  late final _$getCoursesAsyncAction =
      AsyncAction('RegisterControllerStore.getCourses', context: context);

  @override
  Future<void> getCourses() {
    return _$getCoursesAsyncAction.run(() => super.getCourses());
  }

  late final _$registerBaseInfoAsyncAction =
      AsyncAction('RegisterControllerStore.registerBaseInfo', context: context);

  @override
  Future<void> registerBaseInfo() {
    return _$registerBaseInfoAsyncAction.run(() => super.registerBaseInfo());
  }

  late final _$RegisterControllerStoreActionController =
      ActionController(name: 'RegisterControllerStore', context: context);

  @override
  void toggleShowPasswordRegister() {
    final _$actionInfo = _$RegisterControllerStoreActionController.startAction(
        name: 'RegisterControllerStore.toggleShowPasswordRegister');
    try {
      return super.toggleShowPasswordRegister();
    } finally {
      _$RegisterControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowConfirmPasswordRegister() {
    final _$actionInfo = _$RegisterControllerStoreActionController.startAction(
        name: 'RegisterControllerStore.toggleShowConfirmPasswordRegister');
    try {
      return super.toggleShowConfirmPasswordRegister();
    } finally {
      _$RegisterControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPasswordRegister: ${showPasswordRegister},
showConfirmPasswordRegister: ${showConfirmPasswordRegister},
courses: ${courses}
    ''';
  }
}
