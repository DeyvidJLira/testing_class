import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:testing_class_app/controllers/calculator.controller.dart';

class KeyboardButton extends StatelessWidget {
  KeyboardButton(
    this._command, {
    super.key,
    this.flex = 1,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.black,
  });

  final _controller = GetIt.instance.get<CalculatorController>();

  final String _command;
  final int flex;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => _controller.executeCommand(_command),
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
          child: Text(
            _command,
            style: TextStyle(fontSize: 24, color: textColor),
          ),
        ),
      ),
    );
  }
}
