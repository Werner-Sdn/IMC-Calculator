import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:com/shared/constants/text.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Color color;

  BottomButton({@required this.text, @required this.color});

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
