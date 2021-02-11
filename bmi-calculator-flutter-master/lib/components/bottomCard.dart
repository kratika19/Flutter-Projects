import 'package:flutter/material.dart';
import 'constants.dart';
class BottomCard extends StatelessWidget {
  BottomCard({@required this.displayText, @required this.onTap});
  final Function onTap;
  final String displayText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: colorBottomCard,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
        padding: EdgeInsets.only(
          bottom: 16,
        ),
        child: Center(
          child: Text(
            displayText,
            style: bottomText,
          ),
        ),
      ),
    );
  }
}