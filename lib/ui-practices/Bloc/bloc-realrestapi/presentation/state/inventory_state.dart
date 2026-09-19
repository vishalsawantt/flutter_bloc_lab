import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-realrestapi/models/inventory.dart';

abstract class InventoryState {}

class InventoryLoading extends InventoryState {}

class InventorySuccess extends InventoryState {
  final List<Inventory> items;
  InventorySuccess(this.items);
}

class InventoryError extends InventoryState {
  final String message;
  InventoryError(this.message);
}