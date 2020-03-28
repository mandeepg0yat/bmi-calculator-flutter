import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.operation});

  final IconData icon;
  final Function operation;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      child: Icon(icon, size: 35, color: Colors.white,),
      onPressed: operation,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50
      ),
    );
  }
}
