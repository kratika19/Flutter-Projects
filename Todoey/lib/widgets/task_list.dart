import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import '../modals/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final presentTask = taskData.task[index];
          return TaskTile(
            titleText: presentTask.name,
            isChecked: presentTask.isDone,
            checkBoxCallBack: (checkboxState) {
              taskData.updateTaskCheck(presentTask);
            },
            removeTask: (){
              taskData.longPress(index);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
