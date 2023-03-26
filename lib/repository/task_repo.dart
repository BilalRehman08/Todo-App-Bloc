import '../models/task_model.dart';

class TaskRepository {
  static List<TaskModel> pendingTasks = [
    TaskModel(
        title: 'Task 1',
        description: 'Do something',
        stage: TaskStatus.pending),
    TaskModel(
        title: 'Task 2',
        description: 'Do something else',
        stage: TaskStatus.pending),
  ];

  static List<TaskModel> inProgressTasks = [
    TaskModel(
        title: 'Task 3',
        description: 'Do yet another thing',
        stage: TaskStatus.inProgress),
  ];

  static List<TaskModel> doneTasks = [
    TaskModel(
        title: 'Task 4',
        description: 'Do something completely different',
        stage: TaskStatus.done),
  ];

  void addTask(TaskModel task) {
    pendingTasks.add(task);
  }

  List<TaskModel> get getPendingTasks => pendingTasks;

  List<TaskModel> get getInProgressTasks => inProgressTasks;

  List<TaskModel> get getDoneTasks => doneTasks;

  void moveTaskToInProgress(TaskModel task) {
    pendingTasks.remove(task);
    inProgressTasks.add(task);
  }

  void moveTaskToDone(TaskModel task) {
    inProgressTasks.remove(task);
    doneTasks.add(task);
  }
}
