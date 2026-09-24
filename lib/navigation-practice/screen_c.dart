import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  final String message;
  const ScreenC({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen C')),
      body: Center(child: Text(message)),
    );
  }
}