import 'package:flutter/material.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {

  BottomButton({this.text, this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        color: Colors.deepOrange,
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(child: Text(text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 2.0,
              fontFamily: 'Comforta'
          ),
        ),
        ),
      ),
    );
  }
}