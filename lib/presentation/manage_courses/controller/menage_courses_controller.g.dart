// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menage_courses_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManageCoursesController on ManageCoursesControllerStore, Store {
  Computed<List<CourseModel>>? _$coursesComputed;

  @override
  List<CourseModel> get courses =>
      (_$coursesComputed ??= Computed<List<CourseModel>>(() => super.courses,
              name: 'ManageCoursesControllerStore.courses'))
          .value;

  late final _$_coursesAtom =
      Atom(name: 'ManageCoursesControllerStore._courses', context: context);

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

  late final _$registerCourseAsyncAction = AsyncAction(
      'ManageCoursesControllerStore.registerCourse',
      context: context);

  @override
  Future<void> registerCourse() {
    return _$registerCourseAsyncAction.run(() => super.registerCourse());
  }

  late final _$getCoursesAsyncAction =
      AsyncAction('ManageCoursesControllerStore.getCourses', context: context);

  @override
  Future<void> getCourses() {
    return _$getCoursesAsyncAction.run(() => super.getCourses());
  }

  @override
  String toString() {
    return '''
courses: ${courses}
    ''';
  }
}
