import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crudtwo/presentation/bloc/blocfile.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crudtwo/presentation/event/eventfile.dart';
import 'package:flutter_bloc_lab/ui-practices/Bloc/bloc-crudtwo/presentation/state/statefile.dart';

class Uifile extends StatefulWidget {
  const Uifile({super.key});

  @override
  State<Uifile> createState() => _UifileState();
}

class _UifileState extends State<Uifile> {
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bloc UI")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<Blocfile, Statefile>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.notes[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                    onPressed: () {
                      context.read<Blocfile>().add(DeleteNote(index));
                    },
                    icon: Icon(Icons.delete),
                  ),
                  IconButton(onPressed: () {
                    noteController.text = state.notes[index];
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Update Note"),
                          content: TextField(controller: noteController),
                          actions: [
                            TextButton(onPressed: () {
                              context.read<Blocfile>().add(UpdateNote(index, noteController.text));
                              noteController.clear();
                              Navigator.pop(context);
                            }, child: Text("Update")),
                            SizedBox(width: 5),
                            TextButton(onPressed: () {
                              Navigator.pop(context);
                            }, child: Text("Cancel")),
                          ],
                        );
                      }); 
                  }, icon: Icon(Icons.update))
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
                title: Text('Add Note'),
                content: TextField(controller: noteController),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<Blocfile>().add(
                        AddNote(noteController.text),
                      );
                      Navigator.pop(context);
                      noteController.clear();
                    },
                    child: Text("Add"),
                  ),
                  SizedBox(width: 5),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("Cancel"))
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
