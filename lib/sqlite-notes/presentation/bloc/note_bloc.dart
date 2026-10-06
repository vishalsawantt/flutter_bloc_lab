import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/sqlite-notes/data/db_helper.dart';
import 'package:flutter_bloc_lab/sqlite-notes/presentation/event/note_event.dart';
import 'package:flutter_bloc_lab/sqlite-notes/presentation/state/note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteLoading()) {
    on<NoteFeatch>((event, emit) async {
      emit(NoteLoading());
      try {
        final notes = await DBHelper.getNotes();
        emit(NoteSuccess(notes));
      } catch (e) {
        emit(NoteError(e.toString()));
      }
    });

    on<NoteAdd>((event, emit) async {
      if (event.note.trim().isEmpty) return;
      await DBHelper.insertNote(event.note);
      final notes = await DBHelper.getNotes();
      emit(NoteSuccess(notes));
    });

    on<UpdateNote>((event, emit) async {
      if (event.updatednote.trim().isEmpty) return;

      await DBHelper.updateNote(event.id, event.updatednote);

      final notes = await DBHelper.getNotes();

      emit(NoteSuccess(notes));
    });

    on<DeleteNote>((event, emit) async {
      await DBHelper.deleteNote(event.id);

      final notes = await DBHelper.getNotes();

      emit(NoteSuccess(notes));
    });
  }
}
