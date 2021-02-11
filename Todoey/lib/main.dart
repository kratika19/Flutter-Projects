import 'package:flutter/material.dart';
import './screen/TaskScreen.dart';
import 'package:provider/provider.dart';
import './modals/task_data.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home: TaskScreen(),
      ),
    );
  }
}