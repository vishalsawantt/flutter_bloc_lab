import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen B')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push('/screenc', extra: 'Hello from Screen B!');
          }, 
          child: Text('Go to Screen C')),
      )
    );
  }
}