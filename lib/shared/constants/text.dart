import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

const kTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 28,
  letterSpacing: 4,
  fontWeight: FontWeight.w200,
);

const kDigitStyle = TextStyle(
  color: Colors.white,
  fontSize: 28,
  letterSpacing: 2,
  fontWeight: FontWeight.w900,
);

class UnitText extends StatelessWidget {
  final int value;
  final String unit;

  UnitText({@required this.value, @required this.unit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomRight,
          child: AutoSizeText(
            value.toString(),
            style: kDigitStyle,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: AutoSizeText(
            unit,
            style: kTextStyle.copyWith(
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
