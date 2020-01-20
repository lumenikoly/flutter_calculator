import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcModel extends ChangeNotifier {
  bool _errorFlag = false;
  Parser p = Parser();
  String _inputValue = '';
  String _outputValue = '0';
  Expression exp;
  ContextModel cm = ContextModel();
  final regexp = RegExp(r"([\+|\^|%|\*|\/|\-|\(|\)])$");
  final inputRegExp = RegExp(r"([\+|\^|%|\*|\/|\(|\)])$");
  final reg1 = RegExp(r"\(");
  final reg2 = RegExp(r"\)");

  String get inputValue => _inputValue;
  String get outputValue => _outputValue;
  bool get errorFlag => _errorFlag;

  void add(String char) {
    if (_inputValue == '-' && (inputRegExp.hasMatch(char) || char == '-')) {
      return;
    }
    if (_inputValue == '' && char == '(' || char == '-') {
      _inputValue = _inputValue + char;
      notifyListeners();
      return;
    }
    if (_inputValue == '' && inputRegExp.hasMatch(char)) {
      return;
    }
    if (_inputValue == '(' && char == ')') {
      return;
    }

    if (reg1.allMatches(_inputValue).length ==
        reg2.allMatches(_inputValue).length) {
      _inputValue = _inputValue + char;
      _setOutputValue(_inputValue);
      notifyListeners();
      return;
    }
    _inputValue = _inputValue + char;
    notifyListeners();
  }

  void _setOutputValue(String value) {
    _errorFlag = false;
    if (regexp.hasMatch(_inputValue)) {
      return;
    }
    try {
      exp = p.parse('$value');
    } catch (error) {
      _errorFlag = true;
      print('Error $_errorFlag');
    }
    _outputValue = exp.evaluate(EvaluationType.REAL, cm).toString();
  }

  void clearAll() {
    _inputValue = '';
    _outputValue = '0';
    notifyListeners();
  }

  void clear() {
    _inputValue = _inputValue.length == 0
        ? (_inputValue = '')
        : _inputValue.substring(0, _inputValue.length - 1);
    _inputValue.length == 0 ? _outputValue = '0' : _setOutputValue(_inputValue);
    notifyListeners();
  }
}
