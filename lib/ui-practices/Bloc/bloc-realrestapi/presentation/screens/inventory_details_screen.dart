import 'package:flutter/material.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-realrestapi/models/inventory.dart';

class DetailScreen extends StatefulWidget {
  final Inventory inventory;
  const DetailScreen({super.key, required this.inventory});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text(widget.inventory.product.name)),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price: ${widget.inventory.product.price}'),
          Text('Quantity: ${widget.inventory.quantity}'),
          Text('Product ID: ${widget.inventory.productId}'),
        ],
      ),
    ),
  );
}
}