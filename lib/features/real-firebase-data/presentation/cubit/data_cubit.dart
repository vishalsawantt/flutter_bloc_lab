import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/data/model/model.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/domain/repository.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/presentation/cubit/data_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentRepository _repository;
  StudentCubit(this._repository):super(StudentInitial());

  Future<void> addStudent(StudentModel student) async{
    try {
      emit(StudentLoading());
      await _repository.addStudent(student);
      final students = await _repository.getStudents();
      emit(StudentLoaded(students));
    } catch (e){
      emit(StudentError(e.toString()));
    }
  }

  Future<void> loadStudents() async {
    try {
      emit(StudentLoading());
      final studentList = await _repository.getStudents();
      emit(StudentLoaded(studentList));
    } catch (e) {
      emit(StudentError(e.toString()));
    }
  }

  Future<void> updateStudent(StudentModel student) async {
    try {
      emit(StudentLoading());
      await _repository.updateStudent(student);
      final students = await _repository.getStudents();
      emit(StudentLoaded(students));
    } catch (e) {
      emit(StudentError(e.toString()));
    }
  }

  Future<void> deleteStudent(String id) async {
    try {
      emit(StudentLoading());
      await _repository.deleteStudent(id);
      final students = await _repository.getStudents();
      emit(StudentLoaded(students));
    } catch (e) {
      emit(StudentError(e.toString()));
    }
  }
}