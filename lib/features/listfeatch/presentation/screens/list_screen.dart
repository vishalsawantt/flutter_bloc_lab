import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/features/listfeatch/presentation/cubit/list_cubit.dart';
import 'package:flutter_bloc_lab/features/listfeatch/presentation/cubit/list_state.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
   @override
  void initState() {
    super.initState();

    context.read<ListCubit>().loaditem();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('itemList')),
      body: BlocBuilder<ListCubit, ListState>(
        builder: (context, state) {
          if (state is ListLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ListLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return ListTile(
                  title: Text(
                    item.itemName,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                );
              },
            );
          }
          if (state is ListError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
