import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget{

  RoundIconButton({this.icon, this.color, this.onPressed, this.onLongPress});

  final IconData icon;
  final Color color;
  final Function onPressed;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      onPressed: onPressed,
      onLongPress: onLongPress,
      shape: CircleBorder(),
      //fillColor: Color(0XFF4C4F5E),
        fillColor: color,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),

    );
  }

}