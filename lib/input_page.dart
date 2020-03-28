import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'round_icon_button.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'bmi_logic.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 160;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                      ontap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                      ontap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kCustomTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kCustomTextStyleValue,
                      ),
                      Text(
                        " cm",
                        style: kCustomTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: kBottomContainerColor,
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 220.0,
                      //activeColor: Colors.white,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    cardChild: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "WEIGHT",
                          style: kCustomTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kCustomTextStyleValue,
                        ),
                        RowIcon(
                            operation1: (){
                              setState(() {
                                weight--;
                              });
                            },
                            operation2: (){
                              setState(() {
                                weight++;
                              });
                            }
                        )
                      ],
                    ),
                    colour: kActiveCardColor,
                  )),
                  Expanded(
                      child: ReusableCard(
                          cardChild: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "AGE",
                                style: kCustomTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kCustomTextStyleValue,
                              ),
                              RowIcon(
                                operation1: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                operation2: (){
                                  setState(() {
                                    age++;
                                  });
                                })
                            ],
                          ),
                          colour: kActiveCardColor
                      )
                  )
                ],
              ),
            ),
            Container(
                color: kBottomContainerColor,
                width: double.infinity,
                height: kBottomContainerHeight,
                child: GestureDetector(
                  onTap: (){
                    if(selectedGender != Gender.female && selectedGender != Gender.male){
                      Fluttertoast.showToast(
                          msg: "Select a gender first!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: kActiveCardColor,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      return;
                    }
                    double bmi = calculateBMI(weight, height);
                    List result = calculateResult(bmi);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(bmi: bmi, result: result[0], colour: result[1],)));
                    },
                  child: Center(
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
            )
          ],
        ));
  }
}

class RowIcon extends StatelessWidget {

  RowIcon({@required this.operation1, @required this.operation2});
  final Function operation1;
  final Function operation2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RoundIconButton(
          operation: operation1,
          icon: FontAwesomeIcons.minus,
        ),
        RoundIconButton(
          operation: operation2,
          icon: FontAwesomeIcons.plus,
        )
      ],
    );
  }
}
