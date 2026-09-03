import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/core/services/firebase_messaging_service.dart';
import 'package:flutter_bloc_lab/core/services/local_notification_service.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/data/services/services.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/domain/repository.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/presentation/bloc/student_bloc.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/presentation/cubit/data_cubit.dart';
import 'package:flutter_bloc_lab/features/real-firebase-data/presentation/screens/ui_screen.dart';
import 'package:flutter_bloc_lab/features/rest-api-with-bloc/data/repository/repository.dart';
import 'package:flutter_bloc_lab/features/rest-api-with-bloc/presentation/bloc/product_bloc.dart';
import 'package:flutter_bloc_lab/features/rest-api-with-bloc/presentation/screens/product_list_screen.dart';
import 'package:flutter_bloc_lab/firebase_options.dart';
import 'package:flutter_bloc_lab/ui-practices/counterscreen.dart';
import 'package:flutter_bloc_lab/ui-practices/loginscreen.dart';

import 'features/listfeatch/data/services/local_data_source.dart';
import 'features/listfeatch/domain/list_repository.dart';
import 'features/listfeatch/presentation/cubit/list_cubit.dart';
import 'features/listfeatch/presentation/screens/list_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // await LocalNotificationService.initialize();

//   // // notification relted code
//   // final notificationService = NotificationService();
//   // await notificationService.initialize();

//   print("App Started");
  
//   final repository = StudentRepository(StudentServices());
//   final students = await repository.getStudents();
//   print('------------------------------------------------------------------------------------------------------------------------------');
//   for(final student in students) {
//     print('ID : ${student.id}');
//     print('Name : ${student.name}');
//     print('city : ${student.city}');
//   }
//   print('------------------------------------------------------------------------------------------------------------------------------');

//   runApp(const MyApp());
// }


//same code for ui screen run
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print("App Started");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => ListCubit(
    //     ListRepository(
    //       LocalDataSource(),
    //     ),
    //   ),
    // return BlocProvider(
    //   create: (context) => StudentCubit(
    //     StudentRepository(
    //       StudentServices(),
    //     ),
    //   ),
    return MultiBlocProvider(
  providers: [

    BlocProvider(
      create: (_) => StudentCubit(
        StudentRepository(
          StudentServices(),
        ),
      ),
    ),

    BlocProvider(
      create: (_) => StudentBloc(
        StudentRepository(
          StudentServices(),
        ),
      ),
    ),
    BlocProvider(
  create: (_) => ProductBloc(
    ProductRepository(),
  ),
),

  ],
      // child: MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   theme: ThemeData(
      //     colorScheme: ColorScheme.fromSeed(
      //       seedColor: Colors.deepPurple,
      //     ),
      //   ),
      //   home: const ProductListScreen(),
      // ),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
        ),
        home: const Counterscreen(),
      ),
    );
  }
}