// abstract class Todostate {}

// class ToDoInitial extends Todostate {}

// class ToDoLoading extends Todostate {}

// class ToDoSuccess extends Todostate {
//   final List<String> notes;
//   ToDoSuccess(this.notes); 
// }

// class ToDoError extends Todostate {
//   final String message;
//   ToDoError(this.message);
// }

class TodoState {
  final List<String> todos;
  TodoState(this.todos);
}