import 'package:flutter/material.dart';
import 'package:com/shared/constants/color.dart';

class SimpleActionButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  SimpleActionButton({@required this.icon, @required this.onPressed});

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
