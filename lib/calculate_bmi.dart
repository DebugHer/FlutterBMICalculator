import 'dart:math';
import 'package:flutter/material.dart';
class CalculatorBrain{

  CalculatorBrain({this.height, this.weight});

  final int height, weight;
  double _bmi;
  static Color _color;

  //mass(kg)/height(m2)

  static Color getColor(){
    return _color;
  }

  String calculateBmi(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      _color = Colors.red;
      return 'Overweight';
    }else if(_bmi > 18.5){
      _color = Colors.green;
      return 'Normal';
    }else{
      _color = Colors.red;
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'Your body weight is quite higher than the normal, Try to exercise more and watch what you eat';
    }else if(_bmi > 18.5){
      return 'Nice One, You have a very normal BMI';
    }else{
      return 'Awww, Your body weight is quite lower than the normal, Try to eat more and do it rightly ';
    }
  }
}