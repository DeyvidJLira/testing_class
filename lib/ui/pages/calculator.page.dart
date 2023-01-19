import 'package:flutter/material.dart';
import 'package:testing_class_app/ui/widgets/display_monitor.widget.dart';
import 'package:testing_class_app/ui/widgets/keyboard_button.widget.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        title: const Text(
          "Calculadora",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.indigo,
      body: Column(
        children: [
          DisplayMonitor(),
          const Divider(
            height: 1,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      KeyboardButton('AC', flex: 3, textColor: Colors.red),
                      KeyboardButton('/', textColor: Colors.green),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      KeyboardButton('7'),
                      KeyboardButton('8'),
                      KeyboardButton('9'),
                      KeyboardButton('x', textColor: Colors.green),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      KeyboardButton('4'),
                      KeyboardButton('5'),
                      KeyboardButton('6'),
                      KeyboardButton('-', textColor: Colors.green),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      KeyboardButton('1'),
                      KeyboardButton('2'),
                      KeyboardButton('3'),
                      KeyboardButton('+', textColor: Colors.green),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      KeyboardButton('0', flex: 2),
                      KeyboardButton('.'),
                      KeyboardButton('=', backgroundColor: Colors.green),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
