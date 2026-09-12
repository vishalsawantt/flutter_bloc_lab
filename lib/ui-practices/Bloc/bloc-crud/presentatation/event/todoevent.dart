abstract class TodoEvent {}

class AddToDo extends TodoEvent {
  final String todos;
  AddToDo(this.todos);
}

class DeleteToDo extends TodoEvent {
  final int index;
  DeleteToDo(this.index);
}

class UpdateToDo extends TodoEvent {
  final int index;
  final String updatedtodos;
  UpdateToDo(this.index, this.updatedtodos);
}