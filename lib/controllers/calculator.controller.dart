import 'package:mobx/mobx.dart';

class CalculatorController {
  CalculatorController() {
    clear = Action(_clear);
    drawMonitor = Action(_drawMonitor);
  }

  static const operations = ['+', '-', 'x', '/', '='];

  final _monitor = Observable<String>("0");
  String get monitor => _monitor.value;
  String _nextValue = "";

  String _operation = "";
  bool _usedOperation = false;

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  bool _totalCalculated = false;

  late Action clear;
  late Action drawMonitor;

  _clear() {
    _monitor.value = "0";
    _nextValue = "0";
    _operation = "";
    _usedOperation = false;
    _totalCalculated = false;
    _buffer.setAll(0, [0, 0]);
    _bufferIndex = 0;
  }

  _drawMonitor() {
    _monitor.value = _nextValue;
  }

  _setOperation(String operation) {
    if (_usedOperation && operation == _operation) return;

    if (_bufferIndex == 0) {
      _bufferIndex = 1;
    } else {
      if (!_totalCalculated) _buffer[0] = _calculate();
    }

    if (operation != '=') _operation = operation;

    _nextValue = _buffer[0].toString();
    _nextValue =
        _nextValue.endsWith('.0') ? _nextValue.split('.')[0] : _nextValue;

    _usedOperation = true;

    drawMonitor();
  }

  _addDigit(String digit) {
    _nextValue = monitor;

    if (_usedOperation) _nextValue = "0";

    if (_nextValue.contains('.') && digit == '.') digit = '';
    if (_nextValue == '0' && digit != '.') _nextValue = '';

    _nextValue += digit;

    _buffer[_bufferIndex] =
        double.tryParse(_nextValue) ?? _buffer[_bufferIndex];

    _usedOperation = false;
    _totalCalculated = false;

    drawMonitor();
  }

  executeCommand(String command) {
    if (command == 'AC') {
      clear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
  }

  double _calculate() {
    _totalCalculated = true;
    switch (_operation) {
      case "+":
        return _buffer[0] + _buffer[1];
      case "-":
        return _buffer[0] - _buffer[1];
      case "x":
        return _buffer[0] * _buffer[1];
      case "/":
        return _buffer[0] / _buffer[1];
      default:
        return 0.0;
    }
  }
}
