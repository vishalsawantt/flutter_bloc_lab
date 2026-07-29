import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/features/rest-api-with-bloc/presentation/bloc/product_bloc.dart';
import 'package:flutter_bloc_lab/features/rest-api-with-bloc/presentation/bloc/product_event.dart';
import 'package:flutter_bloc_lab/features/rest-api-with-bloc/presentation/bloc/product_state.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
 @override
void initState() {
  super.initState();

  print("Product Screen Opened");

  context.read<ProductBloc>().add(
    const FetchProducts(),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products List")),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];

                return ListTile(
                  title: Text(product.productname),
                  subtitle: Text(product.productdecr),
                  trailing: Text(product.productprice),
                );
              },
            );
          }

          if (state is ProductError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
