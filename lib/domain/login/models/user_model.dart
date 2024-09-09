
enum UserType { 
  student("Aluno"),
  teacher("Professor"),
  secretary("Secretário");

  const UserType(this.name);

  final String name;
}

class UserModel {
  final int id;
  final String cpf;
  final int period;
  final String name;
  final int courseId;
  final UserType type;
  final String password;

  UserModel({
    this.id = -1,
    this.period = -1,
    required this.cpf,
    required this.type,
    required this.name,
    this.courseId = -1,
    required this.password,
  });

  factory UserModel.fromMap(Map<String, Object?> map, UserType type) {
    return UserModel(
      type: type,
      id: map['id'] as int,
      cpf: map['cpf'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      period: int.tryParse(map['period'].toString()) ?? -1,
      courseId: int.tryParse(map['courseId'].toString()) ?? -1,
    );
  }
}