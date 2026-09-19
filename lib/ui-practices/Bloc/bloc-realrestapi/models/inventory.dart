import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-realrestapi/models/product.dart';

class Inventory {
  final Product product;
  final int productId;
  final int quantity;

  Inventory({
    required this.product,
    required this.productId,
    required this.quantity,
  });

  factory Inventory.fromJson(Map<String, dynamic> json) {
    return Inventory(
      product: Product.fromJson(json['product']),  // nested parse
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
}