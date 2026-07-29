import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_lab/features/rest-api-with-bloc/data/model/ProductModel.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object?> get props => [];
}

class FetchProducts extends ProductEvent {
  const FetchProducts();
}

class AddProduct extends ProductEvent {
  final Productmodel product;

  const AddProduct(this.product);

  @override
  List<Object?> get props => [product];
}