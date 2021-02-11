import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

 final bool isChecked ;
 final String titleText;
 final Function checkBoxCallBack;
 final Function removeTask;

 TaskTile({this.titleText , this.isChecked, this.checkBoxCallBack, this.removeTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
       titleText,
        style: (TextStyle(
            fontSize: 18,
            decoration: isChecked ? TextDecoration.lineThrough : null)),
      ),
      trailing: Checkbox(
      activeColor: Color(0xFF4FADE0),
      value: isChecked,
      onChanged: checkBoxCallBack,
    ),
    onLongPress: removeTask,
    );
  }
}
