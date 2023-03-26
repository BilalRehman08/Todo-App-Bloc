import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/repository/task_repo.dart';

import 'blocs/task_cubit.dart';
import 'views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskCubit>(
          create: (context) => TaskCubit(TaskRepository()),
        ),
      ],
      child: const MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
