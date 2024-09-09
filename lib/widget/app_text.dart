import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
        required this.text,
        this.color = Colors.black,
        this.fontSize = 14,
        this.fontWeight,
        this.decoration,
        this.maxLines});
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        decorationThickness: 2,
        //overflow: TextOverflow.ellipsis
      ),
    );
  }
}