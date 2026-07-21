import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/core/constants/app_colors.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/data/model/model.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/presentation/bloc/student_bloc.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/presentation/bloc/student_event.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/presentation/cubit/data_cubit.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/presentation/cubit/data_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final nameController = TextEditingController();
  final cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //context.read<StudentCubit>().loadStudents();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StudentCubit>().loadStudents();
    });
  }

  void _showAddStudentDialog({StudentModel? student}) {
    if (student != null) {
      nameController.text = student.name;
      cityController.text = student.city;
    } else {
      nameController.clear();
      cityController.clear();
    }
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text(
            student == null ? 'Add Student' : 'Update Student',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // final student = StudentModel(
                //   name: nameController.text, 
                //   city: cityController.text
                // );
                // context.read<StudentCubit>().addStudent(student);
                // context.read<StudentCubit>().updateStudent(student);
                // Navigator.pop(context);
                if (student == null) {
                  final student = StudentModel(
                    name: nameController.text, 
                    city: cityController.text
                  );
                  //context.read<StudentCubit>().addStudent(student);
                  context.read<StudentBloc>().add(AddStudent(student));
                  Navigator.pop(context);
                } else {
                  final updatedStudent =  StudentModel(
                        id: student.id,
                        name: nameController.text,
                        city: cityController.text,
                  );
                  context.read<StudentCubit>().updateStudent(updatedStudent);
                  Navigator.pop(context);
                }
              }, 
              child: const Text('Save'),
            ),
          ],
        );
      },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students CRUD')
      ),
      body: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          if (state is StudentLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.warning),
            );
          }

          if (state is StudentLoaded) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: state.students.length,
              itemBuilder: (context, index) {
                final student = state.students[index];

                return ListTile(
                  title: Text(student.name),
                  subtitle: Text(student.city),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          _showAddStudentDialog(student: student);
                        }, 
                      icon: Icon(Icons.edit, color: Colors.blue)),
                      IconButton(onPressed: () {
                        context.read<StudentCubit>().deleteStudent(student.id!);
                      }, 
                      icon: Icon(Icons.delete, color: Colors.amber)
                      ),
                    ],
                  ),
                );
              }
            );
          }

          if (state is StudentError) {
            return Center(
              child: Text(state.message),
            );
          }

           return const Center(
            child: Text('No Students'),
          );
        }),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddStudentDialog,
        child: Icon(Icons.add)),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    cityController.dispose();
    super.dispose();
  }
}