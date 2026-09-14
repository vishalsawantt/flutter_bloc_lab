import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crudtwo/presentation/event/eventfile.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crudtwo/presentation/state/statefile.dart';

class Blocfile extends Bloc<Eventfile, Statefile> {
  Blocfile() : super(Statefile([])) {

    on<AddNote>((event, emit) {
      final noteslist = [...state.notes, event.note];
      emit(Statefile(noteslist));
    });

    on<UpdateNote>((event, emit) {
      final noteslist = [...state.notes];
      noteslist[event.index] = event.updatednote;
      emit(Statefile(noteslist));
    });

    on<DeleteNote>((event, emit) {
      final noteslist = [...state.notes];
      noteslist.removeAt(event.index);
      emit(Statefile(noteslist));
    });
  }
}