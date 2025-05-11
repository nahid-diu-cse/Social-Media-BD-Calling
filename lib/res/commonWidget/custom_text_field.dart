import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.height,
    this.borderSide,
    this.fillColor,
    this.filled,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.minHeight,
    this.controller,
    this.textStyle,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
    this.textAlign,
    this.contentPadding,
    this.onChanged,
    this.enabled, this.hintStyle,
  });

  final TextStyle? hintStyle;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final double? width;
  final double? height;
  final double? minHeight;
  final BorderSide? borderSide;

  final Color? fillColor;
  final bool? filled;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;

  final TextEditingController? controller;
  final TextStyle? textStyle;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onChanged;
  final bool? enabled;

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

    return Container(
      constraints: BoxConstraints(
        minHeight: minHeight ?? 44,
        maxHeight: height ?? double.infinity,
      ),
      width: width,
      child: TextFormField(
        controller: controller,
        style: textStyle,
        maxLines: maxLines,
        minLines: minLines,
        keyboardType: keyboardType,
        textAlign: textAlign ?? TextAlign.start,
        enabled: enabled,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: filled ?? (fillColor != null),
          fillColor: fillColor,
          focusedBorder: _border,
          enabledBorder: _border,
          disabledBorder: _border,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_radius),
            borderSide: borderSide ?? BorderSide(color: Colors.red),
          ),
          contentPadding:
          contentPadding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),
      ),
    );
  }
}
