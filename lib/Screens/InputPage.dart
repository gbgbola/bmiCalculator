
import 'package:bmi/CalculatorBrain.dart';
import 'package:bmi/Screens/result_page.dart';
import 'package:bmi/component/IconContent.dart';
import 'package:bmi/component/RoundedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/component/ReusableCard.dart';
import 'package:bmi/constant.dart';
import '';

import '../component/bottom_button.dart';


enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Column(
            children: <Widget>[
              Row(
               children: [
                 Expanded(
                   child: ReusableCard(

                     onPress: () {
                       setState(() {
                         selectedGender = Gender.male;
                       });
                     },
                     colour: selectedGender == Gender.male ?
                     kActiveCardColour
                         : kInactiveCardColour,
                     cardChild: const IconContent(
                         icon: Icons.male,
                         label: 'Male'
                     ),
                   ),
                 ),
                 Expanded(child: ReusableCard(

                   onPress: () {
                     setState(() {
                       selectedGender = Gender.female;
                     });
                   },
                   colour: selectedGender == Gender.female ?
                   kActiveCardColour
                       : kInactiveCardColour,
                   cardChild: const IconContent(
                       icon: Icons.female,
                       label: 'Female'
                   ),
                 ),
                 ),

               ],


              ),

              Expanded(
                child: ReusableCard(
                  // onPress: () {
                  //   setState(() {
                  //     selectedGender = Gender.male;
                  //   });
                  // },
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Height',
                        style: kLabelTextStyle,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          const Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0Xff8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0XFFEB1555),
                          overlayColor: Color(0X29EB1555),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(weight.toString(), style: kNumberTextStyle,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedIconButton(icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    }),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundedIconButton(icon: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    })
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Age', style: kLabelTextStyle,
                            ),
                            Text(age.toString(), style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedIconButton(icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    }
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundedIconButton(icon: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    }),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ),

          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap:(){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context,
              MaterialPageRoute(builder: (Context) => ResultsPage(
                  interpretation: calc.getInterpretation(), bmiResult: calc.CalculateBMI(),  resultText: calc.getResult(),

              )),
              );
            },
          )
        ],
      ),
    );
  }
}
