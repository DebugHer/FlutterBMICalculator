import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {

  IconTextWidget({@required this.iconData,@required this.textString});

  final IconData iconData;
  final String textString;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textString,
          style: TextStyle(
            fontSize: 18.0,
            letterSpacing: 2.5,
            fontFamily: 'Comforta',
          ),
        )
      ],
    );
  }
}