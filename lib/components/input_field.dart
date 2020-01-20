import 'package:flutter/material.dart';
import 'calc_model.dart';
import 'package:provider/provider.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalcModel>(
      builder: (context, fiel, child) {
        return SingleChildScrollView(
          child: SelectableText(
            '${fiel.inputValue}',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        );
      },
    );
  }
}
