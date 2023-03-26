part of 'task_cubit.dart';

class TaskState {
  final Map<TaskStatus, List<TaskModel>> tasks;

  TaskState({required this.tasks});

  TaskState copyWith({
    Map<TaskStatus, List<TaskModel>>? tasks,
  }) {
    return TaskState(tasks: tasks ?? this.tasks);
  }
}
