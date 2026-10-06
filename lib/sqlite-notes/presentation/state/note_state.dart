abstract class NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {
  final List<Map<String, dynamic>> notes;
  NoteSuccess(this.notes);
}

class NoteError extends NoteState {
  final String message;
  NoteError(this.message);
}