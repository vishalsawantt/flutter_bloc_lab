import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-realrestapi/presentation/bloc/inventory_bloc.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-realrestapi/presentation/event/inventory_event.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-realrestapi/presentation/screens/inventory_details_screen.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-realrestapi/presentation/state/inventory_state.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<InventoryBloc>().add(fetchInventory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("REST Product")),
      body: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          if (state is InventoryLoading) {
            return CircularProgressIndicator();
          } else if (state is InventorySuccess) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final inventory = state.items[index]; 
                return ListTile(
                  title: Text(
                    inventory.product.name,
                  ), // nested — product's name
                  subtitle: Text('Price: ${inventory.product.price}'),
                  trailing: Text('Qty: ${inventory.quantity}'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(inventory: inventory)));
                  },
                );
              },
            );
          } else if (state is InventoryError) {
            return Center(
              child: Text(state.message, style: const TextStyle(fontSize: 18)),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
