import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:com/shared/constants/text.dart';

enum Gender {
  male,
  female,
}

class GenderInfo extends StatelessWidget {
  final LayoutBuilder maleIcon = LayoutBuilder(builder: (context, constraint) {
    return Icon(
      FontAwesomeIcons.mars,
      size: constraint.biggest.height,
      color: Colors.white,
    );
  });
  final LayoutBuilder femaleIcon = LayoutBuilder(
    builder: (context, constraint) {
      return Icon(
        FontAwesomeIcons.venus,
        size: constraint.biggest.height,
        color: Colors.white,
      );
    },
  );

  final LayoutBuilder genderIcon;
  final String genderText;

  GenderInfo({this.genderIcon, this.genderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          flex: 6,
          child: genderIcon,
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: AutoSizeText(
              genderText,
              style: kTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
