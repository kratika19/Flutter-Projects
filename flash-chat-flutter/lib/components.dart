import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton(
      {@required this.text,
      @required this.onPressed,
      @required this.backgroundColor});

  final String text;
  final Function onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
