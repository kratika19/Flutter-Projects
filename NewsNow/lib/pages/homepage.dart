import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NewsNow",
          //style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: Container(
        color: Colors.blueGrey.shade800,
      ),
    );
  }
}
