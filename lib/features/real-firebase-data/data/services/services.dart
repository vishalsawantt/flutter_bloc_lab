import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/data/model/model.dart';

class StudentServices{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // add student
  // Future<void> addStudent(StudentModel student) async {
  //   await _firestore.collection('studentsDetails').add({
  //     'name' : student.name,
  //     'city' : student.city,
  //   });
  // }

  // add student
  Future<void> addStudent(StudentModel student) async {
    await _firestore.collection('studentsDetails').add(student.toJson());
  }

  // load students
  Future<List<StudentModel>> getStudents() async {
    final snapshot =  await _firestore.collection('studentsDetails').get();

    final studentsList = snapshot.docs.map((document) {
      return StudentModel.fromJson(
        document.data(),
        document.id,
      );
    }).toList();
    return studentsList;
  }

  // update student
  Future<void> updateStudent(StudentModel student) async {
    await _firestore.collection('studentsDetails').doc(student.id).update(student.toJson());
  }

  // delete student
  Future<void> deleteStudent(String id) async {
    await _firestore.collection('studentsDetails').doc(id).delete();
  }
}