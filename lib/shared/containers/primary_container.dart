import 'package:flutter/material.dart';

class PrimaryContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;

  PrimaryContainer({@required this.color, this.child, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
