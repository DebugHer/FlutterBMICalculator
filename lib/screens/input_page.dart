import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/icon_text_widget.dart';
import 'package:bmi_calculator/constants.dart';
import '../widgets/round_icon_button.dart';
import 'package:bmi_calculator/widgets/BottomButton.dart';
import 'package:bmi_calculator/calculate_bmi.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  male,
  female
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  int height = 180;
  int weight = 60;
  int age = 10;

  //male = 1, female = 2
  void updateCardColor(Gender gender){
    if(gender == Gender.male){
      if(maleCardColor == kInactiveCardColor){
        maleCardColor = kActiveCardColor;
      }
    }else if(maleCardColor == kActiveCardColor){
      maleCardColor = kInactiveCardColor;
    }

    if(gender == Gender.female){
      if(femaleCardColor == kInactiveCardColor){
        femaleCardColor = kActiveCardColor;
      }
    }else if(maleCardColor == kActiveCardColor){
      femaleCardColor = kInactiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Know Your BMI', style: TextStyle(
              letterSpacing: 2.0,
              fontFamily: 'Comforta'
          ),),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                        onPressed: (){
                          setState(() {
                            updateCardColor(Gender.male);
                            print("Male Card was pressed");
                          });
                        },
                        color: maleCardColor,
                        cardChild: IconTextWidget(iconData: FontAwesomeIcons.mars, textString: "MALE",),
                  )),
                  Expanded(
                      child: ReusableCard(
                        onPressed: (){
                          setState(() {
                            updateCardColor(Gender.female);
                            print("Female Card was pressed");
                          });
                        },
                        color: femaleCardColor,
                        cardChild: IconTextWidget(iconData: FontAwesomeIcons.female, textString: "FEMALE",),
                      )
                  )
                ],
              ),
            ),
            Expanded(child: ReusableCard(
                color: kInactiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Center(
                    child: Text('HEIGHT', style: TextStyle(
                        letterSpacing: 2.5,
                        fontFamily: 'Comforta'
                    ),),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                        style: kBoldText),
                      Text('CM', style: TextStyle(
                          letterSpacing: 2.5,
                          fontFamily: 'Comforta'
                      ),)
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0
                      )
                    ),
                    child: Slider(
                      min: 100.0,
                      max: 300.0,
                      activeColor: Colors.deepOrange,
                      inactiveColor: Colors.yellow,
                      value: height.toDouble(),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                          print(newValue);
                        });
                      },

                    ),
                  ),
                ],
              ),
                )
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: ReusableCard(
                      color: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT'
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          weight.toString(),
                          style: kBoldText,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                              color: Colors.green,
                            ),

                            SizedBox(
                              width: 20,
                            ),

                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  if(weight > 0){
                                    weight--;
                                  }
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                              color: Colors.deepOrange,
                            )

                          ],
                        )
                      ],
                    ),
                  )
                  ),
                  Expanded(child: ReusableCard(color: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'AGE'
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          age.toString(),
                          style: kBoldText,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                              color: Colors.green,
                            ),

                            SizedBox(
                              width: 20,
                            ),

                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  if(age > 0){
                                    age--;
                                  }
                                });
                              },

                              icon: FontAwesomeIcons.minus,
                              color: Colors.deepOrange,
                            )

                          ],
                        )
                      ],
                    ),))
                ],
              ),
            ),
            BottomButton(
              text: 'Calculate BMI',
              onTap: (){
                CalculatorBrain calculator = new CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                          bmi: calculator.calculateBmi(),
                          result: calculator.getResult(),
                          interpretation: calculator.getInterpretation() ,)
                    )
              );
              },
            )
          ],
        ));
  }
}






