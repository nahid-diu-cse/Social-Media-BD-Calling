import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;
  final TextStyle? style;

  const CustomText({
    super.key,
    required this.title,
    this.fontSize = 12,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.decoration = TextDecoration.none,
    this.decorationColor = Colors.deepOrangeAccent,
    this.decorationThickness = 2,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.maxLines,
    this.letterSpacing,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: style ?? TextStyle(
        fontFamily: 'SFPRODISPLAYREGULAR', // Use the custom font
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
        letterSpacing: letterSpacing,
      ),
    );
  }
}