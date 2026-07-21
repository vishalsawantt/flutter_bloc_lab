import 'package:equatable/equatable.dart';

class ListModel extends Equatable {
  final int id;
  final String itemName;

  ListModel({required this.id, required this.itemName});

  Map<String, dynamic> toMap() {
    return {'id': id, 'itemName': itemName};
  }

  factory ListModel.fromMap(Map<String, dynamic> map) {
    return ListModel(id: map['id'], itemName: map['itemName']);
  }
  @override
  List<Object> get props => [id, itemName];
}
