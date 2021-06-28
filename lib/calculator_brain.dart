import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(
      {required this.sub,
      required this.tax,
      required this.tipPercent,
      required this.people,
      required this.splitType});

  final num sub;
  final num tax;
  final int tipPercent;
  final int people;
  final String splitType;
}
