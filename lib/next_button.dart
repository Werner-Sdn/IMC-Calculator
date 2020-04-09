import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NextButton extends StatelessWidget {
  final String text;
  final Color color;

  NextButton({@required this.text, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: AutoSizeText(
          text,
          style: TextStyle(
            fontSize: 32,
            letterSpacing: 8,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
