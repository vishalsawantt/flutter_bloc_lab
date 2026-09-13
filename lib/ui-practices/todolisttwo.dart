import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crud/presentatation/bloc/todobloc.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crud/presentatation/event/todoevent.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crud/presentatation/state/todostate.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> todos = [];
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Padding(
      //   padding: EdgeInsets.all(20),
      //   child: ListView.builder(
      //     itemCount: note.length,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text(note[index]),
      //         trailing: Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             IconButton(
      //               onPressed: () {
      //                 setState(() {
      //                   note.removeAt(index);
      //                 });
      //               },
      //               icon: Icon(Icons.delete),
      //             ),

      //             IconButton(
      //               onPressed: () {
      //                 noteController.text = note[index];
      //                 showDialog(
      //                   context: context,
      //                   builder: (context) {
      //                     return AlertDialog(
      //                       title: Text("Update Note"),
      //                       content: TextField(controller: noteController),
      //                       actions: [
      //                         TextButton(
      //                           onPressed: () {
      //                             setState(() {
      //                               if (noteController.text.isNotEmpty) {
      //                                 note[index] = noteController.text;
      //                               }
      //                             });
      //                             noteController.clear();
      //                             Navigator.pop(context);
      //                           },
      //                           child: Text("Update"),
      //                         ),
      //                       ],
      //                     );
      //                   },
      //                 );
      //               },
      //               icon: Icon(Icons.edit),
      //             ),
      //           ],
      //         ),
      //       );
      //     },
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: BlocBuilder<Todobloc, TodoState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todos[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<Todobloc>().add(DeleteToDo(index));
                        },
                        icon: Icon(Icons.delete),
                      ),

                      IconButton(
                        onPressed: () {
                          noteController.text = state.todos[index];
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Update Note"),
                                content: TextField(controller: noteController),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      // setState(() {
                                      //   if (noteController.text.isNotEmpty) {
                                      //     note[index] = noteController.text;
                                      //   }
                                      // });
                                      context.read<Todobloc>().add(UpdateToDo(index, noteController.text));
                                      noteController.clear();
                                      Navigator.pop(context);
                                    },
                                    child: Text("Update"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteController.clear();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Notes"),
                content: TextField(controller: noteController),
                actions: [
                  TextButton(
                    onPressed: () {
                      // setState(() {
                      //   if (noteController.text.isNotEmpty) {
                      //     note.add(noteController.text);
                      //   }
                      // });
                      context.read<Todobloc>().add(
                        AddToDo(noteController.text),
                      );
                      noteController.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Add Note"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }
}
