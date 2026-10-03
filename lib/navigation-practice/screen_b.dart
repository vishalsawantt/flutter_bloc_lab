import 'package:flutter/material.dart';
import 'package:flutter_bloc_lab/navigation-practice/screen_a.dart';
import 'package:go_router/go_router.dart';

class ScreenB extends StatelessWidget {
  // final String name;
  const ScreenB({super.key});

  //GoRouter Nevigation
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Screen B')),
  //     body: Center(
  //       child: ElevatedButton(
  //         onPressed: () {
  //           context.push('/screenc', extra: 'Hello from Screen B!');
  //         }, 
  //         child: Text('Go to Screen C')),
  //     )
  //   );
  // }

  //Core Nevigation
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Screen B')),
  //     body: Center(
  //       child: ElevatedButton(
  //         onPressed: () {
  //           Navigator.pop(context);
  //         }, 
  //         child: Text('Back to Screen A')),
  //     )
  //   );
  // }

  //Passing data
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Screen B')),
  //     body: Center(
  //       child: ElevatedButton(
  //         onPressed: () {}, 
  //         child: Text(name)),
  //     )
  //   );
  // }

  //Passing data from B to A
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen B')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, 'hello vishal');
          }, 
          child: Text("Back to a")),
      )
    );
  }
}