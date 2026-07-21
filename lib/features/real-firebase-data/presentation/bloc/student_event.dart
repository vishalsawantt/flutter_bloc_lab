import 'package:flutter_bloc_lab/features/real-firebase-data/data/model/model.dart';

abstract class StudentEvent {}

class LoadStudents extends StudentEvent {}

class AddStudent extends StudentEvent {
  final StudentModel student;
  AddStudent(this.student);
}

class UpdateStudent extends StudentEvent {
  final StudentModel student;

  UpdateStudent(this.student);
}

class DeleteStudent extends StudentEvent {
  final String id;

  DeleteStudent(this.id);
}