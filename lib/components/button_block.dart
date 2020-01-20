import 'package:flutter/material.dart';
import 'package:flutter_calculator/components/button.dart';

class ButtonBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button('7', Colors.blue),
            Button('8', Colors.blue),
            Button('9', Colors.blue),
            Button('/', Colors.green),
            FunctionButton('C', Colors.green),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button('4', Colors.blue),
            Button('5', Colors.blue),
            Button('6', Colors.blue),
            Button('*', Colors.green),
            Button('^', Colors.green)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button('1', Colors.blue),
            Button('2', Colors.blue),
            Button('3', Colors.blue),
            Button('-', Colors.green),
            Button('+', Colors.green)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button('.', Colors.blue),
            Button('0', Colors.blue),
            Button('00', Colors.blue),
            Button('(', Colors.green),
            Button(')', Colors.green)
          ],
        )
      ],
    );
  }
}
