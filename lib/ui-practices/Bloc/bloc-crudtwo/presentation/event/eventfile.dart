abstract class Eventfile {}

class AddNote extends Eventfile{
  final String note;
  AddNote(this.note);
}

class UpdateNote extends Eventfile {
  final int index;
  final String updatednote;
  UpdateNote(this.index, this.updatednote);
}

class DeleteNote extends Eventfile {
  final int index;
  DeleteNote(this.index);
}