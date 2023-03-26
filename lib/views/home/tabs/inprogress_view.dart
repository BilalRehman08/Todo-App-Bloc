import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/task_cubit.dart';
import '../../../models/task_model.dart';

class InProgressView extends StatelessWidget {
  const InProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        final inProgressTasks = state.tasks[TaskStatus.inProgress] ?? [];
        return ListView.builder(
          itemCount: inProgressTasks.length,
          itemBuilder: (context, index) {
            final task = inProgressTasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  BlocProvider.of<TaskCubit>(context).moveTaskToDone(task);
                },
              ),
            );
          },
        );
      },
    );
  }
}
