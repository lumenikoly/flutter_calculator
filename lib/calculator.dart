import 'package:flutter/material.dart';
import 'components/button_block.dart';
import 'package:provider/provider.dart';
import 'components/calc_model.dart';
import 'components/input_field.dart';
import 'components/output_field.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final snackBar = SnackBar(
    content: Text('Поаккуратнее с выражениями!'),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final value = Provider.of<CalcModel>(context).errorFlag;
    if (value) {
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.cyan])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              child: InputField(),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            ),
          ),
          Padding(
            child: OutputField(),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          ),
          ButtonBlock(),
        ],
      ),
    );
  }
}
