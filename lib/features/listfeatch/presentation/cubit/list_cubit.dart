import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/features/listfeatch/domain/list_repository.dart';
import 'package:flutter_bloc_lab/features/listfeatch/presentation/cubit/list_state.dart';

class ListCubit extends Cubit<ListState> {
  final ListRepository _repository;

  ListCubit(this._repository) : super(ListInitial());

  void loaditem() async {
    emit(ListLoading());
    try {
      final items = await _repository.featchList();
      emit(ListLoaded(items: items));
    } catch (e) {
      emit(ListError(message: e.toString()));
    }
  }
}