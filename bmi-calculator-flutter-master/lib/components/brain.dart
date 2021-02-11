import 'dart:math';

class Brain {
  Brain({this.height, this.weight});
  int height;
  int weight;
  double _calc;

  String calculateBMI() {
    _calc = weight / pow((height / 100), 2);
    String bmi = _calc.toStringAsFixed(1);
    return bmi;
  }

  String result() {
    if (_calc >= 25) {
      return 'OVERWEIGHT';
    } else if (_calc >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_calc >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_calc >= 18.5) {
      return 'You have a normal body weight. Good job!!';
    } else {
      return 'You have a lower than normal body weight. Try to eat a bit more.';
    }
  }
}
