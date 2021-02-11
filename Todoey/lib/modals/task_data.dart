import 'dart:collection';
import 'package:flutter/foundation.dart';
import './task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _task = [
    Task(name: "Buy milk"),
    Task(name: "Buy bread"),
    Task(name: "Buy eggs"),
  ];

  int get taskCount {
    return _task.length;
  }

  UnmodifiableListView<Task> get task{
    return UnmodifiableListView(_task);
  }

  void addNewtask(String taskName) {
    final newTask = Task(name: taskName);
    _task.add(newTask);
    notifyListeners();
  }

  void updateTaskCheck(Task task)
  {
    task.toggleDone();
    notifyListeners();
  }

  void longPress(int position)
  {
    _task.removeAt(position);
    notifyListeners();
  }
}
