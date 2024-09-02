
enum UserType { 
  student("Aluno"),
  teacher("Professor"),
  secretary("Secretário");

  const UserType(this.name);

  final String name;
}

class UserModel {
  final String cpf;
  final String name;
  final int courseId;
  final UserType type;
  final String password;

  UserModel({
    required this.cpf,
    required this.type,
    required this.name,
    this.courseId = -1,
    required this.password,
  });

  factory UserModel.fromMap(Map<String, Object?> map, UserType type) {
    return UserModel(
      type: type,
      cpf: map['cpf'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      courseId: map['courseId'] as int,
    );
  }
}