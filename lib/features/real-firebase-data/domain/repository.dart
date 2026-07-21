import 'package:flutter_bloc_lab/features/real-firebase-data/data/model/model.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/data/services/services.dart';

class StudentRepository {
  final StudentServices _services;

  StudentRepository(this._services);

  // add student
  Future<void> addStudent(StudentModel student) async {
    await _services.addStudent(student);
  }

  // load students
  Future<List<StudentModel>> getStudents() async {
    return await _services.getStudents();
  }

  // update student
  Future<void> updateStudent(StudentModel student) async {
    await _services.updateStudent(student);
  }

  // delete student
  Future<void> deleteStudent(String id) async {
    await _services.deleteStudent(id);
  }
}