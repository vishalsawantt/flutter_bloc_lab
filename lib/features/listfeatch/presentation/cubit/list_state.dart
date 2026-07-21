
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_lab/features/listfeatch/data/model/list_model.dart';

abstract class ListState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListLoaded extends ListState {
  final List<ListModel> items;
  ListLoaded({required this.items});

  @override
  List<Object> get props => [items];
}

class ListError extends ListState {
  final String message;
  ListError({required this.message});

  @override
  List<Object> get props => [message];
}
