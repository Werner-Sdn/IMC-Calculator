import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'shared.dart';

class NextButton extends StatelessWidget {
  final String text;
  final Color color;

  NextButton({@required this.text, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: color,
      child: Center(
        child: AutoSizeText(
          text,
          maxLines: 1,
          style: kTextStyle.copyWith(
            fontWeight: FontWeight.w400,
            letterSpacing: 6,
          ),
        ),
      ),
    );
  }
}
