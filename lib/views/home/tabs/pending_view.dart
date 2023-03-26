import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/task_cubit.dart';
import '../../../models/task_model.dart';
import '../../../widgets/add_dialog.dart';

class PendingView extends StatelessWidget {
  const PendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          final pendingTasks = state.tasks[TaskStatus.pending] ?? [];
          return ListView.builder(
            itemCount: pendingTasks.length,
            itemBuilder: (context, index) {
              final task = pendingTasks[index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    context.read<TaskCubit>().moveTaskToInProgress(task);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
