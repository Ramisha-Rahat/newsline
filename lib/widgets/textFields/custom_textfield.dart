import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Color? cursorColor;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;

  const CustomTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.cursorColor,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: cursorColor ?? Theme.of(context).primaryColor,
      validator: validator,
      focusNode: focusNode,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        filled: backgroundColor != null,
        fillColor: backgroundColor,
        hintText: hint,
        labelText: label,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}

class CustomPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Color? cursorColor;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;

  const CustomPasswordField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.cursorColor,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      cursorColor: cursorColor ?? Theme.of(context).primaryColor,
      validator: validator,
      focusNode: focusNode,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        filled: backgroundColor != null,
        fillColor: backgroundColor,
        hintText: hint,
        labelText: label,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
