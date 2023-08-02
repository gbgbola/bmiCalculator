import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0;

  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toString();
  }

  String getResult() {
    if (-_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'Normal';
    }
    else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (-_bmi >= 25) {
      return 'You Have a Higher Than Normal Body Weight. Try to Exercise';
    } else if (_bmi > 18.5) {
      return 'You have a Normal Body Weight';
    }
    else {
      return 'You Have a Lower Than Normal Body Weight. Try to Eat More.';
    }
  }
}