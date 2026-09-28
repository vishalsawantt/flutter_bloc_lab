import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenD extends StatelessWidget {
  final String id;
  const ScreenD({super.key, required this.id});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen D')),
      body: Center(child: Text('ID from URL: $id')),
    );
  }
}