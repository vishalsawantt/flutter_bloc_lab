import 'package:flutter/material.dart';
import 'package:flutter_bloc_lab/navigation-practice/screen_e.dart';
import 'package:go_router/go_router.dart';

class ScreenC extends StatelessWidget {
  final String message;
  const ScreenC({super.key, required this.message});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Screen C')),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(message),
  //           const SizedBox(height: 20),
  //           ElevatedButton(
  //             onPressed: () {
  //               context.push('/detail/42');
  //             },
  //             child: const Text('Go to Screen D'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen C')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => ScreenE()),
                );
              },
              child: const Text('Go to Screen E'),
            ),
          ],
        ),
      ),
    );
  }
}
