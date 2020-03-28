import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.result, @required this.bmi, @required this.colour});

  final String result;
  final double bmi;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              result,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                color: colour
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              num.parse(bmi.toStringAsFixed(2)).toString(),
              style: kCustomTextStyleValue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Center(
            child: Text(
              "RE-CALCULATE",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
