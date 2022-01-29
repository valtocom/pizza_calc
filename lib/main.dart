import 'package:flutter/material.dart';
import 'package:pizza_calc/pizza_calc_screen.dart';
import 'package:pizza_calc/utils/global_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PizzaCalculator',
      theme: globalTheme(),
      home: const PizzaCalcScreen(),
    );
  }
}