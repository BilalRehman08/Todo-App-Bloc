import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/task_model.dart';
import '../repository/task_repo.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository taskRepository;

  TaskCubit(this.taskRepository)
      : super(TaskState(
          tasks: {
            TaskStatus.pending: taskRepository.getPendingTasks,
            TaskStatus.inProgress: taskRepository.getInProgressTasks,
            TaskStatus.done: taskRepository.getDoneTasks,
          },
        ));

  void addTask(TaskModel task) {
    taskRepository.addTask(task);
    _updateState();
  }

  void moveTaskToDone(TaskModel task) {
    taskRepository.moveTaskToDone(task);
    _updateState();
  }

  void moveTaskToInProgress(TaskModel task) {
    taskRepository.moveTaskToInProgress(task);
    _updateState();
  }

  void _updateState() {
    emit(
      TaskState(
        tasks: {
          TaskStatus.pending: taskRepository.getPendingTasks,
          TaskStatus.inProgress: taskRepository.getInProgressTasks,
          TaskStatus.done: taskRepository.getDoneTasks,
        },
      ),
    );
  }
}
