import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/data/model/model.dart';

class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object?> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentLoaded extends StudentState {
  final List<StudentModel> students;
  const StudentLoaded(this.students);
  @override
  List<Object?> get props => [students];
}

class StudentSuccess extends StudentState {}

class StudentError extends StudentState {
  final String message;

  const StudentError(this.message);

  @override
  List<Object?> get props => [message];
}