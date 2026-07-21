import 'dart:convert';

import 'package:flutter/services.dart';
import '../model/list_model.dart';

class LocalDataSource {
  Future<List<ListModel>> getItems() async {
    // Read JSON file from assets
    final String jsonString =
        await rootBundle.loadString('assets/data/list.json');

    // Convert JSON String to List
    final List<dynamic> jsonData = json.decode(jsonString);

    // Convert List<dynamic> to List<ListModel>
    return jsonData
        .map((item) => ListModel.fromMap(item))
        .toList();
  }
}