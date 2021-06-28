import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton(
      {required this.icon, required this.onPressed, required this.color});

  final IconData icon;
  final onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}
