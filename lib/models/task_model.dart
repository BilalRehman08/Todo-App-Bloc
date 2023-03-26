enum TaskStatus { pending, inProgress, done }

class TaskModel {
  String title;
  String description;
  TaskStatus stage;

  TaskModel({
    required this.title,
    required this.description,
    this.stage = TaskStatus.pending,
  });
}
