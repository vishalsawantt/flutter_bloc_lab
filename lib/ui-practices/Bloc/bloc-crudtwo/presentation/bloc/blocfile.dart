import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crudtwo/presentation/event/eventfile.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crudtwo/presentation/state/statefile.dart';

class Blocfile extends Bloc<Eventfile, Statefile> {
  Blocfile() : super(Statefile([])) {

    on<AddNote>((event, emit) {
      if (event.note.trim().isEmpty) {
        return;
      }
      final noteslist = [...state.notes, event.note];
      emit(Statefile(noteslist, message: "Note Added!"));
    });

    on<UpdateNote>((event, emit) {
      final noteslist = [...state.notes];
      noteslist[event.index] = event.updatednote;
      emit(Statefile(noteslist, message: "Note Updated!"));
    });

    on<DeleteNote>((event, emit) {
      final noteslist = [...state.notes];
      noteslist.removeAt(event.index);
      emit(Statefile(noteslist, message: "Note Deleted!"));
    });
  }
}