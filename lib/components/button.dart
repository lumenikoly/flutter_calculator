import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calc_model.dart';

class Button extends StatelessWidget {
  final Color _color;
  final String _text;
  const Button(String text, Color color)
      : _text = text,
        _color = color;

  void _onPressed(BuildContext context) {
    Provider.of<CalcModel>(context, listen: false).add(_text);
  }

  void _onLongPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.purple[100],
        onTap: () {
          _onPressed(context);
        },
        onLongPress: () {
          _onLongPressed(context);
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              width: 0.0,
            ),
          ),
          child: Center(
            child: Text(
              '$_text',
              style: (TextStyle(fontSize: 25)),
            ),
          ),
        ),
      ),
    ));
  }
}

class FunctionButton extends Button {
  FunctionButton(String text, Color color) : super(text, color);
  @override
  void _onPressed(BuildContext context) {
    Provider.of<CalcModel>(context, listen: false).clear();
  }

  void _onLongPressed(BuildContext context) {
    Provider.of<CalcModel>(context, listen: false).clearAll();
  }
}
