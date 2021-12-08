import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manger'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.orange,
            child: Card(
              color: Colors.deepPurple,
              child: Text("Hello"),
              elevation: 10,
            ),
          ),
          Card(
            child: Container(
              child: Text("Bye Bye"),
              width: double.infinity,
              color: Colors.lightGreen,
            ),
          ),
        ],
      ),
    );
  }
}
