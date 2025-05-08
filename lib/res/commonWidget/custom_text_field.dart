import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.borderSide,
    this.fillColor,
    this.filled,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
  });

  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final double? width;
  final BorderSide? borderSide;

  // 🔸 New Customization Options
  final Color? fillColor;
  final bool? filled;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    final _radius = borderRadius ?? 8.0;
    final _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(
        color: borderColor ?? Colors.grey,
        width: borderWidth ?? 1.0,
      ),
    );

    return SizedBox(
      height: 44,
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: filled ?? (fillColor != null),
          fillColor: fillColor,
          focusedBorder: _border,
          enabledBorder: _border,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_radius),
            borderSide: borderSide ?? BorderSide(color: Colors.red),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),

      ),
    );
  }
}
