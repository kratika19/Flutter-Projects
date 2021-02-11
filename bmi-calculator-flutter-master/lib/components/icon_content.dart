import 'package:flutter/material.dart';
import 'constants.dart';

class CardColumn extends StatelessWidget {
  CardColumn({@required this.icons, @required this.textFile});
  final IconData icons;
  final String textFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          textFile,
          style: labelTextStyle,
        )
      ],
    );
  }
}