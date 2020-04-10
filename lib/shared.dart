import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

const Color kInactiveInputColor = Color(0x203540A4);
const Color kActiveInputColor = Color(0x403540A4);
const Color kDeepBlue = Color(0xFF3540A4);

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

class SimpleButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  SimpleButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Colors.white,
      constraints: BoxConstraints.tightFor(
        width: 48,
        height: 48,
      ),
      child: Icon(
        icon,
        color: kDeepBlue,
      ),
    );
  }
}

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
