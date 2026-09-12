import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crud/presentatation/event/todoevent.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crud/presentatation/state/todostate.dart';

class Todobloc extends Bloc<TodoEvent, TodoState> {
  Todobloc () : super(TodoState([])) {

    on<AddToDo>((event, emit){
      final updatednotes = [...state.todos, event.todos];
      emit(TodoState(updatednotes));
    });

    on<UpdateToDo>((event, emit) {
      final todos = [...state.todos];
      todos[event.index] = event.updatedtodos;
      emit(TodoState(todos));
    });

    on<DeleteToDo>((event, emit) {
      final todos = [...state.todos];
      todos.removeAt(event.index);
      emit(TodoState(todos));
    });
  }
}