import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> note = [];
  final noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: note.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(note[index]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        note.removeAt(index);
                      });
                  }, icon: Icon(Icons.delete)),

                  IconButton(
                    onPressed: () {
                      noteController.text = note[index];
                      showDialog(
                        context: context, 
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Update Note"),
                            content: TextField(controller: noteController),
                            actions: [
                              TextButton(onPressed: () {
                                setState(() {
                                  if (noteController.text.isNotEmpty) {
                                    note[index] = noteController.text;
                                  }
                                });
                                noteController.clear();
                                Navigator.pop(context);
                              }, child: Text("Update"))
                            ],
                          );
                        });
                    }, icon: Icon(Icons.edit))
                ],
              ),
            );
          }),  
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Notes"),
                content: TextField(controller: noteController),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (noteController.text.isNotEmpty) {
                          note.add(noteController.text);
                        }
                      });
                      noteController.clear();
                      Navigator.pop(context);
                    }, child: Text("Add Note")),
                ],
              );
            });
      }, child: Icon(Icons.add)),
    ); 
  }
}