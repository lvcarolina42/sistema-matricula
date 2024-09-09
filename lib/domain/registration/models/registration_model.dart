class RegistrationModel {
  final int id;
  final int courseId;
  final int studentId;
  final int subjectId;

  RegistrationModel({required this.id, required this.studentId, required this.subjectId, required this.courseId});

  Map<String, Object?> toMap() {
    return {
      "courseId": courseId,
      "studentId": studentId,
      "subjectId": subjectId
    };
  }

  static RegistrationModel fromMap(Map<String, Object?> map) {
    return RegistrationModel(
      id: map["id"] as int,
      courseId: map["courseId"] as int,
      studentId: map["studentId"] as int,
      subjectId: map["subjectId"] as int,
    );
  }
}