import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/task_cubit.dart';
import '../../../models/task_model.dart';

class DoneView extends StatelessWidget {
  const DoneView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        final doneTasks = state.tasks[TaskStatus.done] ?? [];

        return ListView.builder(
          itemCount: doneTasks.length,
          itemBuilder: (context, index) {
            final task = doneTasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
            );
          },
        );
      },
    );
  }
}
