import 'package:sistema_matricula/domain/login/models/address_model.dart';

abstract class UserModel {
  final String cpf;
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final AddressModel address;

  UserModel({
    required this.cpf,
    required this.name,
    required this.email,
    required this.address,
    required this.password,
    required this.phoneNumber,
  });
}