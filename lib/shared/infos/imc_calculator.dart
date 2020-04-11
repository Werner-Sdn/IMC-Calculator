import 'package:com/shared/infos/gender_info.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class ImcCalculator {
  Gender gender;
  int height;
  int weight;
  double _imc;

  ImcCalculator(
      {@required this.height, @required this.weight, @required this.gender});

  double getImc() {
    _imc = (weight / pow(height / 100, 2)) + 3;
    return _imc;
  }

  String getStatus() {
    if (_imc <= 18.5) {
      return 'Tu es maigre comme un clou';
    } else if (getImc() > 18.5 && getImc() < 25) {
      return gender == Gender.male
          ? "Un vrai mannequin"
          : "Une vraie mannequin";
    } else {
      return gender == Gender.male
          ? 'Tu es un bon vivant'
          : 'Tu es une bonne vivante';
    }
  }

  String getInterpretation() {
    if (_imc <= 18.5) {
      return 'A moins de 18.5, tu dois manger, manger, et encore manger !';
    } else if (getImc() > 18.5 && getImc() < 25) {
      return 'Entre 18.5 et 25, tu peux continuer de vivre normalement !';
    } else {
      return 'Au delà de 25, tu dois ralentir sur le pâté !';
    }
  }
}
