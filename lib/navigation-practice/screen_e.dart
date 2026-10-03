import 'package:flutter/material.dart';
import 'package:flutter_bloc_lab/navigation-practice/screen_f.dart';
import 'package:go_router/go_router.dart';

class ScreenE extends StatelessWidget {
  const ScreenE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen E')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (_) => const ScreenF()),
              (route) => false,
              );
          },
          child: const Text('This is Screen E'),
        ),
      ),
    );
  }
}
