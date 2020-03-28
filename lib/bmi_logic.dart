import 'package:flutter/material.dart';

double calculateBMI(int weight, int height){
  return 10000*weight/(height.toDouble()*height.toDouble());
}
List calculateResult(double bmi){
  if(bmi < 18.5)
    return ["BELOW NORMAL WEIGHT", Colors.red.shade800];
  else if(bmi < 25)
    return ["NORMAL", Colors.green.shade800];
  else if(bmi < 30)
    return ["OVERWEIGHT", Colors.yellowAccent];
  else if(bmi < 35)
    return ["CLASS 1 OBESITY", Colors.deepOrange.shade800];
  else if(bmi < 40)
    return ["CLASS 2 OBESITY", Colors.red];
  else
    return ["CLASS 3 OBESITY", Colors.red.shade800];
}
