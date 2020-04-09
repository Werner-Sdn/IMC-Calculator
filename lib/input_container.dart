import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  InputContainer({@required this.color, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.0,
            color: Colors.white,
          )),
      child: child,
    );
  }
}
