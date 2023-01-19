import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:testing_class_app/controllers/calculator.controller.dart';
import 'package:testing_class_app/ui/pages/calculator.page.dart';

void main() {
  GetIt.instance.registerSingleton(CalculatorController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const CalculatorPage(),
    );
  }
}
