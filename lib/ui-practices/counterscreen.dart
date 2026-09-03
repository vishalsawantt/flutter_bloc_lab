import 'package:flutter/material.dart';

class Counterscreen extends StatefulWidget {
  const Counterscreen({super.key});

  @override
  State<Counterscreen> createState() => _CounterscreenState();
}

class _CounterscreenState extends State<Counterscreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter Scrren")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count'
            ),

            Padding(
            padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    }, 
                    child: Text('Increase')),

                  ElevatedButton(
                    onPressed: count == 0 ? null 
                      : () {
                        setState(() {
                          count--;
                        });
                    }, 
                    child: Text('decrease')),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count = 0;
                      });
                    }, 
                    child: Text('Reset')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}