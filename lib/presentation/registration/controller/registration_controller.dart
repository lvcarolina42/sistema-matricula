import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/courses/models/course_model.dart';
import 'package:sistema_matricula/domain/courses/use_cases/get_course_use_case.dart';
import 'package:sistema_matricula/domain/login/models/boleto_model.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/domain/registration/models/registration_model.dart';
import 'package:sistema_matricula/domain/registration/use_cases/delete_registration_use_case.dart';
import 'package:sistema_matricula/domain/registration/use_cases/get_registrations_use_case.dart';
import 'package:sistema_matricula/domain/registration/use_cases/register_use_case.dart';
import 'package:sistema_matricula/domain/students/use_cases/get_boleto_use_case.dart';
import 'package:sistema_matricula/domain/subjects/models/subjects_model.dart';
import 'package:sistema_matricula/domain/subjects/use_cases/get_subject_by_id_use_case.dart';
import 'package:sistema_matricula/domain/subjects/use_cases/get_subjects_use_case.dart';
import 'package:sistema_matricula/presentation/home/controller/home_controller.dart';

part 'registration_controller.g.dart';

class RegistrationController = RegistrationControllerStore with _$RegistrationController;

abstract class RegistrationControllerStore extends DisposableInterface with Store {
  final GetBoletoUseCase _boletoUseCase;
  final RegisterUseCase _registerUseCase;
  final GetCourseUseCase _getCourseUseCase;
  final GetSubjectsUseCase _getSubjectsUseCase;
  final GetSubjectByIdUseCase _getSubjectByIdUseCase;
  final GetRegistrationsUseCase _getRegistrationsUseCase;
  final DeleteRegistrationUseCase _deleteRegistrationUseCase;

  RegistrationControllerStore(
    this._boletoUseCase,
    this._registerUseCase,
    this._getCourseUseCase,
    this._getSubjectsUseCase,
    this._getSubjectByIdUseCase,
    this._getRegistrationsUseCase,
    this._deleteRegistrationUseCase,
  );

  CourseModel? _course;

  @observable
  ObservableList<SubjectModel> _subjects = ObservableList<SubjectModel>.of([]);

  @computed
  List<SubjectModel> get subjects => _subjects;

  UserModel? userModel;

  @observable
  ObservableList<SubjectModel> _selectedRequiredSubjects = ObservableList<SubjectModel>.of([]);

  @observable
  ObservableList<SubjectModel> _selectedOptionalSubjects = ObservableList<SubjectModel>.of([]);

  @observable
  bool _isMaxRequiredSubjects = false;

  @observable
  bool _isMaxOptionalSubjects = false;

  @computed
  List<SubjectModel> get selectedRequiredSubjects => _selectedRequiredSubjects;

  @computed
  List<SubjectModel> get selectedOptionalSubjects => _selectedOptionalSubjects;

  @computed
  bool get isMaxRequiredSubjects => _isMaxRequiredSubjects;

  @computed
  bool get isMaxOptionalSubjects => _isMaxOptionalSubjects;

  @observable
  bool _isRegistred = false;

  @computed
  bool get isRegistred => _isRegistred;

  @observable
  ObservableList<RegistrationModel> _registrations = ObservableList<RegistrationModel>.of([]);

  @computed
  List<RegistrationModel> get registrations => _registrations;

  @observable
  ObservableList<SubjectModel> _registratedSubjects = ObservableList<SubjectModel>.of([]);

  @computed
  List<SubjectModel> get registratedSubjects => _registratedSubjects;

  @observable
  BoletoModel? _boleto;

  @computed
  BoletoModel? get boleto => _boleto;

  set _setDataSubjects(List<SubjectModel> data) {
    _subjects.replaceRange(0, _subjects.length, data);
  }

  set _setDataRegistredSubjects(List<SubjectModel> data) {
    _registratedSubjects.replaceRange(0, _registratedSubjects.length, data);
  }

  set _setDataRegistrations(List<RegistrationModel> data) {
    _registrations.replaceRange(0, _registrations.length, data);
  }

  @action
  void toggleSubjectSelected(SubjectModel subject) {
    if(!subject.isOptional){
      if (_selectedOptionalSubjects.length >= 4) {
        _isMaxOptionalSubjects = true;
        return;
      }
      _selectedOptionalSubjects.add(subject);
    } else {
      if (_selectedRequiredSubjects.length >= 2) {
        _isMaxRequiredSubjects = true;
        return;
      }
      _selectedRequiredSubjects.add(subject);
    }
  }

  @action
  void removeSubjectSelected(SubjectModel subject) {
    if (isSubjectSelected(subject)) {
      _selectedOptionalSubjects.remove(subject);
      _selectedRequiredSubjects.remove(subject);
      if (_selectedOptionalSubjects.length < 4) {
        _isMaxOptionalSubjects = false;
      }
      if (_selectedRequiredSubjects.length < 2) {
        _isMaxRequiredSubjects = false;
      }
    }
  }

  @action
  bool isSubjectSelected(SubjectModel subject) {
    return _selectedOptionalSubjects.contains(subject) || _selectedRequiredSubjects.contains(subject);
  }

  @action
  bool isRegistredSubject(SubjectModel subject) {
    return false;
  }

  @override
  void onInit() async {
    final HomeController homeController = Get.find<HomeController>();
    userModel = homeController.user;
    await isRegistredCall();
    await getCourse();
    await getSubjects();
    await getRegistredSubjects();

    final response = await _boletoUseCase(userModel!.id);
    _boleto = response;
    super.onInit();
  }

  @action
  Future<void> getCourse() async {
    final response = await _getCourseUseCase(userModel!.courseId);
    _course = response;
  }

  @action
  Future<void> getSubjects() async {
    final response = await _getSubjectsUseCase(_course!.id, userModel!.period).asObservable();
      _setDataSubjects = response;
  }

  @action
  Future<void> register() async {
    final List<RegistrationModel> registrations = [];

    for (var subject in _selectedRequiredSubjects) {
      registrations.add(subject.toRegistrationModel(userModel!.id));
    }

    for (var subject in _selectedOptionalSubjects) {
      registrations.add(subject.toRegistrationModel(userModel!.id));
    }

    await _registerUseCase(registrations);

    await isRegistredCall();
    await getCourse();
    await getSubjects();
    await getRegistredSubjects();
  }

  Future<void> isRegistredCall() async {
    final List<RegistrationModel> registrations = await _getRegistrationsUseCase(userModel!.id);

    _setDataRegistrations = registrations;

    _isRegistred = registrations.isNotEmpty;
  }

  Future<void> getRegistredSubjects() async {
    final List<SubjectModel> subs = [];

    for (var registration in _registrations) {
      subs.add(await _getSubjectByIdUseCase(registration.subjectId, userModel!.period));
    }

    _setDataRegistredSubjects = subs;
  }

  @action
  Future<void> deleteRegister(SubjectModel subject) async {
    int registrationId = -1;

    for (var registration in _registrations) {
      if (registration.subjectId == subject.id) {
        registrationId = registration.id;
        break;
      }
    }

    await _deleteRegistrationUseCase(registrationId);

    await isRegistredCall();
    await getCourse();
    await getSubjects();
    await getRegistredSubjects();

    Get.snackbar("Sucesso", "Disciplina deletada com sucesso");
  }

}