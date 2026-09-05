import 'package:flutter/material.dart';

class Todolistcrud extends StatefulWidget {
  const Todolistcrud({super.key});

  @override
  State<Todolistcrud> createState() => _TodolistcrudState();
}

class _TodolistcrudState extends State<Todolistcrud> {
  List<String> notes = [];
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To Do List')),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(notes[index]));
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Note'),
                content: TextField(controller: noteController),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (noteController.text.isNotEmpty) {
                          notes.add(noteController.text);
                        }
                      });
                      noteController.clear();
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }
}
