import 'package:Todoey/modals/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final myController = TextEditingController();
String taskName;

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Add Task",
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF6DC0EC),
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: myController,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 35,
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Color(0xFF6DC0EC),
              height: 50,
              onPressed: () {
                taskName = myController.text;
                Provider.of<TaskData>(
                  context,
                  listen: false,
                ).addNewtask(taskName);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
