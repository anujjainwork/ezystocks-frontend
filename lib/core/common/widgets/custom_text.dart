import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign alignment;
  final String fontFamily;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14.0,
    this.alignment = TextAlign.start,
    this.fontFamily = 'Inter'
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
