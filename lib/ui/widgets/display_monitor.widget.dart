import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:testing_class_app/controllers/calculator.controller.dart';

class DisplayMonitor extends StatelessWidget {
  DisplayMonitor({super.key});

  final _controller = GetIt.instance.get<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      color: Colors.black,
      child: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(
            _controller.monitor,
            minFontSize: 20.0,
            maxFontSize: 60.0,
            maxLines: 1,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              decoration: TextDecoration.none,
              fontSize: 60.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
