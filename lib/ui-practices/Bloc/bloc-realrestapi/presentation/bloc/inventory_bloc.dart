import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-realrestapi/data/inventory_service.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-realrestapi/models/inventory.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-realrestapi/presentation/event/inventory_event.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-realrestapi/presentation/state/inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState>{
  final InventoryService service;

  InventoryBloc(this.service) : super(InventoryLoading()) {
    on<fetchInventory>((event, emit) async {
      emit(InventoryLoading());
      try {
        final rawData = await service.fetchInventory();
        final items = rawData.map((json) => Inventory.fromJson(json)).toList();
        emit(InventorySuccess(items));
      } catch (e) {
        emit(InventoryError(e.toString()));
      }
    });
  }
} 