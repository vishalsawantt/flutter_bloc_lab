import 'package:flutter/material.dart';
import 'package:flutter_bloc_lab/navigation-practice/screen_b.dart';
import 'package:go_router/go_router.dart';

class ScreenA extends StatelessWidget {
  final String name = 'vishal';
  const ScreenA({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Screen A')),
  //     body: Center(
  //       child: ElevatedButton(
  //         onPressed: () {
  //           context.push('/screenb');
  //         }, 
  //         child: const Text('Go to Screen B'),
  //       ),
  //     ),
  //   );
  // }

  //Passing data from A to B
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Screen A')),
  //     body: Center(
  //       child: ElevatedButton(
  //         onPressed: () {
  //           Navigator.push(
  //             context, 
  //             MaterialPageRoute(
  //               builder: (context) => ScreenB(name: name)));
  //         }, 
  //         child: const Text('Go to Screen B'),
  //       ),
  //     ),
  //   );
  // }

  //Geting data from B to A
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Screen A')),
  //     body: Center(
  //       child: 
  //         ElevatedButton(
  //           onPressed: () async {
  //             final result = await Navigator.push(
  //               context, 
  //               MaterialPageRoute(
  //                 builder: (context) => ScreenB(),
  //               ),
  //             );
  //             print(result);

  //             ScaffoldMessenger.of(context).showSnackBar(
  //               SnackBar(
  //                 content: Text(result.toString()),
  //               ),
  //             );
  //           }, 
  //           child: const Text("Go to Screen B"),
  //         ),
  //     ),
  //   );
  // }

  //useing simple route
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen A')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context, 
              '/abc',
              arguments: 'vishal'
            );
          }, 
          child: const Text('Go to Screen B'),
        ),
      ),
    );
  }
}