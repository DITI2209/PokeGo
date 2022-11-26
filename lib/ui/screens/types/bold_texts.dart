import 'package:flutter/material.dart';
import 'package:pokego/configs/colors.dart';

class BoldText extends StatelessWidget {
  const BoldText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.whiteGrey, shadows: [
        Shadow(
            offset: Offset(-1, -1),
            color: Colors.black),
        Shadow(
            offset: Offset(1, -1),
            color: Colors.black),
        Shadow(
            offset: Offset(1, 1),
            color: Colors.black),
        Shadow(
            offset: Offset(-1, 1),
            color: Colors.black),
      ]),
      textAlign: TextAlign.center,
    );
  }
}
