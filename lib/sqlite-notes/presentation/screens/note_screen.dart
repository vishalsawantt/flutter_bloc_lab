import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/sqlite-notes/presentation/bloc/note_bloc.dart';
import 'package:flutter_bloc_lab/sqlite-notes/presentation/event/note_event.dart';
import 'package:flutter_bloc_lab/sqlite-notes/presentation/state/note_state.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<NoteBloc>().add(NoteFeatch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite Database')),
      body: BlocConsumer<NoteBloc, NoteState>(
        listener: (context, state) {
          if (state is NoteError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is NoteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NoteSuccess) {
            return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                final note = state.notes[index];
                return ListTile(
                  title: Text(note['text']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<NoteBloc>().add(DeleteNote(note['id']));
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                          noteController.text = note['text'];
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Update Note'),
                                content: TextField(controller: noteController),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.read<NoteBloc>().add(
                                        UpdateNote(note['id'], noteController.text),
                                      );
                                      noteController.clear();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Update'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is NoteError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteController.clear();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Note'),
                content: TextField(controller: noteController),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<NoteBloc>().add(NoteAdd(noteController.text));
                      noteController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }
}