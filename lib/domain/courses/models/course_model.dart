class CourseModel {
  final int id;
  final int code;
  final String name;
  final int credits;
  final int periods;

  CourseModel({
    this.id = -1,
    required this.code,
    required this.name,
    required this.credits,
    required this.periods,
  });

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      code: map['code'],
      name: map['name'],
      credits: map['credits'],
      periods: map['periods'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'credits': credits,
      'periods': periods,
    };
  }
}