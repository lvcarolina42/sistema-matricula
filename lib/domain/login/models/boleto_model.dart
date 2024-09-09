class BoletoModel {
  final int id;
  final int studentId;
  final double value;

  BoletoModel({this.id = -1, required this.studentId, required this.value});

  Map<String, Object?> toMap() {
    return {
      "studentId": studentId,
      "price": value
    };
  }

  static BoletoModel fromMap(Map<String, Object?> map) {
    return BoletoModel(
      id: map["id"] as int,
      studentId: map["studentId"] as int,
      value: map["price"] as double,
    );
  }
}