import 'package:flutter/material.dart';

class ScreenF extends StatefulWidget {
  const ScreenF({super.key});

  @override
  State<ScreenF> createState() => _ScreenFState();
}

class _ScreenFState extends State<ScreenF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screnn F")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {}, 
              child: Text('Screen F button'))
          ],
        ),
      ),
    );
  }
}