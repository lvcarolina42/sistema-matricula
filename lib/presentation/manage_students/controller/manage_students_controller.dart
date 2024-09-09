import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_courses_use_case.dart';
<<<<<<< Updated upstream
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_students_by_subject_id.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
=======
import 'package:sistema_matricula/domain/login/models/boleto_model.dart';
import 'package:sistema_matricula/domain/login/models/student_model.dart';
import 'package:sistema_matricula/domain/registration/use_cases/get_students_by_course_id.dart';
import 'package:sistema_matricula/domain/registration/use_cases/get_students_by_subject_id.dart';
import 'package:sistema_matricula/domain/registration/use_cases/get_subsjects_by_student_id_use_case.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_boleto_use_case.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_student_by_id.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_students_use_case.dart';
import 'package:sistema_matricula/domain/students/use_cases/insert_boleto_use_case.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/subjects/use_cases/get_subject_by_id_use_case.dart';
>>>>>>> Stashed changes
import 'package:sistema_matricula/domain/subjects/use_cases/get_subjects_use_case.dart';

part 'manage_students_controller.g.dart';

class ManageStudentsController = ManageStudentsControllerStore with _$ManageStudentsController;

abstract class ManageStudentsControllerStore extends DisposableInterface with Store {
  final GetCoursesUseCase _getCoursesUseCase;
<<<<<<< Updated upstream
  final GetSubjectsUseCase _getSubjectsUseCase;
  final GetStudentsBySubjectId _getStudentsBySubjectId;

  ManageStudentsControllerStore(
    this._getCoursesUseCase,
    this._getSubjectsUseCase,
    this._getStudentsBySubjectId,
=======
  final GetStudentByIdUseCase _getStudentById;
  final GetSubjectsUseCase _getSubjectsUseCase;
  final GetStudentsUseCase _getStudentsUseCase;
  final InsertBoletoUseCase _insertBoletoUseCase;
  final GetStudentsByCourseId _getStudentsByCourseId;
  final GetSubjectByIdUseCase _getSubjectByIdUseCase;
  final GetStudentsBySubjectId _getStudentsBySubjectId;
  final GetSubsjectsByStudentIdUseCase _getSubsjectsByStudentIdUseCase;

  ManageStudentsControllerStore(
    this._getStudentById,
    this._getCoursesUseCase,
    this._getStudentsUseCase,
    this._getSubjectsUseCase,
    this._insertBoletoUseCase,
    this._getStudentsByCourseId,
    this._getSubjectByIdUseCase,
    this._getStudentsBySubjectId,
    this._getSubsjectsByStudentIdUseCase,
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
=======
  @observable
  StudentModel? selectedStudent;

  @observable
  ObservableList<StudentModel> _studentsBoleto = ObservableList<StudentModel>.of([]);

  @computed
  List<StudentModel> get studentsBoleto => _studentsBoleto;

  @observable
  ObservableList<StudentModel> _studentsTeacher = ObservableList<StudentModel>.of([]);

  @computed
  List<StudentModel> get studentsTeacher => _studentsTeacher;

  @computed
  StudentModel? get selectedStudentValue => selectedStudent;

  @observable
  ObservableList<SubjectModel> _subjectsBoleto = ObservableList<SubjectModel>.of([]);

  @computed
  List<SubjectModel> get subjectsBoleto => _subjectsBoleto;

>>>>>>> Stashed changes
  final TextEditingController teacherCpf = TextEditingController();
  final TextEditingController teacherName = TextEditingController();
  final TextEditingController teacherPassword = TextEditingController();
  final TextEditingController teacherPasswordConfirm = TextEditingController();

<<<<<<< Updated upstream
  @action
  void setSelectedCourse(CourseModel course) {
    selectedCourse = course;
    getSubjects();
=======
  @observable
  bool generatedBoleto = false;

  @computed
  bool get generatedBoletoValue => generatedBoleto;

  @observable
  double totalValue = 0.0;

  @computed
  double get totalValueValue => totalValue;

  @action
  void setSelectedCourse(CourseModel course) {
    selectedSubject = null;
    selectedCourse = course;
    getSubjects();
    getStudentsByCourse();
>>>>>>> Stashed changes
  }

  @action
  void setSelectedSubject(SubjectModel subject) {
    selectedSubject = subject;
    getStudents();
  }

<<<<<<< Updated upstream
=======
  @action
  void setSelectedStudentBoleto(StudentModel student) {
    selectedStudent = student;

  }

  @action
  void setSelectedStudent(StudentModel student) {
    selectedStudent = student;
    getSubjectsByStudent();
  }

>>>>>>> Stashed changes
  set _setDataSubjects(List<SubjectModel> data) {
    _subjects.replaceRange(0, _subjects.length, data);
  }

<<<<<<< Updated upstream
  set _setDataTeachers(List<StudentModel> data) {
=======
  set _setDataStudents(List<StudentModel> data) {
>>>>>>> Stashed changes
    _students.replaceRange(0, _students.length, data);
    _students.sort((a, b) => a.name.compareTo(b.name));
  }

<<<<<<< Updated upstream
=======
  set _setDataStudentsBoleto(List<StudentModel> data) {
    _studentsBoleto.replaceRange(0, _studentsBoleto.length, data);
    _studentsBoleto.sort((a, b) => a.name.compareTo(b.name));
  }

  set _setDataSubjectsBoleto(List<SubjectModel> data) {
    _subjectsBoleto.replaceRange(0, _subjectsBoleto.length, data);
  }

  set _setDataStudentsTeacher(List<StudentModel> data) {
    _studentsTeacher.replaceRange(0, _studentsTeacher.length, data);
    _studentsTeacher.sort((a, b) => a.name.compareTo(b.name));
  }

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
      final response = await _getSubjectsUseCase(selectedCourse!.id).asObservable();
=======
      final response = await _getSubjectsUseCase(selectedCourse!.id, null).asObservable();
>>>>>>> Stashed changes
      _setDataSubjects = response;
    }
  }

  @action
  Future<void> getStudents() async {
<<<<<<< Updated upstream
    if (selectedSubject != null) {
      final response = await _getStudentsBySubjectId(selectedSubject!.id);
      _setDataTeachers = response;
    }
  }
=======
    final List<StudentModel> studentsResponse = [];
    if (selectedSubject != null) {
      final response = await _getStudentsBySubjectId(selectedSubject!.id);
      
      for (var res in response) {
        final student = await _getStudentById(res);
        studentsResponse.add(student);
      }
      _setDataStudents = studentsResponse;
    }
  }

  @action
  Future<void> getStudentsByCourse() async {
    final List<StudentModel> studentsResponse = [];
    bool studentRegistered = false;

    if (selectedCourse != null) {
      final response = await _getStudentsByCourseId(selectedCourse!.id);
      
      for (var res in response) {
        for (var student in studentsResponse) {
          if(student.id == res) {
            studentRegistered = true;
          }
        }
        if(!studentRegistered) {
          final student = await _getStudentById(res);
          studentsResponse.add(student);
        }
        studentRegistered = false;
      }
      _setDataStudentsBoleto = studentsResponse;
    }
  }

  @action
  Future<void> getSubjectsByStudent() async {
    final List<SubjectModel> subjectsResponse = [];

    if (selectedStudent != null) {
      final response = await _getSubsjectsByStudentIdUseCase(selectedStudent!.id);
      
      for (var res in response) {
        final subject = await _getSubjectByIdUseCase(res, null);
        subjectsResponse.add(subject);
      }

      _setDataSubjectsBoleto = subjectsResponse;
    }

    for (var subject in _subjectsBoleto) {
      totalValue += subject.price;
    }
  }

  @action
  Future<void> insertBoleto() async {
    if (selectedStudent != null) {
      await _insertBoletoUseCase(
        BoletoModel(studentId: selectedStudent!.id, value: totalValue),
      );
    }

    generatedBoleto = true;
  }

  @action
  Future<void> getStudentTeacher(int id) async {
    final response = await (_getStudentsUseCase(id));
    _setDataStudentsTeacher = response;
  }
>>>>>>> Stashed changes
}