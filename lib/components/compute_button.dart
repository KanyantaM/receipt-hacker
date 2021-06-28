import 'package:flutter/material.dart';
import '../constants.dart';

class ComputeButton extends StatelessWidget {
  ComputeButton({required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: Colors.green,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 70.0,
      ),
    );
  }
}
