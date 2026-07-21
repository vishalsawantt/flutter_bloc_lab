import 'package:flutter_bloc_lab/features/listfeatch/data/model/list_model.dart';
import 'package:flutter_bloc_lab/features/listfeatch/data/services/local_data_source.dart';

class ListRepository {
  final LocalDataSource _services;

  ListRepository(this._services);

  Future<List<ListModel>> featchList() {
    return _services.getItems();
  }
}