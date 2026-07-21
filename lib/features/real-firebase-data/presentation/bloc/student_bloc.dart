import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/domain/repository.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/presentation/bloc/student_event.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/presentation/cubit/data_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository _repository;

  StudentBloc(this._repository) :super(StudentInitial()) {
    on<LoadStudents>(_onLoadStudents);
    on<AddStudent>(_onAddStudent);
    on<UpdateStudent>(_onUpdateStudent);
    on<DeleteStudent>(_onDeleteStudent);
  }

  Future<void> _onLoadStudents(
    LoadStudents event,
    Emitter<StudentState> emit,
  ) async {
    try {
      emit(StudentLoading());
      final students = await _repository.getStudents();
      emit(StudentLoaded(students));
    } catch (e) {
      emit(StudentError(e.toString()));
    }
  }

  Future<void> _onAddStudent(
    AddStudent event,
    Emitter<StudentState> emit,
  ) async {
    try {
      emit(StudentLoading());

      await _repository.addStudent(event.student);

      final students = await _repository.getStudents();

      emit(StudentLoaded(students));
    } catch (e) {
      emit(StudentError(e.toString()));
    }
  }

  Future<void> _onUpdateStudent(
    UpdateStudent event,
    Emitter<StudentState> emit,
  ) async {
    try {
      emit(StudentLoading());

      await _repository.updateStudent(event.student);

      final students = await _repository.getStudents();

      emit(StudentLoaded(students));
    } catch (e) {
      emit(StudentError(e.toString()));
    }
  }

  Future<void> _onDeleteStudent(
    DeleteStudent event,
    Emitter<StudentState> emit,
  ) async {
    try {
      emit(StudentLoading());

      await _repository.deleteStudent(event.id);

      final students = await _repository.getStudents();

      emit(StudentLoaded(students));
    } catch (e) {
      emit(StudentError(e.toString()));
    }
  }
}