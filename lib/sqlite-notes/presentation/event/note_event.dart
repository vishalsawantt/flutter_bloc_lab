abstract class NoteEvent{}

class NoteAdd extends NoteEvent {
  final String note;
  NoteAdd(this.note);
}

class NoteFeatch extends NoteEvent {

}
class UpdateNote extends NoteEvent {
  final int id;
  final String updatednote;
  UpdateNote(this.id, this.updatednote);
}

class DeleteNote extends NoteEvent {
  final int id;
  DeleteNote(this.id);
}