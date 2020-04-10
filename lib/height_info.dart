import 'package:flutter/material.dart';
import 'shared.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HeightSlider extends StatelessWidget {
  final int height;
  final Function onChanged;

  HeightSlider({@required this.height, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.white,
        inactiveTrackColor: kActiveInputColor,
        thumbColor: kDeepBlue,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
        overlayColor: Color(0x703540A4),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
      ),
      child: Slider(
        value: height.toDouble(),
        min: 120,
        max: 210,
        onChanged: onChanged,
      ),
    );
  }
}

class HeightText extends StatelessWidget {
  final int height;

  HeightText({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: AutoSizeText(
              height.toString(),
              style: kDigitStyle,
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: AutoSizeText(
              'cm',
              style: kTextStyle.copyWith(
                letterSpacing: 1,
              ),
            ),
          ),
        )
      ],
    );
  }
}
