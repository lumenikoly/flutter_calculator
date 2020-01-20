import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator.dart';
import 'components/calc_model.dart';

void main() => runApp(Calc());

class Calc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
          title: "Convercalc",
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('Калькулятор'),
            ),
            body: Calculator(),
          )),
      create: (BuildContext context) => CalcModel(),
    );
  }
}
