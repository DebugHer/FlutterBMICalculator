import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/BottomButton.dart';

class ResultPage extends StatelessWidget{

  ResultPage({@required this.bmi, @required this.result, @required this.interpretation});

  final String bmi, result, interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Container(
                  child: Text("Your Results", style: kSemiBoldText,),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(result, style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: CalculatorBrain.getColor(),
                      fontFamily: 'Comforta'
                  ),),
                  Text(bmi, style: kBmiTextStyle,),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(interpretation, style: kBodyTextStyle, textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),

          ),
          Expanded(
            child: BottomButton(
              text: 'GO BACK',
              onTap: (){
                Navigator.pop(context);
              },
            )
          )
        ],
      ),
    );
  }
}