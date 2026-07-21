class StudentModel {
  final String? id;
  final String name;
  final String city;

  const StudentModel({this.id, required this.name, required this.city});

  factory StudentModel.fromJson(Map<String, dynamic> json, String documentId) {
    return StudentModel(
      id: documentId,
      name: json['name'] as String,
      city: json['city'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'city' : city
    };
  }
}
